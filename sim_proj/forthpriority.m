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
    if (do(i)>max_do || do(i)<min_do)
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
values = [polluted_ph polluted_temp polluted_DO polluted_PO4 polluted_NO3 polluted_Ca  polluted_Mg polluted_TH polluted_K polluted_Na polluted_SO4 polluted_Cl polluted_TDS polluted_EC polluted_ALK polluted_TUR polluted_TPC polluted_Ca polluted_Ecoli];
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
%monte carlo simulation 
numSimulations = 1000; 
 outlimitscounter= zeros(1, numParameters);
inlimitscounter = zeros(1, numParameters); 
for i = 1:numParameters
    outlimitscounter(i) = probParametersNotInLimits(i)* numSimulations;
    inlimitscounter(i) = numSimulations - outlimitscounter(i);
    
end 
sim_sum=sum(outlimitscounter);
sim_percent = (outlimitscounter / sim_sum) * 100;
[~,sortedIndexes] = sort(  outlimitscounter , 'descend');
sortedParameters = parameters(sortedIndexes);
sortedOutlimitscounter = outlimitscounter(sortedIndexes);
sortedSimPercent = sim_percent(sortedIndexes);
sortedoutlimitscounter =sort(  outlimitscounter , 'descend');
cumulativePercentages = cumsum(sortedSimPercent); 
tableData = [sortedParameters', num2cell(sortedoutlimitscounter'), num2cell(sortedSimPercent'), num2cell(cumulativePercentages')]; 
tableHeader = {'Parameter', 'Counter', 'Percentage', 'Cumulative Percentage'};
tableDataWithHeader = [tableHeader; tableData];

% Initialize variables
numParameters = numel(sortedIndexes);
uniqueCounters = unique(sortedOutlimitscounter);
numUniqueCounters = numel(uniqueCounters);
priorityArrays = cell(1, numUniqueCounters);

% Iterate through unique counters and populate priorityArrays
for i = 1:numUniqueCounters
    counterIndex = find(sortedOutlimitscounter == uniqueCounters(i));
    priorityArrays{numUniqueCounters - i + 1} = sortedParameters(counterIndex);
end
% Display the parameters with the fouth highest counter
for i = 1:length(priorityArrays{4})
    currentElement = priorityArrays{4}{i};  % Current element in the array
    switch currentElement
        case 'pH'
           % fishbone diagram of PH
% Define the causes of   PH pollution
causesPH = {'factories Pollutants', 'Agriculture pollutants', 'Fertilisers', 'Pesticide','mud'};


% Plot the diagram
figure;
hold on;
xlim([0, 10]);
ylim([0,10]);
set(gca, 'Visible', 'off');
rectangle('position',[6,5,3,3]);
x = [0.5 6];
y = [6.5 6.5 ]; 

line(x, y, 'Color', 'r', 'LineWidth', 2); 

% Draw diagonal lines
x1 = [5 4.5];
x2 = [1.5 0.5];
y1 = [6.5 4.5];
y2 = [6.5 8.5];
y3 = [7.2 7.2];
x3=[4.8 3.8];
x4 = [ 4.7 3.7];
y4= [ 7.8 7.8];


line(x1, y1, 'Color', 'b', 'LineWidth', 2);
line(x1, y2, 'Color', 'b', 'LineWidth', 2);
line(x3,y3, 'Color', 'b', 'LineWidth', 2);
line(x4, y4, 'Color', 'b', 'LineWidth', 2);
line(x2, y2, 'Color', 'b', 'LineWidth', 2);

% Draw tail
x1_triangle = [0.5 0.1 ];
y1_triangle = [6.5 6 ];
y2_triangle = [6.5  7];

line(x1_triangle, y1_triangle, 'Color', 'g', 'LineWidth', 2);
line(x1_triangle, y2_triangle, 'Color', 'g', 'LineWidth', 2);

% Add text labels
text(6.7, 6.5, "PH pollution", 'HorizontalAlignment', 'left');
text(4.7 , 4.2, causesPH{1}, 'HorizontalAlignment', 'right');
text(5, 9, causesPH{2}, 'HorizontalAlignment', 'right');
text(3.5, 7.2, causesPH{3}, 'HorizontalAlignment', 'right');
text(3.5, 7.8, causesPH{4}, 'HorizontalAlignment', 'right');
text(0.3, 9.2, causesPH{5}, 'HorizontalAlignment', 'left');

hold off;
        case 'Temp'
% fishbone diagram of Temp.
% Define the causes of Temp. pollution
causestemp = { 'The weather'};
% Plot the diagram
figure;
hold on;
xlim([0, 10]);
ylim([0,10]);
set(gca, 'Visible', 'off');
rectangle('position',[6,5,3,3]);
x = [0.5 6];
y = [6.5 6.5 ]; 

line(x, y, 'Color', 'r', 'LineWidth', 2); 




% Draw diagonal lines
x1 = [5 4.5];
y1 = [6.5 4.5];

% main lines
line(x1, y1, 'Color', 'b', 'LineWidth', 2);

% Draw tail
x1_triangle = [0.5 0.1 ];
y1_triangle = [6.5 6 ];
y2_triangle = [6.5  7];


line(x1_triangle, y1_triangle, 'Color', 'g', 'LineWidth', 2);
line(x1_triangle, y2_triangle, 'Color', 'g', 'LineWidth', 2);

% Add text labels
%main lables
text(6.3, 6.5, "Temp. pollution", 'HorizontalAlignment', 'left');
text(4.7 , 4.2, causestemp{1}, 'HorizontalAlignment', 'right');
hold off;
        case 'DO'
% fishbone diagram of Do
% Define the causes of   Do pollution
causesDo = {'Biological contamination ','High temperatures'};


