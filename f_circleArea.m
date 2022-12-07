% ----------------------- 221207 -------------------------

% function name should be same with the .m file name
function area = f_circleArea(rad)

clc;
close all;

disp('Note: the units will be inches.');
txt_rad = sprintf('%.2f', rad);
disp(['For a circle with a radius of ', txt_rad, ' inches,']);
area = (rad ^ 2) * pi;
txt_area = sprintf('%.2f', area);
disp(['the area is ', txt_area, ' inches squared']);

% if - elseif - else - end
% for - end
