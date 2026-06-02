
clc;
% define Excelfile
filename = 'test.xlsx';
sheetname = 'Sheet1'; 
range_month = 'A4:A21';
range_ph = 'B4:B21';
range_temp = 'C4:C21';
range_do = 'D4:D21';
range_Po4 = 'E4:E21'; 
range_NO3 = 'F4:F1';
range_Ca = 'G4:G21';
range_Mg = 'H4:H21';
range_TH = 'I4:I21';
range_K = 'J4:J1';
range_Na = 'K4:K21';
range_SO4 = 'L4:L21';
range_Cl = 'M4:M21';
range_TDS = 'N4:N21';
range_EC = 'O4:O21';
range_ALK = 'P4:P21';
range_TUR = 'Q4:Q21';
range_TPC = 'R4:R21';
range_coliform = 'S4:S21';
range_Ecoli = 'T4:T21'; 
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
% pollution counter  
%pareto diagram plot
length_ph=length(ph);
% ph pollution counter
polluted_ph = 0;
for i=1:length(ph)
    if (ph(i)>max_ph || ph(i)<min_ph)
polluted_ph = polluted_ph+1; 
    end 
end
display(polluted_ph)
 
%calculating the probability of ph pollution 
prob_ph=polluted_ph/length(Cl);
fprintf('prob_ph: %d\n', prob_ph); 
% temp pollution counter 
polluted_temp = 0;
for i=1:length(temp) 
    if (temp(i)>max_temp || temp(i)<min_temp)
polluted_temp = polluted_temp+1; 
    end 
end 
display(polluted_temp)
%calculating the probability of temp pollution 
prob_temp=polluted_temp/length(temp);
fprintf('prob_temp: %d\n', prob_temp); 
% DO pollution counter 
polluted_DO = 0;
for i=1:length(do)
    if (do(i)>max_do || do(i)<min_do)
polluted_DO = polluted_DO+1; 
    end
end 
display(polluted_DO)
%calculating the probability of DO pollution 
prob_do=polluted_DO/length(do);
fprintf('prob_DO: %d\n', prob_do); 
%PO4 pollution counter 
polluted_PO4 = 0;
for i=1:length(po4)
    if (po4(i)>max_PO4 || po4(i)<min_PO4)
polluted_PO4 = polluted_PO4+1; 
    end
end 
display(polluted_PO4)
%calculating the probability of DO pollution 
prob_PO4=polluted_PO4/length(po4);
fprintf('prob_PO4: %d\n', prob_PO4); 
%NO3 pollution counter 
polluted_NO3 = 0;
for i=1:length(NO3)
    if (NO3(i)>max_NO3 || NO3(i)<min_NO3)
polluted_NO3 = polluted_NO3+1; 
    end
end 
display(polluted_NO3)
%calculating the probability of NO3 pollution 
prob_NO3=polluted_NO3/length(NO3);
fprintf('prob_NO3: %d\n', prob_NO3); 
%Ca pollution counter 
polluted_Ca = 0;
for i=1:length(Ca)
    if (Ca(i)>max_Ca || Ca(i)<min_Ca)
polluted_Ca = polluted_Ca+1; 
    end 
end
 
display(polluted_Ca)
%calculating the probability of Ca pollution 
prob_Ca=polluted_Ca/length(Ca);
fprintf('prob_Ca: %d\n', prob_Ca); 
%Mg pollution counter 
polluted_Mg = 0;
for i=1:length(Mg)
    if (Mg(i)>max_Mg || Mg(i)<min_Mg)
polluted_Mg = polluted_Mg+1; 
    end 
end 
display(polluted_Mg)
%calculating the probability of Mg pollution 
prob_Mg=polluted_Mg/length(Mg);
fprintf('prob_Mg: %d\n', prob_Mg); 
%TH pollution counter 
polluted_TH = 0;
for i=1:length(TH)
    if (TH(i)>max_TH || TH(i)<min_TH)
polluted_TH = polluted_TH+1; 
    end 
end 
display(polluted_TH)
%calculating the probability of TH pollution 
prob_TH=polluted_TH/length(TH);
fprintf('prob_TH: %d\n', prob_TH); 
%K pollution counter 
polluted_K = 0;
for i=1:length(K)
    if (K(i)>max_K || K(i)<min_K)
