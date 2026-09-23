%% priority_analysis.m
clc; clear;
% تحديد ملفات البيانات والمعايير
dataFile = 'test.xlsx';
whoFile  = 'who.xlsx';
sheet    = 'Sheet1';

% معلومات البارامترات (الاسم, العمود, سطر المعايير, نوع القياس)
% FIX: display names cleaned to match Table 2 style in the manuscript
% (CL->Cl, Ec->EC, coliform->Coliform, Ecoli->'E. coli', PH->pH)
paramInfo = { ...
    'pH',       'B', 3,  'range'; ...
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
    'Cl',       'M', 14, 'max'; ...
    'TDS',      'N', 15, 'max'; ...
    'EC',       'O', 16, 'max'; ...
    'ALK',      'P', 17, 'max'; ...
    'TUR',      'Q', 18, 'max'; ...
    'TPC',      'R', 19, 'max'; ...
    'Coliform', 'S', 20, 'max'; ...
    'E. coli',  'T', 21, 'max' ...
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
% FIX: for 'range' parameters (pH), also count exceedance BELOW the
% minimum limit, not only above the maximum - previously only the
% above-max side was computed, silently dropping any low-pH violations
meanExc = zeros(np, 1); maxExc = zeros(np, 1);
for i = 1:np
    x = allData(:, i);
    if maxLimit(i) == 0, continue; end
    if strcmp(directions{i}, 'min')
        exc = max(0, (maxLimit(i) - x) ./ maxLimit(i) * 100);
    elseif strcmp(directions{i}, 'range') && ~isnan(minLimit(i))
        excHigh = max(0, (x - maxLimit(i)) ./ maxLimit(i) * 100);
        excLow  = max(0, (minLimit(i) - x) ./ minLimit(i) * 100);
        exc = max(excHigh, excLow);
    else
        exc = max(0, (x - maxLimit(i)) ./ maxLimit(i) * 100);
    end
    viol = exc(exc > 0);
    if isempty(viol)
    meanExc(i) = 0;
else
    meanExc(i) = mean(viol);
end
    maxExc(i) = max(exc);
end
severityT = table(string(paramNames), meanExc, maxExc, ...
    'VariableNames', {'Parameter', 'MeanExceedance', 'MaxExceedance'});
severityT = sortrows(severityT, 'MeanExceedance', 'descend');

figure; bar(severityT.Parameter, severityT.MeanExceedance);
title('Severity-Based Ranking by Exceedance Magnitude at Point E17');
ylabel('Mean exceedance over WHO limit (%)'); xtickangle(45);
% FIX: export at 300 dpi (journal requirement) instead of saveas default
exportgraphics(gcf, 'figure3_severity_ranking.png', 'Resolution', 300);

fprintf('=== ترتيب الشدة ===\n');
disp(severityT);
writetable(severityT, 'severity_ranking.xlsx');

% تحليل الاتجاه (Mann-Kendall + Theil-Sen slope)
% FIX: the Slope column was previously hardcoded to 0 for every parameter.
% Theil-Sen slope is now computed as the median of all pairwise rates of
% change (x(j)-x(k))/(j-k), matching Table 3 in the manuscript.
trendRows = cell(np, 6);
for i = 1:np
    x = allData(:, i);
    S = 0;
    slopes = [];
    for k = 1:n-1
        for j = k+1:n
            S = S + sign(x(j) - x(k));
            slopes(end+1) = (x(j) - x(k)) / (j - k); %#ok<AGROW>
        end
    end
    senSlope = median(slopes);
    Z = S / sqrt(n*(n-1)*(2*n+5)/18);
    p = 2 * (1 - normcdf(abs(Z)));
    if p < 0.05 && Z > 0
        trendStr = 'increasing';
    elseif p < 0.05 && Z < 0
        trendStr = 'decreasing';
    else
        trendStr = 'no trend';
    end
    trendRows(i, :) = {paramNames{i}, S, Z, p, trendStr, senSlope};
end
writetable(cell2table(trendRows, 'VariableNames', {'Parameter', 'S', 'Z', 'p', 'Trend', 'Slope'}), 'trend_data.xlsx');

% FIX: removed the redundant, Arabic-titled duplicate Pareto figure that
% was plotted here at the end of the script - Figure 2 already covers
% this exact chart in English, so this second copy served no purpose
% and violated the journal's English-only requirement.

fprintf('\n=== تم حفظ جميع النتائج في ملفات إكسل ===\n');