clc;
% define Excelfile
filename = 'test.xlsx';
sheetname = 'Sheet1';

range_month = 'A2:A19';
range_ph = 'B2:B19';
range_temp = 'C2:C19';
range_do = 'D2:D19';
range_Po4 = 'E2:E19';
range_NO3 = 'F2:F19';
range_Ca = 'G2:G19';
range_Mg = 'H2:H19';
range_TH = 'I2:I19';
range_K = 'J2:J19';
range_Na = 'K2:K19';
range_SO4 = 'L2:L19';
range_Cl = 'M2:M19';
range_TDS = 'N2:N19';
range_EC = 'O2:O19';
range_ALK = 'P2:P19';
range_TUR = 'Q2:Q19';
range_TPC = 'R2:R19';
range_coliform = 'S2:S19';
range_Ecoli = 'T2:T19';

month = xlsread(filename, sheetname, range_month);
ph = xlsread(filename, sheetname, range_ph);
temp = xlsread(filename, sheetname, range_temp);
do = xlsread(filename, sheetname, range_do);
SO4 = xlsread(filename, sheetname, range_SO4);
po4 = xlsread(filename, sheetname, range_Po4);
NO3 = xlsread(filename, sheetname, range_NO3);
Ca = xlsread(filename, sheetname, range_Ca);
Mg = xlsread(filename, sheetname, range_Mg);
TH = xlsread(filename, sheetname, range_TH);
K = xlsread(filename, sheetname, range_K);
Na= xlsread(filename, sheetname, range_Na);
Cl = xlsread(filename, sheetname, range_Cl);
TDS = xlsread(filename, sheetname, range_TDS);
EC = xlsread(filename, sheetname, range_EC);
ALK = xlsread(filename, sheetname, range_ALK);
TUR = xlsread(filename, sheetname, range_TUR);
TPC = xlsread(filename, sheetname, range_TPC);
coliform = xlsread(filename, sheetname, range_coliform);
Ecoli = xlsread(filename, sheetname, range_Ecoli);


% define who
max_ph = xlsread('who.xlsx', 'Sheet1', 'C3');
min_ph = xlsread('who.xlsx', 'Sheet1', 'D3');
max_temp = xlsread('who.xlsx', 'Sheet1', 'C4');
min_temp = xlsread('who.xlsx', 'Sheet1', 'D4');
max_do = xlsread('who.xlsx', 'Sheet1', 'C5');
min_do = xlsread('who.xlsx', 'Sheet1', 'D5');
max_PO4 = xlsread('who.xlsx', 'Sheet1', 'C6');
min_PO4 = xlsread('who.xlsx', 'Sheet1', 'D6');
max_NO3 = xlsread('who.xlsx', 'Sheet1', 'C7');
min_NO3 = xlsread('who.xlsx', 'Sheet1', 'D7');
max_Ca = xlsread('who.xlsx', 'Sheet1', 'C8');
min_Ca = xlsread('who.xlsx', 'Sheet1', 'D8');
max_Mg = xlsread('who.xlsx', 'Sheet1', 'C9');
min_Mg = xlsread('who.xlsx', 'Sheet1', 'D9');
max_TH = xlsread('who.xlsx', 'Sheet1', 'C10');
min_TH = xlsread('who.xlsx', 'Sheet1', 'D10');
max_K = xlsread('who.xlsx', 'Sheet1', 'C11');
min_K = xlsread('who.xlsx', 'Sheet1', 'D11');
max_Na = xlsread('who.xlsx', 'Sheet1', 'C12');
min_Na = xlsread('who.xlsx', 'Sheet1', 'D12');
max_SO4 = xlsread('who.xlsx', 'Sheet1', 'C13');
min_SO4 = xlsread('who.xlsx', 'Sheet1', 'D13');
max_Cl = xlsread('who.xlsx', 'Sheet1', 'C14');
min_Cl = xlsread('who.xlsx', 'Sheet1', 'D14');
max_TDS = xlsread('who.xlsx', 'Sheet1', 'C15');
min_TDS = xlsread('who.xlsx', 'Sheet1', 'D15');
max_EC = xlsread('who.xlsx', 'Sheet1', 'C16');
min_EC = xlsread('who.xlsx', 'Sheet1', 'D16');
max_ALK = xlsread('who.xlsx', 'Sheet1', 'C17');
min_ALK = xlsread('who.xlsx', 'Sheet1', 'D17');
max_TUR = xlsread('who.xlsx', 'Sheet1', 'C18');
min_TUR = xlsread('who.xlsx', 'Sheet1', 'D18');
max_TPC = xlsread('who.xlsx', 'Sheet1', 'C19');
min_TPC = xlsread('who.xlsx', 'Sheet1', 'D19');
max_coliform = xlsread('who.xlsx', 'Sheet1', 'C20');
min_coliform = xlsread('who.xlsx', 'Sheet1', 'D20');
max_Ecoli = xlsread('who.xlsx', 'Sheet1', 'C21');
min_Ecoli = xlsread('who.xlsx', 'Sheet1', 'D21');

