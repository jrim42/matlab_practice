clc;
clear;
close all;

% plot
    % plot([0,0]): only dot -> nothing is displayed
    % get(gca)
        % gca = get current access
        % gcf = get current figure
    % set
% figure: to draw multiple graph, use figure

figure;
title('test');
plot([0,0], [2,2]);
hold on;
plot([0,2], [1,1]);

% color
    % uisetcolor();