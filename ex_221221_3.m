clc;
clear;
close all;

% double-y-axis
title('exercise2');

x1 = 0 : 1 : 50;
% y1 = sqrt(4 - x1 .^ 2);

% plotyy is not recommended. 
% [ax, h1, h2] = plotyy(x1, y1, x1, y2);
% axes(ax(1));
% ylable('warm')

% With appropriate code changes, use 'yyaxis' instead.
plot(x1,y1);
% ylim([0, 30]);