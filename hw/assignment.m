% 첨부한 자료는 우리나라 전국 도시대기 관측소의 2016년 실제 자료입니다.
% 강원도에 있는 관측소 몇 개 있는지 찾고, 강원도의 모든 관측소의 PM10 농도 시계열 자료를 그리세요.
% 파일을 열면, 첫번째 row에 각 column에 대한 설명이 있고 두번째 row부터 실제 자료입니다. 
% TMSID는 측정소 아이디인 것 같고 나머지는 보면 알 수 있습니다.

% readtable, readmatrix
% detectImportOptions
% textscan

% delimiter

% variables
%   1.  d_loc1      시도                         
%   2.  d_loc2      도시              
%   3.  d_loc3      시군구            
%   4.  d_station   측정소명          
%   5.  d_TMSID     TMSID           
%   6.  d_date      YYYYMMDDHH      
%   7.  d_SO2       SO2(ppm)        
%   8.  d_PM10      PM10(㎍/㎥)      
%   9.  d_O3        O3(ppm)         
%   10. d_NO2       NO2(ppm)        
%   11. d_CO        CO(ppm)         
%   12. d_PM2       PM2.5(㎍/㎥)     

clc;
clear;
close all;

%% importing data
opts = detectImportOptions('data_2016.txt');
opts.DataLines = [2, Inf];
opts.Delimiter = ",";
opts.VariableNames = ["loc1", "loc2", "loc3", "station", ...
                      "TMSID", "YYYYMMDDHH", "SO2", "PM10", ...
                      "O3", "NO2", "CO", "PM2_5"];
opts.VariableTypes = ["string", "string", "string", "string", ...
                      "double", "double", "double", "double", ...
                      "double", "double", "double", "double"];
t1 = readtable('data_2016.txt', opts);

%% data filtering
t2 = table(t1.loc1, t1.loc2, t1.loc3, t1.station, t1.TMSID, t1.YYYYMMDDHH, t1.PM10);
t2.Var1 = categorical(t2.Var1);
t3 = t2(t2.Var1 == '강원' & t2.Var7 >= 0, :);
clear t1;
clear t2;

%% variable name setting
t3 = renamevars(t3, ["Var1", "Var2", "Var3", "Var4", "Var5", "Var6", "Var7"], ...
                ["loc1", "loc2", "loc3", "station", "TMSID", "YYYYMMDDHH", "PM10"]);
% t3.YYYYMMDDHH = t3.YYYYMMDDHH - 2010000000;

%% plot setting - 관측소별 시계열데이터

% station 개수에 따라 subplot을 만들어줘야한다.
stationID = unique(t3.TMSID);
stationNum = height(stationID);

f = figure('Name', 'PM10 of Gangwon-do Province', ...
           'NumberTitle', 'off');
f.Position(3:4) = [900, 750];
set(gcf, 'Color', [1, 1, 1]);

i = 1;
while (i <= stationNum)
    % plot setting
    subplot(3, 2, i);  % 개수 정해놔야함
    hold on;
    box on;
    xlabel('Time')
    ylabel('PM10')
    title(['TMSID: ', num2str(stationID(i))]);
    sub = find(t3.TMSID == stationID(i));
    plot(t3.YYYYMMDDHH(sub), t3.PM10(sub), ...
         'red-', 'LineWidth', 1);
    i = i + 1;
end

