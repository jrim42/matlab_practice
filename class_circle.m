% 2022/12/26

clc;
clear;
close all;

% circle and eclipse
subplot(1, 4, 1); 
[x, y] = scircle1(0, 0, 2); 
plot(x, y, '-b');
hold on;
plot(0, 0, '*');
axis equal;

subplot(1, 4, 2);
D = (0 : 10 : 360) * (pi / 180); 
X = 2 * cos(D); 
Y = 2 * sin(D); 
plot(X, Y, 'k');
axis equal;
