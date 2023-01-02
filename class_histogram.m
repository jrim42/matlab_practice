% 2022/12/26

clc;
clear;
close all;

x = -4:1:4;
y = [-5,-2,-1.5,-1,0,0.1,0.5,0.6,1,3];

subplot(1, 3, 1);
histogram(y, x);
title('기본 Histogram');

subplot(1, 3, 2);
histogram(y, x);
title('Color changed Histogram')
h = findobj(gca, 'Type', 'patch');
set(h,'FaceColor', 'g', 'EdgeColor', 'w');

subplot(1, 3, 3);
histfit(y, 2)
title('Histfit을 활용한 Histogram ')