% Plot the diagram
figure;
hold on;
xlim([0, 10]);
ylim([0,10]);
set(gca, 'Visible', 'off');
rectangle('position',[6,5,3,3]);
x = [0.5 6];
y = [6.5 6.5 ]; 

line(x, y, 'Color', 'r', 'LineWidth', 2); 

% Draw diagonal lines
x1 = [5 4.5];
y1 = [6.5 4.5];
y2 = [6.5 8.5];



line(x1, y1, 'Color', 'b', 'LineWidth', 2);
line(x1, y2, 'Color', 'b', 'LineWidth', 2);


% Draw tail
x1_triangle = [0.5 0.1 ];
y1_triangle = [6.5 6 ];
y2_triangle = [6.5  7];


line(x1_triangle, y1_triangle, 'Color', 'g', 'LineWidth', 2);
line(x1_triangle, y2_triangle, 'Color', 'g', 'LineWidth', 2);

% Add text labels
text(6.5, 6.5, "Do pollution", 'HorizontalAlignment', 'left');
text(4.7 , 4.2, causesDo{1}, 'HorizontalAlignment', 'right');
text(5, 9, causesDo{2}, 'HorizontalAlignment', 'right');
hold off;
       
% Plot the diagram
figure;
hold on;
xlim([0, 10]);
ylim([0,10]);
set(gca, 'Visible', 'off');
rectangle('position',[6,5,3,3]);
x = [0.5 6];
y = [6.5 6.5 ]; 

line(x, y, 'Color', 'r', 'LineWidth', 2); 

% Draw diagonal lines
x1 = [5 4.5];
y1 = [6.5 4.5];
y2 = [6.5 8.5];



line(x1, y1, 'Color', 'b', 'LineWidth', 2);
line(x1, y2, 'Color', 'b', 'LineWidth', 2);


% Draw tail
x1_triangle = [0.5 0.1 ];
y1_triangle = [6.5 6 ];
y2_triangle = [6.5  7];


line(x1_triangle, y1_triangle, 'Color', 'g', 'LineWidth', 2);
line(x1_triangle, y2_triangle, 'Color', 'g', 'LineWidth', 2);

% Add text labels
text(6.5, 6.5,'Do pollution', 'HorizontalAlignment', 'left');
text(4.7 , 4.2, causesDo{1}, 'HorizontalAlignment', 'right');
text(5, 9, causesDo{2}, 'HorizontalAlignment', 'right');
hold off;

        
        case 'PO4'
            % fishbone diagram of PO4
% Define the causes of   PO4 pollution
causesPO4 = {'factories Pollutants', 'Agriculture pollutants','Fertilisers', 'Pesticide', 'Fertilisers'};


% Plot the diagram
figure;
hold on;
xlim([0, 10]);
ylim([0,10]);
set(gca, 'Visible', 'off');
rectangle('position',[6,5,3,3]);
x = [0.5 6];
y = [6.5 6.5 ]; 

line(x, y, 'Color', 'r', 'LineWidth', 2); 

% Draw diagonal lines
x1 = [5 4.5];
x2 = [1.5 0.5];
y1 = [6.5 4.5];
y2 = [6.5 8.5];
y3 = [7.2 7.2];
x3=[4.8 3.8];
x4 = [ 4.7 3.7];
y4= [ 7.8 7.8];


line(x1, y1, 'Color', 'b', 'LineWidth', 2);
line(x1, y2, 'Color', 'b', 'LineWidth', 2);
line(x3,y3, 'Color', 'b', 'LineWidth', 2);
line(x4, y4, 'Color', 'b', 'LineWidth', 2);
line(x2, y2, 'Color', 'b', 'LineWidth', 2);

% Draw tail
x1_triangle = [0.5 0.1 ];
y1_triangle = [6.5 6 ];
y2_triangle = [6.5  7];

line(x1_triangle, y1_triangle, 'Color', 'g', 'LineWidth', 2);
line(x1_triangle, y2_triangle, 'Color', 'g', 'LineWidth', 2);

% Add text labels
text(6.7, 6.5, "PO4 pollution", 'HorizontalAlignment', 'left');
text(4.7 , 4.2, causesPO4{1}, 'HorizontalAlignment', 'right');
text(5, 9, causesPO4{2}, 'HorizontalAlignment', 'right');
text(3.5, 7.2, causesPO4{3}, 'HorizontalAlignment', 'right');
text(3.5, 7.8, causesPO4{4}, 'HorizontalAlignment', 'right');
text(0.3, 9.2, causesPO4{5}, 'HorizontalAlignment', 'left');

hold off;
        case 'NO3'
        
                  % fishbone diagram of NO3
% Define the causes of   NO3 pollution
causesNO3 = {'factories Pollutants', 'Agriculture pollutants', 'Fertilisers', 'Pesticide','Fertilisers'};


% Plot the diagram
figure;
hold on;
xlim([0, 10]);
ylim([0,10]);
set(gca, 'Visible', 'off');
rectangle('position',[6,5,3,3]);
x = [0.5 6];
y = [6.5 6.5 ]; 

line(x, y, 'Color', 'r', 'LineWidth', 2); 

% Draw diagonal lines
x1 = [5 4.5];
x2 = [1.5 0.5];
y1 = [6.5 4.5];
y2 = [6.5 8.5];
y3 = [7.2 7.2];
x3=[4.8 3.8];
x4 = [ 4.7 3.7];
y4= [ 7.8 7.8];


line(x1, y1, 'Color', 'b', 'LineWidth', 2);
line(x1, y2, 'Color', 'b', 'LineWidth', 2);
line(x3,y3, 'Color', 'b', 'LineWidth', 2);
line(x4, y4, 'Color', 'b', 'LineWidth', 2);
line(x2, y2, 'Color', 'b', 'LineWidth', 2);

