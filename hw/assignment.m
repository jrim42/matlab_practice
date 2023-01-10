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
filename = fopen('data_2016.txt');

var = textscan(filename, repmat(' %s ', [1 12]), 1, ...
    'HeaderLines', 0, 'Delimiter', ',', 'ReturnOnError', false);
% data = textscan(filename, repmat(' %s ', [1 12]), 1, ...
%     'Delimiter', ',', 'ReturnOnError', false);

data = textscan(filename, [repmat('%s', [1, 6]), repmat('%n', [1, 6])], 1, ...
    'Delimiter', ',', 'ReturnOnError', false);
% data = textscan(filename, '%s %s %s %s %s %s %n %n %n %n %n %n', ...
%     'Delimiter', ',', 'ReturnOnError', false);

fclose(filename); 
clear filename ans

%% variable name setting

%% data filtering

selected = table(d_loc1, d_loc2, d_loc3, d_station, d_TMSID, d_date, d_PM10);
filtered = selected(selected.d_loc1 == '강원' & selected.d_PM10 >= 0 :);

%% plot setting
% 관측소별 시계열데이터
% stationNum = ?
%     station 개수에 따라 subplot을 만들어줘야한다.

% stationName 별로 string arrary 만들어주기

f = figure('Name', 'PM10 of Gangwon-do Province', ...
       'NumberTitle', 'off');
f.Position(3:4) = [900, 750];
set(gcf, 'Color', [1, 1, 1]);

i = 1;
while (i <= stationNum)
    % plot setting
    subplot(3, 4, i);  % 개수 정해놔야함
    hold on;
    box on;
    xlabel('Date')
    ylabel('PM10')
%     title(stationName{i})
%     plot(filtered(filtered.d_mon == i, :), ...
%         "d_yr", "d_alk", ...
%         'Color', [1, 0, 0], ...
%         'LineWidth', 1);
%     scatter(filtered(filtered.d_mon == i, :), ...
%         "d_yr", "d_alk", ...
%         'MarkerEdgeColor', [1, 0, 0], ...
%         'LineWidth', 1);
    i = i + 1;
end

