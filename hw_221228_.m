clear;
clc;
close all;
load HOT-DOGS.mat;

data = table(d_yr, d_mon, d_press, d_alk);
filtered = data(data.d_press <= 10 & data.d_alk >= 0, :);
l_mon = ["Jan", "Feb", "Mar", "Apr", ...
         "May", "Jun", "Jul", "Aug", ...
         "Sep", "Oct", "Nov", "Dec"];

f = figure('Name', 'Monthly Alkalinity', ...
       'NumberTitle', 'off');
f.Position(3:4) = [900, 750];
set(gcf, 'Color', [1, 1, 1]);
% set(gca, 'xtick', 1990:10:2020);
% set(gca, 'ytick', 2280:10:2340);

i = 1;
while (i <= 12)
    % plot setting
    subplot(3, 4, i);
    hold on;
    box on;
    xlabel('Year')
    ylabel('Alkalinity')
    title(l_mon{i})
    % plotting
    plot(filtered(filtered.d_mon == i, :), ...
        "d_yr", "d_alk", ...
        'Color', [1, 0, 0], ...
        'LineWidth', 1);
    scatter(filtered(filtered.d_mon == i, :), ...
        "d_yr", "d_alk", ...
        'MarkerEdgeColor', [1, 0, 0], ...
        'LineWidth', 1);
    i = i + 1;
end