% Source month labels (column A) are Arabic text, not numeric dates, so
% xlsread cannot return them as a plottable axis. Use a 1..N month index
% for the x-axis of every panel below instead.
month_idx = (1:numel(TDS))';

%% ===================== Figure 1: Major dissolved salts vs WHO limits =====================
% TDS, Sulphate, Chloride, Sodium - required order: top-left to bottom-right
figure('Name', 'Major Dissolved Salts', 'Position', [100 100 900 650]);

subplot(2,2,1);
plotPanel(month_idx, TDS, 'TDS (mg/L)', 'TDS (mg/L)', max_TDS, sprintf('WHO limit (%g mg/L)', max_TDS), [], '');

subplot(2,2,2);
plotPanel(month_idx, SO4, 'Sulphate - SO4 (mg/L)', 'SO4 (mg/L)', max_SO4, sprintf('WHO limit (%g mg/L)', max_SO4), [], '');

subplot(2,2,3);
plotPanel(month_idx, Cl, 'Chloride - Cl (mg/L)', 'Cl (mg/L)', max_Cl, sprintf('WHO limit (%g mg/L)', max_Cl), [], '');

subplot(2,2,4);
plotPanel(month_idx, Na, 'Sodium - Na (mg/L)', 'Na (mg/L)', max_Na, sprintf('WHO limit (%g mg/L)', max_Na), [], '');

print(gcf, 'fig1_TDS_SO4_Cl_Na.png', '-dpng', '-r300');

%% ===================== Figure 2: Major ions =====================
% Calcium, Magnesium, Total Hardness, Potassium
figure('Name', 'Major Ions', 'Position', [100 100 900 650]);

subplot(2,2,1);
plotPanel(month_idx, Ca, 'Calcium - Ca (mg/L)', 'Ca (mg/L)', max_Ca, sprintf('WHO limit (%g mg/L)', max_Ca), [], '');

subplot(2,2,2);
plotPanel(month_idx, Mg, 'Magnesium - Mg (mg/L)', 'Mg (mg/L)', max_Mg, sprintf('WHO limit (%g mg/L)', max_Mg), [], '');

subplot(2,2,3);
plotPanel(month_idx, TH, 'Total Hardness (mg/L)', 'TH (mg/L)', max_TH, sprintf('WHO limit (%g mg/L)', max_TH), [], '');

subplot(2,2,4);
plotPanel(month_idx, K, 'Potassium - K (mg/L)', 'K (mg/L)', max_K, sprintf('WHO limit (%g mg/L)', max_K), [], '');

print(gcf, 'fig2_major_ions.png', '-dpng', '-r300');

%% ===================== Figure 3: Physical parameters =====================
% pH, Temperature, Dissolved Oxygen, Electrical Conductivity, Alkalinity, Turbidity
figure('Name', 'Physical Parameters', 'Position', [80 80 1300 700]);

subplot(2,3,1);
plotPanel(month_idx, ph, 'pH', 'pH', max_ph, sprintf('WHO max (%g)', max_ph), min_ph, sprintf('WHO min (%g)', min_ph));

subplot(2,3,2);
plotPanel(month_idx, temp, 'Temperature (\circC)', 'Temperature (\circC)', max_temp, sprintf('WHO limit (%g \\circC)', max_temp), [], '');

