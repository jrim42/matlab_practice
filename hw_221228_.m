clear;
clc;
close all;
load HOT-DOGS.mat;

f = figure('Name', 'Monthly Alkalinity', ...
           'NumberTitle', 'off');
f.Position(3:4) = [900, 750];
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
