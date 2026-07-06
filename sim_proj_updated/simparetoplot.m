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
%pareto diagram plot
length_ph=length(ph);
% ph pollution counter
polluted_ph = 0;
for i=1:length(ph)
    if (ph(i)>max_ph || ph(i)<min_ph)
polluted_ph = polluted_ph+1; 
    end 
end 
%calculating the probability of ph pollution 
prob_ph=polluted_ph/length(Cl); 
% temp pollution counter 
polluted_temp = 0;
for i=1:length(temp) 
    if (temp(i)>max_temp || temp(i)<min_temp)
polluted_temp = polluted_temp+1; 
    end 
end 
%calculating the probability of temp pollution 
prob_temp=polluted_temp/length(temp); 
% DO pollution counter 
polluted_DO = 0;
for i=1:length(do)
    if (do(i) < max_do)
polluted_DO = polluted_DO+1; 
    end 
end 
%calculating the probability of DO pollution 
prob_do=polluted_DO/length(do); 
%PO4 pollution counter 
polluted_PO4 = 0;
for i=1:length(po4)
    if (po4(i)>max_PO4 || po4(i)<min_PO4)
polluted_PO4 = polluted_PO4+1; 
    end 
end 
%calculating the probability of DO pollution 
prob_PO4=polluted_PO4/length(po4); 
%NO3 pollution counter 
polluted_NO3 = 0;
for i=1:length(NO3)
    if (NO3(i)>max_NO3 || NO3(i)<min_NO3)
polluted_NO3 = polluted_NO3+1;
 
 
    end 
end 
%calculating the probability of NO3 pollution 
prob_NO3=polluted_NO3/length(NO3);
 
%Ca pollution counter 
polluted_Ca = 0;
for i=1:length(Ca)
    if (Ca(i)>max_Ca || Ca(i)<min_Ca)
polluted_Ca = polluted_Ca+1; 
    end 
end 
%calculating the probability of Ca pollution 
prob_Ca=polluted_Ca/length(Ca); 
%Mg pollution counter 
polluted_Mg = 0;
for i=1:length(Mg)
    if (Mg(i)>max_Mg || Mg(i)<min_Mg)
polluted_Mg = polluted_Mg+1; 
    end 
end
%calculating the probability of Mg pollution 
prob_Mg=polluted_Mg/length(Mg); 
%TH pollution counter 
polluted_TH = 0;
for i=1:length(TH)
    if (TH(i)>max_TH || TH(i)<min_TH)
polluted_TH = polluted_TH+1; 
    end 
end 
%calculating the probability of TH pollution 
prob_TH=polluted_TH/length(TH); 
%K pollution counter 
polluted_K = 0;
for i=1:length(K)
    if (K(i)>max_K || K(i)<min_K)
polluted_K = polluted_K+1; 
    end 
end 
%calculating the probability of K pollution 
prob_K=polluted_K/length(K); 
%Na pollution counter 
polluted_Na = 0;
for i=1:length(Na)
    if (Na(i)>max_Na || Na(i)<min_Na)
polluted_Na = polluted_Na+1; 
    end 
end 
%calculating the probability of Na pollution 
prob_Na=polluted_Na/length(Na); 
%SO4 pollution counter 
polluted_SO4 = 0;
for i=1:length(SO4)
    if (SO4(i)>max_SO4 || SO4(i)<min_SO4)
polluted_SO4 = polluted_SO4+1;
 
 
    end 
end 
%calculating the probability of Na pollution 
prob_SO4=polluted_SO4/length(SO4); 
%Cl pollution counter 
polluted_Cl = 0;
for i=1:length(Cl)
    if (Cl(i)>max_Cl || Cl(i)<min_Cl)
polluted_Cl = polluted_Cl+1; 
    end 
end 
%calculating the probability of Cl pollution 
prob_Cl=polluted_Cl/length(Cl); 
%TDS pollution counter 
polluted_TDS = 0;
for i=1:length(TDS)
    if (TDS(i)>max_TDS || TDS(i)<min_TDS)
polluted_TDS = polluted_TDS+1; 
    end 
end 
%calculating the probability of TDS pollution 
prob_TDS=polluted_TDS/length(TDS); 
%EC pollution counter 
polluted_EC = 0;
for i=1:length(EC)
    if (EC(i)>max_EC || EC(i)<min_EC)
polluted_EC = polluted_EC+1; 
    end 
end 
%calculating the probability of TDS pollution 
prob_EC=polluted_EC/length(EC); 
%ALK pollution counter 
polluted_ALK = 0;
for i=1:length(ALK)
    if ( ALK(i)> max_ALK || ALK(i)< min_ALK )
polluted_ALK = polluted_ALK+1;
     end 
end
 %calculating the probability of ALK pollution 
prob_ALK=polluted_ALK/length(ALK);
 %TUR pollution counter 
polluted_TUR = 0;
for i=1:length(TUR)
    if (TUR(i)>max_TUR || TUR(i)<min_TUR)
polluted_TUR = polluted_TUR+1; 
    end 
