filename = 'test.xlsx';
sheet = 'Sheet1';
whoFile = 'who.xlsx';

cols = {'PH','B'; 'Temp','C'; 'DO','D'; 'PO4','E'; 'NO3','F'; 'Ca','G'; 'Mg','H'; 'TH','I'; ...
        'K','J'; 'Na','K'; 'SO4','L'; 'CL','M'; 'TDS','N'; 'Ec','O'; 'ALK','P'; 'TUR','Q'; ...
        'TPC','R'; 'coliform','S'; 'Ecoli','T'};
whoRows = {'PH',3; 'Temp',4; 'DO',5; 'PO4',6; 'NO3',7; 'Ca',8; 'Mg',9; 'TH',10; ...
           'K',11; 'Na',12; 'SO4',13; 'CL',14; 'TDS',15; 'Ec',16; 'ALK',17; 'TUR',18; ...
           'TPC',19; 'coliform',20; 'Ecoli',21};

[~, months] = xlsread(filename, sheet, 'A2:A19');
n = numel(months);

data = struct();
for i = 1:size(cols,1)
    name = cols{i,1}; col = cols{i,2};
    rng = sprintf('%s2:%s19', col, col);
    data.(name) = xlsread(filename, sheet, rng);
end

lims = struct();
for i = 1:size(whoRows,1)
    name = whoRows{i,1}; r = whoRows{i,2};
    lims.(name) = xlsread(whoFile, sheet, sprintf('C%d', r));
end

excluded = {'PH','DO','Ecoli'};
allNames = cols(:,1)';
inclNames = setdiff(allNames, excluded, 'stable');

Si = zeros(1, numel(inclNames));
for i = 1:numel(inclNames)
    Si(i) = lims.(inclNames{i});
end
K = 1 / sum(1 ./ Si);
Wi = K ./ Si;

wqi = zeros(1, n);
for t = 1:n
    q = zeros(1, numel(inclNames));
    for i = 1:numel(inclNames)
        q(i) = (data.(inclNames{i})(t) / Si(i)) * 100;
    end
    wqi(t) = sum(Wi .* q) / sum(Wi);
end

wqiClass = strings(1, n);
for t = 1:n
    if wqi(t) < 50
        wqiClass(t) = "Excellent";
    elseif wqi(t) < 100
        wqiClass(t) = "Good";
    elseif wqi(t) < 200
        wqiClass(t) = "Poor";
    elseif wqi(t) < 300
        wqiClass(t) = "Very Poor";
    else
        wqiClass(t) = "Unsuitable for drinking";
    end
end

fprintf('--- Monthly Water Quality Index (WQI) ---\n');
for t = 1:n
    fprintf('%-20s WQI = %6.1f  (%s)\n', string(months(t)), wqi(t), wqiClass(t));
end
fprintf('\nMean WQI = %.1f (range %.1f - %.1f)\n', mean(wqi), min(wqi), max(wqi));

wqiTable = table(string(months), wqi', wqiClass', 'VariableNames', {'Month','WQI','Class'});

writetable(wqiTable, 'water_quality_index.xlsx');

ylimMax = max(330, max(wqi) * 1.10);

figure('Name', 'WQI trend');
hold on;

thresholds = [50, 100, 200, 300];
thresholdColors = {[0.15 0.68 0.38], [0.95 0.61 0.07], [0.90 0.49 0.13], [0.75 0.22 0.17]};
thresholdLabels = {'Excellent/Good', 'Good/Poor', 'Poor/Very Poor', 'Very Poor/Unsuitable'};

for i = 1:numel(thresholds)
    plot([0.5 n + 0.5], [thresholds(i) thresholds(i)], 'LineWidth', 2, ...
        'Color', thresholdColors{i});
    text(n + 0.3, thresholds(i), thresholdLabels{i}, 'FontSize', 9.5, ...
        'FontWeight', 'bold', 'Color', thresholdColors{i}, 'VerticalAlignment', 'middle');
end

plot(1:n, wqi, '-o', 'LineWidth', 2.5, 'Color', [0.10 0.10 0.35], ...
    'MarkerFaceColor', 'w', 'MarkerSize', 6.5);

xlim([0.5 n + 2.5]);
ylim([0 ylimMax]);
xticks(1:n);
xticklabels(months);
xtickangle(60);
ylabel('WQI', 'FontSize', 11);
title('Monthly Water Quality Index, Point E17', 'FontSize', 12, 'FontWeight', 'bold');
grid on;
grid minor;
