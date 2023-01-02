% 2022/12/26

clc;
clear;
close all;

% 3차원 데이터에 대한 등심선을 표현하는 함수

% [C, h] = contour(Z, n) 
    % 행렬 Z에 대한 n개의 등고선을 그린다. 
% [C, h] = contour(Z, v) 
    % 행렬 Z에 대한 등심선을 벡터 v값에 근거하여 그린다.

% peaks: 49×49 그리드에서 계산된 peaks 함수의 z 좌표를 반환 (random?)
subplot(2, 2, 1); 
a = peaks;
[c1, h1] = contour(a, 10);
set(gcf, 'color', [.9, .9, .9]);
title('contour exercise \alpha', 'fontsize', 15);
clabel(c1);      % cotour value labeling


% meshgrid: 벡터 x 및 y에 포함된 좌표를 바탕으로 2차원 그리드 좌표를 반환
subplot(2, 2, 2); 
[x, y] = meshgrid(-4 : 0.2 : 4);
z = exp(-0.5 * (x .^ 2 + 0.5 * (x - y) .^ 2)); 
contour(x, y, z);
title('contour exercise \beta', 'fontsize', 15);

% magic: 마방진(Magic Square)
    % 행과 열의 합계가 동일하고 1 ~ n2 범위의 정수로 생성된 n×n 행렬을 반환
subplot(2, 2, 3); 
Z = magic(4);
[c2, h2] = contour(interp2(Z, 4));
h3 = clabel(c2, h2, 'manual'); 
set(h3, 'BackgroundColor', [1, 1, .6], ...
    'Edgecolor', [.7, .7, .7]);
colormap('cool');

% [x, y, z]에서 y output을 확인할 필요가 없을 때 [x, ~, z]로 표현가능