end 
%calculating the probability of TUR pollution 
prob_TUR=polluted_TUR/length(TUR); 
%TPC pollution counter 
polluted_TPC = 0;
for i=1:length(TPC)
    if (TPC(i)>max_TPC || TPC(i)<min_TPC)
polluted_TPC = polluted_TPC+1;
 
 
    end 
end 
%calculating the probability of TPC pollution 
prob_TPC=polluted_TPC/length(TPC); 
%coliforms pollution counter 
polluted_coliform = 0;
for i=1:length(coliform)
    if (coliform(i)>max_coliform || coliform(i)<min_coliform)
polluted_coliform = polluted_coliform+1; 
    end 
end 
%calculating the probability of coliforms pollution 
prob_coliform=polluted_coliform/length(coliform); 
%Ecoli pollution counter 
polluted_Ecoli = 0;
for i=1:length(Ecoli)
    if (Ecoli(i)>max_Ecoli || Ecoli(i)<min_Ecoli)
polluted_Ecoli = polluted_Ecoli+1; 
    end 
end
%calculating the probability of Ecoli pollution 
prob_Ecoli=polluted_Ecoli/length(Ecoli); 
% pareto table 
sum_pollutions = polluted_ph + polluted_temp + polluted_DO + polluted_PO4 + polluted_NO3 + polluted_Ca + polluted_Mg + polluted_TH +polluted_K +polluted_Na + polluted_SO4 + polluted_Cl + polluted_TDS + polluted_EC + polluted_ALK + polluted_TUR + polluted_TPC + polluted_coliform + polluted_Ecoli ; 
percent_ph =( polluted_ph / sum_pollutions )* 100;
percent_temp =( polluted_temp / sum_pollutions) * 100; 
percent_DO = (polluted_DO / sum_pollutions) * 100; 
percent_PO4 = (polluted_PO4 / sum_pollutions) * 100; 
percent_NO3 = (polluted_NO3 / sum_pollutions) * 100; 
percent_Ca = (polluted_Ca / sum_pollutions) * 100; 
percent_Mg = (polluted_Mg / sum_pollutions) * 100; 
percent_TH = (polluted_TH /sum_pollutions) * 100; 
percent_K = (polluted_K / sum_pollutions) * 100; 
percent_Na = (polluted_Na / sum_pollutions) * 100; 
percent_SO4 = (polluted_SO4 / sum_pollutions) * 100; 
percent_Cl = (polluted_Cl / sum_pollutions) * 100; 
percent_TDS = (polluted_TDS / sum_pollutions) * 100; 
percent_EC = (polluted_EC / sum_pollutions) * 100; 
percent_ALK = (polluted_ALK / sum_pollutions) * 100; 
percent_TUR = (polluted_TUR / sum_pollutions) * 100; 
percent_TPC = (polluted_TPC / sum_pollutions) * 100; 
percent_coliform = (polluted_coliform / sum_pollutions) * 100; 
percent_Ecoli = (polluted_Ecoli / sum_pollutions) * 100; 
percentages = [percent_ph percent_temp percent_DO percent_PO4 percent_NO3 percent_Ca percent_Mg percent_TH percent_K percent_Na percent_SO4 percent_Cl percent_TDS percent_EC percent_ALK percent_TUR percent_TPC percent_coliform percent_Ecoli];
names = ["polluted_ph" "polluted_temp" "polluted_Do" "polluted_PO4" "polluted_NO3" "polluted_Ca" "polluted_Mg" "polluted_TH" "polluted_K" "polluted_Na" "polluted_SO4" "polluted_Cl" "polluted_TDS" "polluted_EC"  "polluted_ALK" "polluted_TUR" "polluted_TPC" "polluted_coliform" "polluted_Ecoli"];
values = [polluted_ph polluted_temp polluted_DO polluted_PO4 polluted_NO3 polluted_Ca  polluted_Mg polluted_TH polluted_K polluted_Na polluted_SO4 polluted_Cl polluted_TDS polluted_EC polluted_ALK polluted_TUR polluted_TPC polluted_coliform polluted_Ecoli];
[~,sortedIndexes] = sort(values, 'descend');
sortedNames = names(sortedIndexes);
sortedValues = values(sortedIndexes);
sortedPercentages = percentages(sortedIndexes);
cumulativePercentages = cumsum(sortedPercentages); 
% simulation of pareto diagram using monte carlo simulation 
parameters = {'pH', 'Temp', 'DO', 'PO4', 'NO3', 'Ca', 'Mg', 'TH', 'K', 'Na', 'SO4', 'Cl', 'TDS', 'EC', 'ALK', 'TUR', 'TPC', 'coliform', 'Ecoli'};
numParameters = length(parameters);
parametermax = [max_ph, max_temp, max_do, max_PO4, max_NO3, max_Ca, max_Mg, max_TH, max_K, max_Na, max_SO4, max_Cl, max_TDS, max_EC, max_ALK, max_TUR, max_TPC, max_coliform, max_Ecoli];
parametermin = [min_ph, min_temp, min_do, min_PO4, min_NO3, min_Ca, min_Mg, min_TH, min_K ,min_Na, min_SO4, min_Cl, min_TDS, min_EC, min_ALK, min_TUR, min_TPC, min_coliform, min_Ecoli];
probParametersNotInLimits =  [prob_ph, prob_temp, prob_do, prob_PO4, prob_NO3, prob_Ca, prob_Mg, prob_TH, prob_K , prob_Na, prob_SO4, prob_Cl, prob_TDS, prob_EC, prob_ALK, prob_TUR, prob_TPC, prob_coliform, prob_Ecoli];
numSimulations = 1000; 
rng(2024); % fixed seed for reproducibility (required for scientific replication)
n_obs = length(ph); % number of monthly observations (sample size)
mc_draws = zeros(numSimulations, numParameters);
for i = 1:numParameters
    disp(['Parameter name: ', parameters{i}]);
    mc_draws(:,i) = binornd(n_obs, probParametersNotInLimits(i), numSimulations, 1);
    fprintf('Monte Carlo mean out-of-range count: %.2f (95%% CI: %.0f-%.0f)\n', ...
        mean(mc_draws(:,i)), prctile(mc_draws(:,i),2.5), prctile(mc_draws(:,i),97.5));
