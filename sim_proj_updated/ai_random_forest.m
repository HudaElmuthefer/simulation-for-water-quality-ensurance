%% ai_random_forest.m
clc;
% فتح ملف البيانات
data_file = 'test.xlsx';
sheet_name = 'Sheet1';

% قائمة المتغيرات والاعمدة
cols = {'PH','B'; 'Temp','C'; 'DO','D'; 'PO4','E'; 'NO3','F'; ...
        'Ca','G'; 'Mg','H'; 'TH','I'; 'K','J'; 'Na','K'; ...
        'SO4','L'; 'CL','M'; 'TDS','N'; 'Ec','O'; 'ALK','P'; ...
        'TUR','Q'; 'TPC','R'; 'coliform','S'; 'Ecoli','T'};

n_params = size(cols, 1);
[~, raw_months] = xlsread(data_file, sheet_name, 'A2:A19');
n_samples = numel(raw_months);
data_matrix = zeros(n_samples, n_params);
names = cell(1, n_params);

% قراءة البيانات
for k = 1:n_params
    names{k} = cols{k, 1};
    col_char = cols{k, 2};
    data_matrix(:, k) = xlsread(data_file, sheet_name, sprintf('%s2:%s19', col_char, col_char));
end

% حساب مؤشر جودة المياه (WQI)
% المعايير المرجعية
ref_values.Temp = 15; ref_values.PO4 = 0.5; ref_values.NO3 = 50; ref_values.Ca = 75;
ref_values.Mg = 30; ref_values.TH = 150; ref_values.K = 12; ref_values.Na = 200;
ref_values.SO4 = 250; ref_values.CL = 250; ref_values.TDS = 1000; ref_values.Ec = 1500;
ref_values.ALK = 200; ref_values.TUR = 5; ref_values.TPC = 100; ref_values.coliform = 20;

targets = {'Temp','PO4','NO3','Ca','Mg','TH','K','Na','SO4','CL','TDS','Ec','ALK','TUR','TPC','coliform'};
n_wqi = numel(targets);
S_vals = zeros(1, n_wqi);
idx_map = zeros(1, n_wqi);

for k = 1:n_wqi
    S_vals(k) = ref_values.(targets{k});
    idx_map(k) = find(strcmp(names, targets{k}));
end

% الاوزان النسبية
weights = (1 ./ S_vals) / sum(1 ./ S_vals);
wqi_results = zeros(n_samples, 1);

for i = 1:n_samples
    q_vals = (data_matrix(i, idx_map) ./ S_vals) * 100;
    wqi_results(i) = sum(weights .* q_vals);
end

% تصنيف الجودة
labels = cell(n_samples, 1);
for i = 1:n_samples
    if wqi_results(i) < 50
        labels{i} = 'Excellent';
    elseif wqi_results(i) < 100
        labels{i} = 'Good';
    elseif wqi_results(i) < 200
        labels{i} = 'Poor';
    else
        labels{i} = 'Very Poor';
    end
end

% تدريب النموذج
clear rng   % remove any variable named 'rng' that may shadow MATLAB's built-in rng function
rng(2024);
n_trees = 100;
model = TreeBagger(n_trees, data_matrix, labels, ...
    'Method', 'classification', ...
    'OOBPredictorImportance', 'on', ...
    'PredictorNames', names);

% استخراج النتائج وحفظها
imp_scores = model.OOBPermutedPredictorDeltaError;
result_table = table(names', imp_scores', 'VariableNames', {'Feature', 'Score'});
result_table = sortrows(result_table, 'Score', 'descend');
writetable(result_table, 'ai_feature_importance.xlsx');

% توقع الحالة القادمة
current_state = data_matrix(end, :);
[predicted_class, ~] = predict(model, current_state);

% الرسم البياني
figure;
barh(result_table.Score);
set(gca, 'YTickLabel', result_table.Feature);
oobErr = oobError(model);
oobAccuracy = 100 * (1 - oobErr(end));
title('Random Forest Feature Importance for WQI Classification');
subtitle(sprintf('OOB Accuracy: %.2f%%', oobAccuracy));
saveas(gcf, 'figure5_rf_importance.png');

figure;
plot(oobError(model));
title('Model Training Error');
saveas(gcf, 'figure6_rf_learning_curve.png');