% Draw tail
x1_triangle = [0.5 0.1 ];
y1_triangle = [6.5 6 ];
y2_triangle = [6.5  7];

line(x1_triangle, y1_triangle, 'Color', 'g', 'LineWidth', 2);
line(x1_triangle, y2_triangle, 'Color', 'g', 'LineWidth', 2);

% Add text labels
text(6.7, 6.5, "NO3 pollution", 'HorizontalAlignment', 'left');
text(4.7 , 4.2, causesNO3{1}, 'HorizontalAlignment', 'right');
text(5, 9, causesNO3{2}, 'HorizontalAlignment', 'right');
text(3.5, 7.2, causesNO3{3}, 'HorizontalAlignment', 'right');
text(3.5, 7.8, causesNO3{4}, 'HorizontalAlignment', 'right');
text(0.3, 9.2, causesNO3{5}, 'HorizontalAlignment', 'left');

hold off;
        case 'Ca'
% fishbone diagram of Ca
% Define the causes of   Ca pollution
causesCa = {'factories Pollutants', 'Agriculture pollutants', 'Fertilisers', 'Pesticide','mud'};


% Plot the diagram
figure;
hold on;
xlim([0, 10]);
ylim([0,10]);
set(gca, 'Visible', 'off');
rectangle('position',[6,5,3,3]);
x = [0.5 6];
y = [6.5 6.5 ]; 

line(x, y, 'Color', 'r', 'LineWidth', 2); 

% Draw diagonal lines
x1 = [5 4.5];
x2 = [1.5 0.5];
y1 = [6.5 4.5];
y2 = [6.5 8.5];
y3 = [7.2 7.2];
x3=[4.8 3.8];
x4 = [ 4.7 3.7];
y4= [ 7.8 7.8];


line(x1, y1, 'Color', 'b', 'LineWidth', 2);
line(x1, y2, 'Color', 'b', 'LineWidth', 2);
line(x3,y3, 'Color', 'b', 'LineWidth', 2);
line(x4, y4, 'Color', 'b', 'LineWidth', 2);
line(x2, y2, 'Color', 'b', 'LineWidth', 2);

% Draw tail
x1_triangle = [0.5 0.1 ];
y1_triangle = [6.5 6 ];
y2_triangle = [6.5  7];

line(x1_triangle, y1_triangle, 'Color', 'g', 'LineWidth', 2);
line(x1_triangle, y2_triangle, 'Color', 'g', 'LineWidth', 2);

% Add text labels
text(6.7, 6.5, "Ca pollution", 'HorizontalAlignment', 'left');
text(4.7 , 4.2, causesCa{1}, 'HorizontalAlignment', 'right');
text(5, 9, causesCa{2}, 'HorizontalAlignment', 'right');
text(3.5, 7.2, causesCa{3}, 'HorizontalAlignment', 'right');
text(3.5, 7.8, causesCa{4}, 'HorizontalAlignment', 'right');
text(0.3, 9.2, causesCa{5}, 'HorizontalAlignment', 'left');

hold off;
        case 'Mg'
% fishbone diagram of Magnesium
% Define the causes of   Magnesium pollution
causesMagnesium = {'factories Pollutants', 'Agriculture pollutants', 'Fertilisers', 'Pesticide','mud'};


% Plot the diagram
figure;
hold on;
xlim([0, 10]);
ylim([0,10]);
set(gca, 'Visible', 'off');
rectangle('position',[6,5,3,3]);
x = [0.5 6];
y = [6.5 6.5 ]; 

line(x, y, 'Color', 'r', 'LineWidth', 2); 

% Draw diagonal lines
x1 = [5 4.5];
x2 = [1.5 0.5];
y1 = [6.5 4.5];
y2 = [6.5 8.5];
y3 = [7.2 7.2];
x3=[4.8 3.8];
x4 = [ 4.7 3.7];
y4= [ 7.8 7.8];


line(x1, y1, 'Color', 'b', 'LineWidth', 2);
line(x1, y2, 'Color', 'b', 'LineWidth', 2);
line(x3,y3, 'Color', 'b', 'LineWidth', 2);
line(x4, y4, 'Color', 'b', 'LineWidth', 2);
line(x2, y2, 'Color', 'b', 'LineWidth', 2);

% Draw tail
x1_triangle = [0.5 0.1 ];
y1_triangle = [6.5 6 ];
y2_triangle = [6.5  7];


line(x1_triangle, y1_triangle, 'Color', 'g', 'LineWidth', 2);
line(x1_triangle, y2_triangle, 'Color', 'g', 'LineWidth', 2);

% Add text labels
text(6, 6.5, "Magnesium pollution", 'HorizontalAlignment', 'left');
text(4.7 , 4.2, causesMagnesium{1}, 'HorizontalAlignment', 'right');
text(5, 9, causesMagnesium{2}, 'HorizontalAlignment', 'right');
text(3.5, 7.2, causesMagnesium{3}, 'HorizontalAlignment', 'right');
text(3.5, 7.8, causesMagnesium{4}, 'HorizontalAlignment', 'right');
text(0.3, 9.2, causesMagnesium{5}, 'HorizontalAlignment', 'left');

hold off;
        case 'TH'
% fishbone diagram of TH
% Define the causes of TH pollution
causesTH = {'Soil type', 'Swage water', 'agricultural draining water', 'car wash water'};


% Plot the diagram
figure;
hold on;
xlim([0, 10]);
ylim([0,10]);
set(gca, 'Visible', 'off');
rectangle('position',[6,5,3,3]);
x = [0.5 6];
y = [6.5 6.5 ]; 

line(x, y, 'Color', 'r', 'LineWidth', 2); 