polluted_K = polluted_K+1; 
    end 
end 
display(polluted_K)
%calculating the probability of K pollution 
prob_K=polluted_K/length(K);
fprintf('prob_K: %d\n', prob_K); 
%Na pollution counter 
polluted_Na = 0;
for i=1:length(Na)
    if (Na(i)>max_Na || Na(i)<min_Na)
polluted_Na = polluted_Na+1; 
    end
end 
display(polluted_Na)
%calculating the probability of Na pollution 
prob_Na=polluted_Na/length(Na);
fprintf('prob_Na: %d\n', prob_Na); 
%SO4 pollution counter 
polluted_SO4 = 0;
for i=1:length(SO4)
    if (SO4(i)>max_SO4 || SO4(i)<min_SO4)
polluted_SO4 = polluted_SO4+1; 
    end
 
end
 
display(polluted_SO4)
%calculating the probability of Na pollution 
prob_SO4=polluted_SO4/length(SO4);
fprintf('prob_SO4: %d\n', prob_SO4); 
%Cl pollution counter 
polluted_Cl = 0;
for i=1:length(Cl)
    if (Cl(i)>max_Cl || Cl(i)<min_Cl)
polluted_Cl = polluted_Cl+1; 
    end 
end 
display(polluted_Cl)
%calculating the probability of Cl pollution 
prob_Cl=polluted_Cl/length(Cl);
fprintf('prob_Cl: %d\n', prob_Cl); 
%TDS pollution counter 
polluted_TDS = 0;
for i=1:length(TDS)
    if (TDS(i)>max_TDS || TDS(i)<min_TDS)
polluted_TDS = polluted_TDS+1; 
    end 
end 
display(polluted_TDS)
%calculating the probability of TDS pollution 
prob_TDS=polluted_TDS/length(TDS);
fprintf('prob_TDS: %d\n', prob_TDS); 
%EC pollution counter 
polluted_EC = 0;
for i=1:length(EC)
    if (EC(i)>max_EC || EC(i)<min_EC)
polluted_EC = polluted_EC+1; 
    end 
end 
display(polluted_EC)
%calculating the probability of TDS pollution 
prob_EC=polluted_EC/length(EC);
fprintf('prob_EC: %d\n', prob_EC); 
%ALK pollution counter 
polluted_ALK = 0;
for i=1:length(ALK)
    if ( ALK(i)> max_ALK || ALK(i)< min_ALK )
polluted_ALK = polluted_ALK+1; 
    end 
end 
display(polluted_ALK)
%calculating the probability of ALK pollution 
prob_ALK=polluted_ALK/length(ALK);
fprintf('prob_ALK: %d\n', prob_ALK); 
%TUR pollution counter 
polluted_TUR = 0;
for i=1:length(TUR)
    if (TUR(i)>max_TUR || TUR(i)<min_TUR)
polluted_TUR = polluted_TUR+1;
 
 
    end 
end 
display(polluted_TUR)
%calculating the probability of TUR pollution 
prob_TUR=polluted_TUR/length(TUR);
fprintf('prob_TUR: %d\n', prob_TUR); 
%TPC pollution counter 
polluted_TPC = 0;
for i=1:length(TPC)
    if (TPC(i)>max_TPC || TPC(i)<min_TPC)
polluted_TPC = polluted_TPC+1; 
    end 
end 
display(polluted_TPC)
%calculating the probability of TPC pollution 
prob_TPC=polluted_TPC/length(TPC);
fprintf('prob_TPC %d\n', prob_TPC); 
%coliforms pollution counter 
polluted_coliform = 0;
for i=1:length(coliform)
    if (coliform(i)>max_coliform || coliform(i)<min_coliform)
polluted_coliform = polluted_coliform+1; 
    end 
end 
display(polluted_coliform)
%calculating the probability of coliforms pollution 
prob_coliform=polluted_coliform/length(coliform);
fprintf('prob_coliform %d\n', prob_coliform); 
%Ecoli pollution counter 
polluted_Ecoli = 0;
for i=1:length(Ecoli)
    if (Ecoli(i)>max_Ecoli || Ecoli(i)<min_Ecoli)
polluted_Ecoli = polluted_Ecoli+1; 
    end 
