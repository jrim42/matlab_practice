%% assignment 2
    % 첨부한 자료는 우리나라 전국 도시대기 관측소의 2016년 실제 자료입니다.
    % 강원도에 있는 관측소 몇 개 있는지 찾고, 강원도의 모든 관측소의 PM10 농도 시계열 자료를 그리세요.
    % 파일을 열면, 첫번째 row에 각 column에 대한 설명이 있고 두번째 row부터 실제 자료입니다. 
    % TMSID는 측정소 아이디인 것 같고 나머지는 보면 알 수 있습니다.

%% variables
    %   1.  loc1      시도                         
    %   2.  loc2      도시              
    %   3.  loc3      시군구            
    %   4.  station   측정소명          
    %   5.  TMSID     TMSID           
    %   6.  time      YYYYMMDDHH      
    %   7.  SO2       SO2(ppm)        
    %   8.  PM10      PM10(㎍/㎥)      
    %   9.  O3        O3(ppm)         
    %   10. NO2       NO2(ppm)        
    %   11. CO        CO(ppm)         
    %   12. PM2_5     PM2.5(㎍/㎥)     

%%
clc;
clear;
close all;

%% importing data
opts = detectImportOptions('data_2016.txt');
opts.DataLines = [2, Inf];
opts.Delimiter = ",";
opts.VariableNames = ["loc1", "loc2", "loc3", "station", ...
                      "TMSID", "time", "SO2", "PM10", ...
                      "O3", "NO2", "CO", "PM2_5"];
opts.VariableTypes = ["string", "string", "string", "string", ...
                      "double", "string", "double", "double", ...
                      "double", "double", "double", "double"];
t1 = readtable('data_2016.txt', opts);

%% data filtering
t1.loc1 = categorical(t1.loc1);
t1 = t1(t1.loc1 == '강원' & t1.PM10 >= 0, :);
t2 = table(t1.loc1, t1.loc2, t1.loc3, t1.station, t1.TMSID, t1.time, t1.PM10);
clear t1;

%% variable setting
t2 = renamevars(t2, ["Var1", "Var2", "Var3", "Var4", "Var5", "Var6", "Var7"], ...
                ["loc1", "loc2", "loc3", "station", "TMSID", "time", "PM10"]);
t2.time = datetime(t2.time, 'InputFormat', 'yyyyMMddHH');

%% plot setting
f = figure('Name', 'PM10 of Gangwon-do Province', ...
           'NumberTitle', 'off');
f.Position(3:4) = [1000, 750];
set(gcf, 'Color', [.95, .95, .95]);

stationID = unique(t2.TMSID);
stationNum = height(stationID);

%% subplot - 관측소별 시계열데이터
i = 1;
while (i <= stationNum)
    nexttile;
    hold on;
    box on;
%     set(gca, 'XLim', [datetime(2016, 1, 1), datetime(2016, 12, 31)]);
%     datetick('x', 'MMM-yy', 'keepticks');
    xlabel('Time');
    ylabel('PM10 (㎍/㎥)');
    ylim([0, 550]);

    sub = find(t2.TMSID == stationID(i));
    stationLoc = t2.loc3(sub(1)) + ' ' + t2.station(sub(1));
    title(stationLoc + ' (TMSID: ' + num2str(stationID(i)) + ')');
    plot(t2.time(sub), t2.PM10(sub), ...
         'blue-', 'LineWidth', .7);
    i = i + 1;
end