% Draw diagonal lines
x1 = [5 4.5];

y1 = [6.5 4.5];
y2 = [6.5 8.5];
x2=[2.5 1.5];


line(x1, y1, 'Color', 'b', 'LineWidth', 2);
line(x1, y2, 'Color', 'b', 'LineWidth', 2);
line(x2, y1, 'Color', 'b', 'LineWidth', 2);
line(x2, y2, 'Color', 'b', 'LineWidth', 2);

% Draw tail
x1_triangle = [0.5 0.1 ];
y1_triangle = [6.5 6 ];
y2_triangle = [6.5  7];


line(x1_triangle, y1_triangle, 'Color', 'g', 'LineWidth', 2);
line(x1_triangle, y2_triangle, 'Color', 'g', 'LineWidth', 2);

% Add text labels
text(6.5, 6.5, "TH pollution", 'HorizontalAlignment', 'left');

text(6 , 3.8, causesTH{1}, 'HorizontalAlignment', 'right');
text(6.7, 9, causesTH{2}, 'HorizontalAlignment', 'right');
text(0.3, 4.2, causesTH{3}, 'HorizontalAlignment', 'left');
text(0.3, 9.2, causesTH{4}, 'HorizontalAlignment', 'left');

hold off;
        case 'K'
            % fishbone diagram of K
% Define the causes of   K pollution
causesK = {'Industrial activity','leak','Waste disposal', 'Agriculture pollutants', 'Fertilisers', 'Pesticide','Rocks'};


% Plot the diagram
figure;
hold on;
xlim([0, 10]);
ylim([0,10]);
set(gca, 'Visible', 'off');
rectangle('position',[6,5,3,3]);
x = [0.5 6];
y = [6.5 6.5 ]; 

line(x, y, 'Color', 'r', 'LineWidth', 2); 

% Draw diagonal lines
x1 = [5 4.5];
x2 = [1.5 0.5];
y1 = [6.5 4.5];
y2 = [6.5 8.5];
y3 = [7.2 7.2];
x3=[4.8 3.8];
x4 = [ 4.7 3.7];
y4= [ 7.8 7.8];
x5=[4.6 3.6];
y5=[5 5];
x6=[4.8 3.8];
y6=[ 5.8 5.8];


line(x1, y1, 'Color', 'b', 'LineWidth', 2);
line(x5, y5, 'Color', 'b', 'LineWidth', 2);
line(x6, y6, 'Color', 'b', 'LineWidth', 2);

line(x1, y2, 'Color', 'b', 'LineWidth', 2);
line(x3,y3, 'Color', 'b', 'LineWidth', 2);
line(x4, y4, 'Color', 'b', 'LineWidth', 2);
line(x2, y2, 'Color', 'b', 'LineWidth', 2);

% Draw tail
x1_triangle = [0.5 0.1 ];
y1_triangle = [6.5 6 ];
y2_triangle = [6.5  7];


line(x1_triangle, y1_triangle, 'Color', 'g', 'LineWidth', 2);
line(x1_triangle, y2_triangle, 'Color', 'g', 'LineWidth', 2);

% Add text labels
text(6.7, 6.5, "K pollution", 'HorizontalAlignment', 'left');
text(4.7 , 4.2, causesK{1}, 'HorizontalAlignment', 'right');
text(3.5 , 5.8, causesK{2}, 'HorizontalAlignment', 'right');
text(3.3 , 5, causesK{3}, 'HorizontalAlignment', 'right');

text(5, 9, causesK{4}, 'HorizontalAlignment', 'right');
text(3.5, 7.2, causesK{5}, 'HorizontalAlignment', 'right');
text(3.5, 7.8, causesK{6}, 'HorizontalAlignment', 'right');
text(0.3, 9.2, causesK{7}, 'HorizontalAlignment', 'left');

hold off;
        case 'Na'
% fishbone diagram of Na
% Define the causes of   Na pollution
causesNa = {'Industrial activity','leak','Waste disposal', 'Agriculture pollutants', 'Fertilisers', 'Pesticide','Human waste'};


% Plot the diagram
figure;
hold on;
xlim([0, 10]);
ylim([0,10]);
set(gca, 'Visible', 'off');
rectangle('position',[6,5,3,3]);
x = [0.5 6];
y = [6.5 6.5 ]; 

line(x, y, 'Color', 'r', 'LineWidth', 2); 

% Draw diagonal lines
x1 = [5 4.5];
x2 = [1.5 0.5];
y1 = [6.5 4.5];
y2 = [6.5 8.5];
y3 = [7.2 7.2];
x3=[4.8 3.8];
x4 = [ 4.7 3.7];
y4= [ 7.8 7.8];
x5=[4.6 3.6];
y5=[5 5];
x6=[4.8 3.8];
y6=[ 5.8 5.8];


line(x1, y1, 'Color', 'b', 'LineWidth', 2);
line(x5, y5, 'Color', 'b', 'LineWidth', 2);
line(x6, y6, 'Color', 'b', 'LineWidth', 2);

line(x1, y2, 'Color', 'b', 'LineWidth', 2);
line(x3,y3, 'Color', 'b', 'LineWidth', 2);
line(x4, y4, 'Color', 'b', 'LineWidth', 2);
line(x2, y2, 'Color', 'b', 'LineWidth', 2);

% Draw tail
x1_triangle = [0.5 0.1 ];
y1_triangle = [6.5 6 ];
y2_triangle = [6.5  7];


line(x1_triangle, y1_triangle, 'Color', 'g', 'LineWidth', 2);
line(x1_triangle, y2_triangle, 'Color', 'g', 'LineWidth', 2);