end 
outlimitscounter = mean(mc_draws, 1);          % mean simulated non-conformance count per parameter
mc_ci_lo = prctile(mc_draws, 2.5, 1);
mc_ci_hi = prctile(mc_draws, 97.5, 1);
sim_sum = sum(outlimitscounter);
fprintf('sum of parameters out of range (Monte Carlo mean): %.2f\n', sim_sum);
sim_percent = (outlimitscounter / sim_sum) * 100;
[~,sortedIndexes] = sort(  outlimitscounter , 'descend');
sortedParameters = parameters(sortedIndexes);
sortedOutlimitscounter = outlimitscounter(sortedIndexes);
sortedSimPercent = sim_percent(sortedIndexes);
sorted_mc_ci_lo = mc_ci_lo(sortedIndexes);
sorted_mc_ci_hi = mc_ci_hi(sortedIndexes);
cumulativePercentages = cumsum(sortedSimPercent); 

z = 1.959963984540054;
wilson_lo = zeros(1,numParameters); wilson_hi = zeros(1,numParameters);
for i = 1:numParameters
    p_i = probParametersNotInLimits(i);
    denom = 1 + z^2/n_obs;
    center = (p_i + z^2/(2*n_obs)) / denom;
    hw = (z*sqrt((p_i*(1-p_i)/n_obs) + z^2/(4*n_obs^2))) / denom;
    wilson_lo(i) = max(0, center-hw); wilson_hi(i) = min(1, center+hw);
end
sorted_wilson_lo = wilson_lo(sortedIndexes)*100;
sorted_wilson_hi = wilson_hi(sortedIndexes)*100;

obs_counts = probParametersNotInLimits * n_obs; % actual observed counts (not simulated)
expected = repmat(sum(obs_counts)/numParameters, 1, numParameters);
chi2_stat = sum((obs_counts - expected).^2 ./ expected);
df = numParameters - 1;
p_value = 1 - chi2cdf(chi2_stat, df);
fprintf('\nChi-square goodness-of-fit test (H0: uniform non-conformance across parameters)\n');
fprintf('chi2 = %.3f, df = %d, p-value = %.6g\n', chi2_stat, df, p_value);
if p_value < 0.05
    fprintf('Result: reject H0 -- non-conformance is NOT uniform (statistically supports Pareto prioritization).\n\n');
else
    fprintf('Result: fail to reject H0.\n\n');
end

tableData = [sortedParameters', num2cell(sortedOutlimitscounter'), num2cell(sortedSimPercent'), ...
             num2cell(cumulativePercentages'), num2cell(sorted_mc_ci_lo'), num2cell(sorted_mc_ci_hi'), ...
             num2cell(sorted_wilson_lo'), num2cell(sorted_wilson_hi')]; 
tableHeader = {'Parameter', 'MC_Mean_Counter', 'MC_Percentage', 'Cumulative_Percentage', ...
               'MC_CI_Lower', 'MC_CI_Upper', 'Wilson_CI_Lower_pct', 'Wilson_CI_Upper_pct'};
tableDataWithHeader = [tableHeader; tableData];
disp(tableDataWithHeader);
 % Define the output Excel file
sim_file_name = 'paretosimulation.xlsx';
sim_sheet_name = 'Sheet1';
xlswrite( sim_file_name , tableDataWithHeader ,sim_sheet_name );
 winopen(sim_file_name);
 
% pareto digram plot
figure;
yyaxis right;
yyaxis left;
bar(sortedOutlimitscounter);
hold on;
plot(cumulativePercentages); 
hold on; 
plot(cumulativePercentages, '*'); 
xlabel('polluted parameters');
ylabel('iterations');
xlim([0,20]); 
ylim([0,1500]); 
hold on ; 
title('simulated pareto diagram ');
xtickangle(45);
xticks(1:length(sortedParameters)); 
xticklabels(sortedParameters);

