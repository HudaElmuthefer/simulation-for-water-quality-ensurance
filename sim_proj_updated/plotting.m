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


%Water Test plots
%PH plot
figure;

subplot(3,2,1);
xlim([0,20]);
ylim([0,10]);
plot(ph);
title('PH plot');
xlabel('month');
ylabel(' pH');

% Temp plot
subplot(3,2,2);
xlim([0,20]);
ylim([10,30]);
plot(temp);
title('Temp. plot ');
xlabel ('month');
ylabel('Tempreture');

%dissolved oxygen plot
subplot(3,2,3);
xlim([0,20]);
ylim([5,20]);
plot(do);
title('dissolved oxygen plot ');
xlabel ('month');
ylabel('dissolved oxygen');

% phosphates plot
subplot(3,2,4);
xlim([0,20]);
ylim([0,1]);
plot(po4);
title('phosphates plot ');
xlabel ('month');
ylabel('phosphates');

% nitrate plot
subplot(3,2,5);
xlim([0,20]);
ylim([0,50 ]);
plot(NO3);
title('nitrate plot ');
xlabel ('month');
ylabel('nitrate');

% Calcium plot
subplot(3,2,6);
xlim([0,20]);
ylim([100,400]);
plot(Ca);
title('Calcium plot ');
xlabel ('month');
ylabel('Calcium');

figure;
% magnesium plot
subplot(3,2,1);
xlim([0,20]);
ylim([100,250]);
plot(Mg);
title('magnesium');
xlabel('month');
ylabel(' magnesium');

% total hardness plot
subplot(3,2,2);
xlim([0,20]);
ylim([600,2000]);
plot(TH);
title('TH plot ');
xlabel ('month');
ylabel('total hardness');

% potassium plot
subplot(3,2,3);
xlim([0,20]);
ylim([0,35]);
plot(K);
title('potassium plot ');
xlabel ('month');
ylabel('potassium');

% sodium plot
subplot(3,2,4);
xlim([0,20]);
ylim([500,1000]);
plot(Na);
title('sodium plot ');
xlabel ('month');
ylabel('sodium');

% sulfate plot
subplot(3,2,5);
xlim([0,20]);
ylim([500,1100]);
plot(SO4);
title('sulfate plot ');
xlabel ('month');
ylabel('sulfate');

% chloride plot
subplot(3,2,6);
xlim([0,20]);
ylim([500,1500]);
plot(Cl);
title('Cl plot ');
xlabel ('month');
ylabel('chloride');

figure;
% total dissolved salts plot
subplot(3,2,1);
xlim([0,20]);
ylim([500,3000]);
plot(TDS);
title('TDS');
xlabel('month');
ylabel(' TDS');

%electrical conductivity plot
subplot(3,2,2);
xlim([0,20]);
ylim([1000,8000]);
plot(EC);
title('EC plot ');
xlabel ('month');
ylabel('EC');

% total alkalinity plot
subplot(3,2,3);
xlim([0,20]);
ylim([100,300]);
plot(ALK);
title('ALK plot ');
xlabel ('month');
ylabel('ALK');

% Turbidity plot
subplot(3,2,4);
xlim([0,20]);
ylim([1,40]);
plot(TUR);
title('Turbidity plot ');
xlabel ('month');
ylabel('TUR');

figure;
% The number of total bacteria plot
subplot(2,2,1);
xlim([0,20]);
ylim([70,500]);
plot(TPC);
title('total bacteria plot ');
xlabel ('month');
ylabel('TPC');

% coli bacteria plot
subplot(2,2,2);
xlim([0,20]);
ylim([50,100]);
plot(coliform);
title('coli bacteria plot ');
xlabel ('month');
ylabel('coliforms');

% Escherichia coli bacteria plot
subplot(2,2,3);
xlim([0,20]);
ylim([50,100]);
plot(Ecoli);
title('E. coli plot');
xlabel('month');
ylabel(' Ecoli');