% Add text labels
text(6.7, 6.5, "Na pollution", 'HorizontalAlignment', 'left');
text(4.7 , 4.2, causesNa{1}, 'HorizontalAlignment', 'right');
text(3.5 , 5.8, causesNa{2}, 'HorizontalAlignment', 'right');
text(3.3 , 5, causesNa{3}, 'HorizontalAlignment', 'right');

text(5, 9, causesNa{4}, 'HorizontalAlignment', 'right');
text(3.5, 7.2, causesNa{5}, 'HorizontalAlignment', 'right');
text(3.5, 7.8, causesNa{6}, 'HorizontalAlignment', 'right');
text(0.3, 9.2, causesNa{7}, 'HorizontalAlignment', 'left');

hold off;
        case 'SO4'
            % fishbone diagram of SO4
% Define the causes of SO4 pollution
causes = {'Soil type of the river', 'Sewage water', 'Agricultural drainage water', 'Car wash water'};


% Plot the diagram
figure;
hold on;

xlim([0, 10]);
ylim([0,10]);
set(gca, 'Visible', 'off');
rectangle('position',[6,5,3,3]);
x = [0.5 6];
y = [6.5 6.5 ]; 

line(x, y, 'Color', 'r', 'LineWidth', 2); 

% Draw diagonal lines
x1 = [5 4.5];
y1 = [6.5 4.5];
y2 = [6.5 8.5];
x2=[2.5 1.5];


line(x1, y1, 'Color', 'b', 'LineWidth', 2);
line(x1, y2, 'Color', 'b', 'LineWidth', 2);
line(x2, y1, 'Color', 'b', 'LineWidth', 2);
line(x2, y2, 'Color', 'b', 'LineWidth', 2);

% Draw tail
x1_triangle = [0.5 0.1 ];
y1_triangle = [6.5 6 ];
y2_triangle = [6.5  7];

line(x1_triangle, y1_triangle, 'Color', 'g', 'LineWidth', 2);
line(x1_triangle, y2_triangle, 'Color', 'g', 'LineWidth', 2);

% Add text labels
text(6.5, 6.5, "SO4 pollution", 'HorizontalAlignment', 'left');

text(6 , 3.8, causes{1}, 'HorizontalAlignment', 'right');
text(6.7, 9, causes{2}, 'HorizontalAlignment', 'right');
text(0.3, 4.2, causes{3}, 'HorizontalAlignment', 'left');
text(0.3, 9.2, causes{4}, 'HorizontalAlignment', 'left');
hold off;

        case 'Cl'
% fishbone diagram of Cl
% Define the causes of Cl pollution
causescl = {'Soil type of the river', 'Sewage water', 'Agricultural drainage water', 'Car wash water'};


% Plot the diagram
figure;
hold on;
xlim([0, 10]);
ylim([0,10]);
set(gca, 'Visible', 'off');
rectangle('position',[6,5,3,3]);
x = [0.5 6];
y = [6.5 6.5 ]; 

line(x, y, 'Color', 'r', 'LineWidth', 2); 

% Draw diagonal lines
x1 = [5 4.5];
y1 = [6.5 4.5];
x2=[2.5 1.5];
y2 = [6.5 8.5];


line(x1, y1, 'Color', 'b', 'LineWidth', 2);
line(x1, y2, 'Color', 'b', 'LineWidth', 2);
line(x2, y1, 'Color', 'b', 'LineWidth', 2);
line(x2, y2, 'Color', 'b', 'LineWidth', 2);

% Draw tail
x1_triangle = [0.5 0.1 ];
y1_triangle = [6.5 6 ];
y2_triangle = [6.5  7];


line(x1_triangle, y1_triangle, 'Color', 'g', 'LineWidth', 2);
line(x1_triangle, y2_triangle, 'Color', 'g', 'LineWidth', 2);

% Add text labels
text(6.5, 6.5, "Cl pollution", 'HorizontalAlignment', 'left');

text(6 , 3.8, causescl{1}, 'HorizontalAlignment', 'right');
text(6.7, 9, causescl{2}, 'HorizontalAlignment', 'right');
text(0.3, 4.2, causescl{3}, 'HorizontalAlignment', 'left');
text(0.3, 9.2, causescl{4}, 'HorizontalAlignment', 'left');

hold off; 
        case 'TDS'
% fishbone diagram of TDS
% Define the causes of  TDS pollution
causesTDS = {'Soil and rocks', 'low levels', 'Evaporation', 'Lack of releases','Human pollution'};


% Plot the diagram
figure;
hold on;
xlim([0, 10]);
ylim([0,10]);
set(gca, 'Visible', 'off');
rectangle('position',[6,5,3,3]);
x = [0.5 6];
y = [6.5 6.5 ]; 

line(x, y, 'Color', 'r', 'LineWidth', 2); 

% Draw diagonal lines
x1 = [5 4.5];
x2 = [1.5 0.5];
y1 = [6.5 4.5];
y2 = [6.5 8.5];
y3 = [7.2 7.2];
x3=[4.8 3.8];
x4 = [ 4.7 3.7];
y4= [ 7.8 7.8];


line(x1, y1, 'Color', 'b', 'LineWidth', 2);
line(x1, y2, 'Color', 'b', 'LineWidth', 2);
line(x3,y3, 'Color', 'b', 'LineWidth', 2);
line(x4, y4, 'Color', 'b', 'LineWidth', 2);
line(x2, y2, 'Color', 'b', 'LineWidth', 2);

% Draw tail
x1_triangle = [0.5 0.1 ];
y1_triangle = [6.5 6 ];
y2_triangle = [6.5  7];


line(x1_triangle, y1_triangle, 'Color', 'g', 'LineWidth', 2);
line(x1_triangle, y2_triangle, 'Color', 'g', 'LineWidth', 2);