subplot(2,3,3);
plotPanel(month_idx, do, 'Dissolved Oxygen - DO (mg/L)', 'DO (mg/L)', [], '', min_do, sprintf('WHO min (%g mg/L)', min_do));

subplot(2,3,4);
plotPanel(month_idx, EC, 'Electrical Conductivity - EC (\muS/cm)', 'EC (\muS/cm)', max_EC, sprintf('WHO limit (%g \\muS/cm)', max_EC), [], '');

subplot(2,3,5);
plotPanel(month_idx, ALK, 'Alkalinity (mg/L)', 'ALK (mg/L)', max_ALK, sprintf('WHO limit (%g mg/L)', max_ALK), [], '');

subplot(2,3,6);
plotPanel(month_idx, TUR, 'Turbidity (NTU)', 'Turbidity (NTU)', max_TUR, sprintf('WHO limit (%g NTU)', max_TUR), [], '');

print(gcf, 'fig3_physical_parameters.png', '-dpng', '-r300');

%% ===================== Figure 4: Nutrients =====================
% Phosphate, Nitrate
figure('Name', 'Nutrients', 'Position', [100 100 900 400]);

subplot(1,2,1);
plotPanel(month_idx, po4, 'Phosphate - PO4 (mg/L)', 'PO4 (mg/L)', max_PO4, sprintf('WHO limit (%g mg/L)', max_PO4), [], '');

subplot(1,2,2);
plotPanel(month_idx, NO3, 'Nitrate - NO3 (mg/L)', 'NO3 (mg/L)', max_NO3, sprintf('WHO limit (%g mg/L)', max_NO3), [], '');

print(gcf, 'fig4_nutrients.png', '-dpng', '-r300');

%% ===================== Figure 5: Microbiological indicators =====================
% Total Plate Count, Total Coliform, E. coli
figure('Name', 'Microbiological Indicators', 'Position', [100 100 1300 400]);

subplot(1,3,1);
plotPanel(month_idx, TPC, 'Total Plate Count (CFU/mL)', 'TPC (CFU/mL)', max_TPC, sprintf('WHO limit (%g CFU/mL)', max_TPC), [], '');

subplot(1,3,2);
plotPanel(month_idx, coliform, 'Total Coliform (count)', 'Coliform (count)', max_coliform, sprintf('WHO limit (%g)', max_coliform), [], '');

subplot(1,3,3);
plotPanel(month_idx, Ecoli, 'E. coli (count)', 'E. coli (count)', max_Ecoli, sprintf('WHO limit (%g)', max_Ecoli), [], '');

print(gcf, 'fig5_microbiological.png', '-dpng', '-r300');

%% ===================== Local helper =====================
function plotPanel(monthVec, y, titleStr, ylabelStr, maxVal, maxLabel, minVal, minLabel)
% Draw one parameter panel (value vs. month) with dashed WHO limit line(s).
plot(monthVec, y, '-o', 'Color', [0 0.4470 0.7410], 'LineWidth', 1.2, 'MarkerSize', 4);
hold on;
if ~isempty(maxVal)
    yline(maxVal, '--r', maxLabel, 'FontSize', 9, 'LabelHorizontalAlignment', 'left');
end
if ~isempty(minVal)
    yline(minVal, '--r', minLabel, 'FontSize', 9, 'LabelHorizontalAlignment', 'left');
end
hold off;
title(titleStr, 'FontSize', 11, 'FontWeight', 'bold');
xlabel('Month', 'FontSize', 10);
ylabel(ylabelStr, 'FontSize', 10);
set(gca, 'FontSize', 9);
grid on;
box on;

% Pad the y-range so WHO limit line(s)/labels never sit on the axis border
boundVals = y(:);
if ~isempty(maxVal), boundVals = [boundVals; maxVal]; end
if ~isempty(minVal), boundVals = [boundVals; minVal]; end
yLo = min(boundVals);
yHi = max(boundVals);
pad = 0.1 * (yHi - yLo);
if pad == 0, pad = max(1, 0.1 * abs(yHi)); end
ylim([yLo - pad, yHi + pad]);
end