end
display(polluted_Ecoli)
%calculating the probability of Ecoli pollution 
prob_Ecoli=polluted_Ecoli/length(Ecoli);
fprintf('prob_Ecoli %d\n',prob_Ecoli); 
% pareto table 
sum_pollutions = polluted_ph + polluted_temp + polluted_DO + polluted_PO4 + polluted_NO3 + polluted_Ca + polluted_Mg + polluted_TH +polluted_K +polluted_Na + polluted_SO4 + polluted_Cl + polluted_TDS + polluted_EC + polluted_ALK + polluted_TUR + polluted_TPC + polluted_coliform + polluted_Ecoli ;
display(sum_pollutions) 
percent_ph =( polluted_ph / sum_pollutions )* 100;
display (percent_ph)
percent_temp =( polluted_temp / sum_pollutions) * 100;
display (percent_temp) 
percent_DO = (polluted_DO / sum_pollutions) * 100;
display (percent_DO) 
percent_PO4 = (polluted_PO4 / sum_pollutions) * 100;
display (percent_PO4) 
percent_NO3 = (polluted_NO3 / sum_pollutions) * 100;
display (percent_NO3)
 
percent_Ca = (polluted_Ca / sum_pollutions) * 100;
display (percent_Ca) 
percent_Mg = (polluted_Mg / sum_pollutions) * 100;
display (percent_Mg) 
percent_TH = (polluted_TH /sum_pollutions) * 100;
display (percent_TH) 
percent_K = (polluted_K / sum_pollutions) * 100;
display (percent_K) 
percent_Na = (polluted_Na / sum_pollutions) * 100;
display (percent_Na) 
percent_SO4 = (polluted_SO4 / sum_pollutions) * 100;
display (percent_SO4) 
percent_Cl = (polluted_Cl / sum_pollutions) * 100;
display (percent_Cl) 
percent_TDS = (polluted_TDS / sum_pollutions) * 100;
display (percent_TDS) 
percent_EC = (polluted_EC / sum_pollutions) * 100;
display (percent_EC) 
percent_ALK = (polluted_ALK / sum_pollutions) * 100;
display (percent_ALK) 
percent_TUR = (polluted_TUR / sum_pollutions) * 100;
display (percent_TUR) 
percent_TPC = (polluted_TPC / sum_pollutions) * 100;
display (percent_TPC) 
percent_coliform = (polluted_coliform / sum_pollutions) * 100;
display (percent_coliform)
percent_Ecoli = (polluted_Ecoli / sum_pollutions) * 100;
display (percent_Ecoli) 
percentages = [percent_ph percent_temp percent_DO percent_PO4 percent_NO3 percent_Ca percent_Mg percent_TH percent_K percent_Na percent_SO4 percent_Cl percent_TDS percent_EC percent_ALK percent_TUR percent_TPC percent_coliform percent_Ecoli];
names = ["polluted_ph" "polluted_temp" "polluted_Do" "polluted_PO4" "polluted_NO3" "polluted_Ca" "polluted_Mg" "polluted_TH" "polluted_K" "polluted_Na" "polluted_SO4" "polluted_Cl" "polluted_TDS" "polluted_EC"  "polluted_ALK" "polluted_TUR" "polluted_TPC" "polluted_coliform" "polluted_Ecoli"];
values = [polluted_ph polluted_temp polluted_DO polluted_PO4 polluted_NO3 polluted_Ca  polluted_Mg polluted_TH polluted_K polluted_Na polluted_SO4 polluted_Cl polluted_TDS polluted_EC polluted_ALK polluted_TUR polluted_TPC polluted_Ca polluted_Ecoli];
[~,sortedIndexes] = sort(values, 'descend');
sortedNames = names(sortedIndexes);
sortedValues = values(sortedIndexes);
sortedPercentages = percentages(sortedIndexes);
cumulativePercentages = cumsum(sortedPercentages);
tableData = [sortedNames', num2cell(sortedValues'), num2cell(sortedPercentages'), num2cell(cumulativePercentages')]; 
tableHeader = {'parameter', 'counter', 'Percentage', 'Cumulative Percentage'};
tableDataWithHeader = [tableHeader; tableData];
disp(tableDataWithHeader);
hold on;
% Define the output Excel file
file_name = 'paretotable.xlsx';
sheet_name = 'Sheet1';
xlswrite( file_name , tableDataWithHeader , sheet_name );
 
winopen(file_name);