% Add text labels
text(6.5, 6.5, "TDS pollution", 'HorizontalAlignment', 'left');
text(4.7 , 4.2, causesTDS{1}, 'HorizontalAlignment', 'right');
text(5, 8.7, causesTDS{2}, 'HorizontalAlignment', 'right');
text(3.5, 7.2, causesTDS{3}, 'HorizontalAlignment', 'right');
text(3.5, 7.8, causesTDS{4}, 'HorizontalAlignment', 'right');
text(0.3, 9.2, causesTDS{5}, 'HorizontalAlignment', 'left');

hold off;
        case 'EC'
% fishbone diagram of E.C
% Define the causes of E.C pollution
causesE.C = { 'Agriculture pollutants', 'Fertilisers', 'Pesticide','Industrial activity','leak','Waste disposal','Biological contamination','Animalistic','Vegetarian'};
% Plot the diagram
figure;
hold on;
xlim([0, 10]);
ylim([0,10]);
set(gca, 'Visible', 'off');
rectangle('position',[6,5,3,3]);
x = [0.5 6];
y = [6.5 6.5 ]; 

line(x, y, 'Color', 'r', 'LineWidth', 2); 



% Draw % Draw diagonal lines

x1 = [5 4.5];
y1 = [6.5 4.5];
x2 = [1.5 0.5];
y2 = [6.5 8.5];
x3=[4.8 3.8];
y3 = [7.2 7.2];
x4 = [ 4.7 3.7];
y4= [ 7.8 7.8];
x5=[4.6 3.6];
y5=[5 5];
x6=[4.8 3.8];
y6=[ 5.8 5.8];
x7=[1.2 0.5];
x8=[0.8 0.5];

% main lines
line(x1, y1, 'Color', 'b', 'LineWidth', 2);
line(x1, y2, 'Color', 'b', 'LineWidth', 2);
line(x2, y1, 'Color', 'b', 'LineWidth', 2);


% sublines
line(x5, y5, 'Color', 'b', 'LineWidth', 2);
line(x6, y6, 'Color', 'b', 'LineWidth', 2);
line(x3,y3, 'Color', 'b', 'LineWidth', 2);
line(x4, y4, 'Color', 'b', 'LineWidth', 2);
line(x7, y6, 'Color', 'b', 'LineWidth', 2);
line(x8, y5, 'Color', 'b', 'LineWidth', 2);


% Draw tail
x1_triangle = [0.5 0.1 ];
y1_triangle = [6.5 6 ];
y2_triangle = [6.5  7];


line(x1_triangle, y1_triangle, 'Color', 'g', 'LineWidth', 2);
line(x1_triangle, y2_triangle, 'Color', 'g', 'LineWidth', 2);

% Add text labels
%main lables
text(6.3, 6.5, "E.C pollution", 'HorizontalAlignment', 'left');
text(4.7 , 4.2, causesE.C{1}, 'HorizontalAlignment', 'right');
text(5, 8.6, causesE.C{4}, 'HorizontalAlignment', 'right');
text(0.3, 4.5, causesE.C{7}, 'HorizontalAlignment', 'right');

% secondary lables
text(3.5 , 5.8, causesE.C{2}, 'HorizontalAlignment', 'right');
text(3.3 , 5, causesE.C{3}, 'HorizontalAlignment', 'right');
text(3.5, 7.2, causesE.C{5}, 'HorizontalAlignment', 'right');
text(3.5, 7.8, causesE.C{6}, 'HorizontalAlignment', 'right');
text(0.3, 5, causesE.C{8}, 'HorizontalAlignment', 'right');
text(0.3, 5.8, causesE.C{9 }, 'HorizontalAlignment', 'right');
hold off;
        case 'ALK'
% fishbone diagram of ALK
% Define the causes of  ALK pollution
causesA.L.K = {'swage water', 'Agriculture pollutants', 'Fertilisers', 'Pesticide','Industrial activity','leak','Waste disposal','Alkalinity','K','Ca'};
% Plot the diagram
figure;
hold on;
xlim([0, 10]);
ylim([0,10]);
set(gca, 'Visible', 'off');
rectangle('position',[6,5,3,3]);
x = [0.5 6];
y = [6.5 6.5 ]; 

line(x, y, 'Color', 'r', 'LineWidth', 2); 

% Draw % Draw diagonal lines

x1 = [5 4.5];
y1 = [6.5 4.5];
x2 = [1.5 0.5];
y2 = [6.5 8.5];
x3=[4.8 3.8];
y3 = [7.2 7.2];
x4 = [ 4.7 3.7];
y4= [ 7.8 7.8];
x5=[4.6 3.6];
y5=[5 5];
x6=[4.8 3.8];
y6=[ 5.8 5.8];
x7=[1.2 0.5];
x8=[0.8 0.5];

% main lines
line(x1, y1, 'Color', 'b', 'LineWidth', 2);
line(x1, y2, 'Color', 'b', 'LineWidth', 2);
line(x2, y2, 'Color', 'b', 'LineWidth', 2);
line(x2, y1, 'Color', 'b', 'LineWidth', 2);


% sublines
line(x5, y5, 'Color', 'b', 'LineWidth', 2);
line(x6, y6, 'Color', 'b', 'LineWidth', 2);
line(x3,y3, 'Color', 'b', 'LineWidth', 2);
line(x4, y4, 'Color', 'b', 'LineWidth', 2);
line(x7, y6, 'Color', 'b', 'LineWidth', 2);
line(x8, y5, 'Color', 'b', 'LineWidth', 2);


% Draw triangle
x1_triangle = [0.5 0.1 ];
y1_triangle = [6.5 6 ];
y2_triangle = [6.5  7];


line(x1_triangle, y1_triangle, 'Color', 'g', 'LineWidth', 2);
line(x1_triangle, y2_triangle, 'Color', 'g', 'LineWidth', 2);

