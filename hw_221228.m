clear;
clc;
close all;
load HOT-DOGS.mat;

% Variable 설명
% d_alk -> alkalinity
% d_booxy -> bottle oxygen
% d_coxy -> CTD oxygen
% d_bsal -> bottle salinity
% d_csal -> CTD salinity 
% d_temp -> seawater temperature
% d_dic -> dissolved inorganic carbon
% d_alk -> total alkalinity
% d_ph -> pH
% d_nit -> nitrate conc
% d_phos -> phosphate conc
% d_sil -> silicate conc
% d_press -> depth in meter (채수한 수심, 정확히는 압력인데 수심과 거의 같음)
 
% d_day -> 측정한 때의 day (1~31)
% d_mon -> 측정한 때의 month (1-12)
% d_yr -> 측정한 때의 year (대략 1988~2020)
% d_hour, d_min, d_sec -> 측정시간

% [설명] =======================================================
% 숙제: 위의 자료를 이용해서 첨부한  plot_for_alkalinity.jpg와 똑같이 그려보시오.
% 위의 변수들은 2번째 줄의 code에서 불러와진다. (이 파일 실행하면 workspace에 나타날 것임)
% 각 subplot마다 서로 다른 월의 연변화 값이 그려져 있음.
% 수심이 10미터 이하인 것만 그릴 걸 (0~10미터)
% alklinity가 0보다 작은 것(예: -999)은 측정값이 없다는 의미이므로 그림 그릴 때 제외해야 함. 
% 34번째 줄부터 code를 작성해서 그림을 그리시오.  지금까지 배운 것으로 충분히 다 할 수 있음.
% ----------------------------------------------------------------------------------------------------

f = figure('Name', 'Monthly Alkalinity', ...
           'NumberTitle', 'off');
f.Position(3:4) = [800, 750];
set(gcf, 'Color', 'white');

l_mon = ["Jan", "Feb", "Mar", "Apr", ...
         "May", "Jun", "Jul", "Aug", ...
         "Sep", "Oct", "Nov", "Dec"];

i = 1;
while (i <= 12)
    % plot setting
    subplot(3, 4, i);
    hold on;
    box on;
    xlabel('Year');
    ylabel('Alkalinity');
    title(l_mon{i});
    % plotting
    filtered = find(d_mon == i & d_press <= 10 & d_alk >= 0);
    plot(d_yr(filtered), d_alk(filtered), ...
        'red-O', 'LineWidth', 1);
    i = i + 1;
end