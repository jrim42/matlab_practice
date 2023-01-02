% 2022/12/26

clc;
clear;
close all;

[c, h, cf] = contourf(peaks(40), 20); 
colormap winter;
clabel(c); 
set(gcf, 'color', 'w');
title('contourf exercise', 'fontsize', 16);

% Warning: The V6 compatibility output argument from CONTOURF has been set to the empty matrix.  
    % This will become an error in a future release. 
% V6 호환성 출력 인수가 빈 행렬로 설정되었습니다. 향후 릴리스에서는 오류로 간주됩니다.