% Add text labels
%main lables
text(6.3, 6.5, "A.L.K pollution", 'HorizontalAlignment', 'left');
text(0.3, 9.2, causesA.L.K{1}, 'HorizontalAlignment', 'left');
text(4.7 , 4.2, causesA.L.K{2}, 'HorizontalAlignment', 'right');
text(5, 8.6, causesA.L.K{5}, 'HorizontalAlignment', 'right');
text(0.3, 4.5, causesA.L.K{8}, 'HorizontalAlignment', 'right');

% secondary lables
text(3.5 , 5.8, causesA.L.K{3}, 'HorizontalAlignment', 'right');
text(3.3 , 5, causesA.L.K{4}, 'HorizontalAlignment', 'right');
text(3.5, 7.2, causesA.L.K{6}, 'HorizontalAlignment', 'right');
text(3.5, 7.8, causesA.L.K{7}, 'HorizontalAlignment', 'right');
text(0.3, 5, causesA.L.K{9}, 'HorizontalAlignment', 'right');
text(0.3, 5.8, causesA.L.K{10 }, 'HorizontalAlignment', 'right');
hold off;
        case 'TUR'
% fishbone diagram of Turbiolity
% Define the causes of  Turbiolity pollution
causesTurbiolity = {'mud','dust', 'Sewage water', 'Pollutants', 'Car wash water'};


% Plot the diagram
figure;
hold on;
xlim([0, 10]);
ylim([0,10]);
set(gca, 'Visible', 'off');
rectangle('position',[6,5,3,3]);
x = [0.5 6];
y = [6.5 6.5 ]; 

line(x, y, 'Color', 'r', 'LineWidth', 2); 

% Draw diagonal lines
x1 = [5 4.5];
x2 = [1.5 0.5];
y1 = [6.5 4.5];
y2 = [6.5 8.5];
y3 = [6.5  8.5];
x3=[3.5 2.5];


line(x1, y1, 'Color', 'b', 'LineWidth', 2);
line(x1, y2, 'Color', 'b', 'LineWidth', 2);
line(x3,y3, 'Color', 'b', 'LineWidth', 2);
line(x2, y1, 'Color', 'b', 'LineWidth', 2);
line(x2, y2, 'Color', 'b', 'LineWidth', 2);

% Draw tail
x1_triangle = [0.5 0.1 ];
y1_triangle = [6.5 6 ];
y2_triangle = [6.5  7];

line(x1_triangle, y1_triangle, 'Color', 'g', 'LineWidth', 2);
line(x1_triangle, y2_triangle, 'Color', 'g', 'LineWidth', 2);

% Add text labels
text(6.5, 6.5, "Turbiolity pollution", 'HorizontalAlignment', 'left');
text(4.7 , 4.2, causesTurbiolity{1}, 'HorizontalAlignment', 'right');
text(3.2, 9, causesTurbiolity{2}, 'HorizontalAlignment', 'right');
text(6.9, 8.8, causesTurbiolity{3}, 'HorizontalAlignment', 'right');
text(0.3, 4.2, causesTurbiolity{4}, 'HorizontalAlignment', 'left');
text(0.3, 9.2, causesTurbiolity{5}, 'HorizontalAlignment', 'left');

hold off;    
        case 'TPC'
            causesarray ={'Soil and rocks', 'low levels', 'Evaporation', 'Lack of releases','Human pollution'};
        case 'coliform'
% fishbone diagram of coliforms
% Define the causes of  coliforms pollution
causescoliforms = {'Biological contamination', 'Agriculture pollutants', 'Fertilisers', 'Pesticide','Industrial activity','leak','Waste disposal'};
% Plot the diagram
figure;
hold on;
xlim([0, 10]);
ylim([0,10]);
set(gca, 'Visible', 'off');
rectangle('position',[6,5,3,3]);
x = [0.5 6];
y = [6.5 6.5 ]; 

line(x, y, 'Color', 'r', 'LineWidth', 2); 

% Draw diagonal lines

x1 = [5 4.5];
x2 = [1.5 0.5];
y1 = [6.5 4.5];
y2 = [6.5 8.5];
y3 = [7.2 7.2];
x3=[4.8 3.8];
x4 = [ 4.7 3.7];
y4= [ 7.8 7.8];
x5=[4.6 3.6];
y5=[5 5];
x6=[4.8 3.8];
y6=[ 5.8 5.8];


line(x1, y1, 'Color', 'b', 'LineWidth', 2);
line(x5, y5, 'Color', 'b', 'LineWidth', 2);
line(x6, y6, 'Color', 'b', 'LineWidth', 2);

line(x1, y2, 'Color', 'b', 'LineWidth', 2);
line(x3,y3, 'Color', 'b', 'LineWidth', 2);
line(x4, y4, 'Color', 'b', 'LineWidth', 2);
line(x2, y2, 'Color', 'b', 'LineWidth', 2);

% Draw tail
x1_triangle = [0.5 0.1 ];
y1_triangle = [6.5 6 ];
x2_triangle = [0.5 0.1 ];
y2_triangle = [6.5  7];


line(x1_triangle, y1_triangle, 'Color', 'g', 'LineWidth', 2);
line(x1_triangle, y2_triangle, 'Color', 'g', 'LineWidth', 2);

% Add text labels
text(6.3, 6.5, "coliforms pollution", 'HorizontalAlignment', 'left');
text(4.7 , 4.2, causescoliforms{2}, 'HorizontalAlignment', 'right');
text(3.5 , 5.8, causescoliforms{3}, 'HorizontalAlignment', 'right');
text(3.3 , 5, causescoliforms{4}, 'HorizontalAlignment', 'right');

