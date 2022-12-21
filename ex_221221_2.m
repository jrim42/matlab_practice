clc;
clear;
close all;

% double-y-axis
title('exercise2');

x1 = 0 : 0.1 : 5;
y1 = x1 .^2 + 1;
y2 = x1 .^3 - 1;

% plotyy is not recommended. 
% [ax, h1, h2] = plotyy(x1, y1, x1, y2);
% axes(ax(1));
% ylable('warm')

% With appropriate code changes, use 'yyaxis' instead.
yyaxis left;
plot(x1,y1);
yyaxis right;
plot(x1,y2);
ylim([0, 30]);