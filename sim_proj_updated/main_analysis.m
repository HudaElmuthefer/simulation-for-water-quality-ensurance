%% priority_analysis.m
clc; clear;
% تحديد ملفات البيانات والمعايير
dataFile = 'test.xlsx';
whoFile  = 'who.xlsx';
sheet    = 'Sheet1';

% معلومات البارامترات (الاسم، العمود، سطر المعايير، نوع القياس)
paramInfo = { ...
    'PH',       'B', 3,  'range'; ...
    'Temp',     'C', 4,  'max'; ...
    'DO',       'D', 5,  'min'; ...
    'PO4',      'E', 6,  'max'; ...
    'NO3',      'F', 7,  'max'; ...
    'Ca',       'G', 8,  'max'; ...
    'Mg',       'H', 9,  'max'; ...
    'TH',       'I', 10, 'max'; ...
    'K',        'J', 11, 'max'; ...
    'Na',       'K', 12, 'max'; ...
    'SO4',      'L', 13, 'max'; ...
    'CL',       'M', 14, 'max'; ...
    'TDS',      'N', 15, 'max'; ...
    'Ec',       'O', 16, 'max'; ...
    'ALK',      'P', 17, 'max'; ...
    'TUR',      'Q', 18, 'max'; ...
    'TPC',      'R', 19, 'max'; ...
    'coliform', 'S', 20, 'max'; ...
    'Ecoli',    'T', 21, 'max' ...
};

np = size(paramInfo, 1);
[~, months] = xlsread(dataFile, sheet, 'A2:A19');
n = numel(months);
fprintf('تم تحميل %d أشهر لـ %d بارامتر.\n\n', n, np);

allData = zeros(n, np);
maxLimit = zeros(np, 1);
minLimit = NaN(np, 1);
directions = cell(np, 1);
paramNames = cell(np, 1);

% قراءة البيانات والحدود
for i = 1:np
    name = paramInfo{i, 1};
    col  = paramInfo{i, 2};
    wRow = paramInfo{i, 3};
    dir  = paramInfo{i, 4};
    paramNames{i} = name;
    directions{i} = dir;
    allData(:, i) = xlsread(dataFile, sheet, sprintf('%s2:%s19', col, col));
    maxLimit(i) = xlsread(whoFile, sheet, sprintf('C%d', wRow));
    mv = xlsread(whoFile, sheet, sprintf('D%d', wRow));
    if ~isempty(mv)
        minLimit(i) = mv;
    end
end

% حساب عدد مرات التجاوز
counts = zeros(np, 1);
for i = 1:np
    x = allData(:, i);
    switch directions{i}
        case 'min'
            mask = x < maxLimit(i);
        case 'range'
            if isnan(minLimit(i))
                mask = x > maxLimit(i);
            else
                mask = (x > maxLimit(i)) | (x < minLimit(i));
            end
        otherwise
            mask = x > maxLimit(i);
    end
    counts(i) = sum(mask);
end

% تحليلات إحصائية (مونتي كارلو وويلسون)
probs = counts / n;
numSim = 1000; rng(2024);
mcMean = zeros(np, 1); ciLo = zeros(np, 1); ciHi = zeros(np, 1);
wilsonLo = zeros(np, 1); wilsonHi = zeros(np, 1);
z = 1.959963984540054;
for i = 1:np
    p = probs(i);
    draws = binornd(n, p, numSim, 1);
    mcMean(i) = mean(draws);
    ciLo(i) = prctile(draws, 2.5);
    ciHi(i) = prctile(draws, 97.5);
    denom = 1 + z^2 / n;
    center = (p + z^2 / (2 * n)) / denom;
    hw = (z * sqrt((p * (1 - p) / n) + z^2 / (4 * n^2))) / denom;
    wilsonLo(i) = max(0, center - hw) * 100;
    wilsonHi(i) = min(1, center + hw) * 100;
end

% إنشاء جدول باريتو
Percent = counts / n * 100;
paretoT = table(string(paramNames), counts, Percent, mcMean, ciLo, ciHi, wilsonLo, wilsonHi, ...
    'VariableNames', {'Parameter', 'Count', 'Percent', 'MC_Mean', 'MC_CI_Lower', 'MC_CI_Upper', 'Wilson_CI_Lower', 'Wilson_CI_Upper'});
paretoT = sortrows(paretoT, 'Count', 'descend');
paretoT.Cumulative_pct = cumsum(paretoT.Percent) / sum(paretoT.Percent) * 100;

fprintf('=== جدول باريتو (مع إحصائيات مونتي كارلو) ===\n');
disp(paretoT);
writetable(paretoT, 'priority_stats.xlsx');

% اختبار مربع كاي
expected = repmat(sum(counts) / np, size(counts));
chi2 = sum((counts - expected).^2 ./ expected);
pval = 1 - chi2cdf(chi2, np - 1);
fprintf('\n=== اختبار مربع كاي للتوزيع ===\n');
fprintf('القيمة p = %.6g\n', pval);
if pval < 0.05
    fprintf('=> التوزيع غير منتظم: ترتيب الباريتو مدعوم إحصائياً.\n\n');
end

% حساب شدة التجاوز
meanExc = zeros(np, 1); maxExc = zeros(np, 1);
for i = 1:np
    x = allData(:, i);
    if maxLimit(i) == 0, continue; end
    if strcmp(directions{i}, 'min')
        exc = max(0, (maxLimit(i) - x) ./ maxLimit(i) * 100);
    else
        exc = max(0, (x - maxLimit(i)) ./ maxLimit(i) * 100);
    end
    viol = exc(exc > 0);
    meanExc(i) = ifelse(isempty(viol), 0, mean(viol));
    maxExc(i) = max(exc);
end
severityT = table(string(paramNames), meanExc, maxExc, ...
    'VariableNames', {'Parameter', 'MeanExceedance', 'MaxExceedance'});
severityT = sortrows(severityT, 'MeanExceedance', 'descend');
fprintf('=== ترتيب الشدة ===\n');
disp(severityT);
writetable(severityT, 'severity_ranking.xlsx');

% تحليل الاتجاه (Mann-Kendall)
trendRows = cell(np, 6);
for i = 1:np
    x = allData(:, i);
    S = 0;
    for k = 1:n-1
        for j = k+1:n, S = S + sign(x(j) - x(k)); end
    end
    Z = S / sqrt(n*(n-1)*(2*n+5)/18);
    p = 2 * (1 - normcdf(abs(Z)));
    trendStr = ifelse(p < 0.05 && Z > 0, 'increasing', ifelse(p < 0.05 && Z < 0, 'decreasing', 'no trend'));
    trendRows(i, :) = {paramNames{i}, S, Z, p, trendStr, 0};
end
writetable(cell2table(trendRows, 'VariableNames', {'Parameter', 'S', 'Z', 'p', 'Trend', 'Slope'}), 'trend_data.xlsx');

% الرسم البياني
figure('Name', 'Pareto Analysis');
bar(paretoT.Count); xticks(1:np); xticklabels(paretoT.Parameter); xtickangle(45);
title('تحليل باريتو'); grid on;

fprintf('\n=== تم حفظ جميع النتائج في ملفات إكسل ===\n');