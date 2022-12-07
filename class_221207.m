% ----------------------- 221207 -------------------------
% script
    % for simple calculation, command window is enough
    % documentation
    % you can check buit-in function -> open [func_name]

% algorithm

% in general, script starts with the followings:
clc;
clear;
close all;


disp('Note: the units will be inches.');
rad = input("Please enter the radius: ");
txt_rad = sprintf('%.2f', rad);
disp(['For a circle with a radius of ', txt_rad, ' inches,']);
area = (rad ^ 2) * pi;
txt_area = sprintf('%.2f', area);
disp(['the area is ', txt_area, ' inches squared']);