text(5, 8.6, causescoliforms{5}, 'HorizontalAlignment', 'right');
text(3.5, 7.2, causescoliforms{6}, 'HorizontalAlignment', 'right');
text(3.5, 7.8, causescoliforms{7}, 'HorizontalAlignment', 'right');
text(0.3, 9.2, causescoliforms{1}, 'HorizontalAlignment', 'left');
 
hold off;

% fishbone diagram of E.C
% Define the causes of E.C pollution
causesE.C = { 'Agriculture pollutants', 'Fertilisers', 'Pesticide','Industrial activity','leak','Waste disposal','Biological contamination','Animalistic','Vegetarian'};
% Plot the diagram
figure;
hold on;
xlim([0, 10]);
ylim([0,10]);
set(gca, 'Visible', 'off');
rectangle('position',[6,5,3,3]);
x = [0.5 6];
y = [6.5 6.5 ]; 

line(x, y, 'Color', 'r', 'LineWidth', 2); 



% Draw % Draw diagonal lines

x1 = [5 4.5];
y1 = [6.5 4.5];
x2 = [1.5 0.5];
y2 = [6.5 8.5];
x3=[4.8 3.8];
y3 = [7.2 7.2];
x4 = [ 4.7 3.7];
y4= [ 7.8 7.8];
x5=[4.6 3.6];
y5=[5 5];
x6=[4.8 3.8];
y6=[ 5.8 5.8];
x7=[1.2 0.5];
x8=[0.8 0.5];

% main lines
line(x1, y1, 'Color', 'b', 'LineWidth', 2);
line(x1, y2, 'Color', 'b', 'LineWidth', 2);
line(x2, y1, 'Color', 'b', 'LineWidth', 2);


% sublines
line(x5, y5, 'Color', 'b', 'LineWidth', 2);
line(x6, y6, 'Color', 'b', 'LineWidth', 2);
line(x3,y3, 'Color', 'b', 'LineWidth', 2);
line(x4, y4, 'Color', 'b', 'LineWidth', 2);
line(x7, y6, 'Color', 'b', 'LineWidth', 2);
line(x8, y5, 'Color', 'b', 'LineWidth', 2);


% Draw tail
x1_triangle = [0.5 0.1 ];
y1_triangle = [6.5 6 ];
y2_triangle = [6.5  7];


line(x1_triangle, y1_triangle, 'Color', 'g', 'LineWidth', 2);
line(x1_triangle, y2_triangle, 'Color', 'g', 'LineWidth', 2);

% Add text labels
%main lables
text(6.3, 6.5, "E.C pollution", 'HorizontalAlignment', 'left');
text(4.7 , 4.2, causesE.C{1}, 'HorizontalAlignment', 'right');
text(5, 8.6, causesE.C{4}, 'HorizontalAlignment', 'right');
text(0.3, 4.5, causesE.C{7}, 'HorizontalAlignment', 'right');

% secondary lables
text(3.5 , 5.8, causesE.C{2}, 'HorizontalAlignment', 'right');
text(3.3 , 5, causesE.C{3}, 'HorizontalAlignment', 'right');
text(3.5, 7.2, causesE.C{5}, 'HorizontalAlignment', 'right');
text(3.5, 7.8, causesE.C{6}, 'HorizontalAlignment', 'right');
text(0.3, 5, causesE.C{8}, 'HorizontalAlignment', 'right');
text(0.3, 5.8, causesE.C{9 }, 'HorizontalAlignment', 'right');
hold off;
        case 'Ecoli'
% fishbone diagram of E.coli
% Define the causes of  E.coli pollution
causesE.coli = {'Biological contamination', 'Agriculture pollutants', 'Fertilisers', 'Pesticide','Animals carrying bacteria'};


% Plot the diagram
figure;
hold on;
xlim([0, 10]);
ylim([0,10]);
set(gca, 'Visible', 'off');
rectangle('position',[6,5,3,3]);
x = [0.5 6];
y = [6.5 6.5 ]; 

line(x, y, 'Color', 'r', 'LineWidth', 2); 

% Draw diagonal lines
x1 = [5 4.5];
x2 = [1.5 0.5];
y1 = [6.5 4.5];
y2 = [6.5 8.5];
y3 = [7.2 7.2];
x3=[4.8 3.8];
x4 = [ 4.7 3.7];
y4= [ 7.8 7.8];


line(x1, y1, 'Color', 'b', 'LineWidth', 2);
line(x1, y2, 'Color', 'b', 'LineWidth', 2);
line(x3,y3, 'Color', 'b', 'LineWidth', 2);
line(x4, y4, 'Color', 'b', 'LineWidth', 2);
line(x2, y2, 'Color', 'b', 'LineWidth', 2);

% Draw tail
x1_triangle = [0.5 0.1 ];
y1_triangle = [6.5 6 ];
y2_triangle = [6.5  7];


line(x1_triangle, y1_triangle, 'Color', 'g', 'LineWidth', 2);
line(x1_triangle, y2_triangle, 'Color', 'g', 'LineWidth', 2);

% Add text labels
text(6.5, 6.5, "E.coli pollution", 'HorizontalAlignment', 'left');
text(4.7 , 4.2, causesE.coli{1}, 'HorizontalAlignment', 'right');
text(5, 8.7, causesE.coli{2}, 'HorizontalAlignment', 'right');
text(3.5, 7.2, causesE.coli{3}, 'HorizontalAlignment', 'right');
text(3.5, 7.8, causesE.coli{4}, 'HorizontalAlignment', 'right');
text(0.3, 9.2, causesE.coli{5}, 'HorizontalAlignment', 'left');

hold off;
           
        otherwise
            causesarray = {}; % Empty array for unknown cases
    end
    end


