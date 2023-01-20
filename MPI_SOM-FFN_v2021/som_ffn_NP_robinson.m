%%
clc;
clear;
close all;

addpath('/Users/jrim/Desktop/mat/MPI_SOM-FFN_v2021/');
addpath('/Applications/MATLAB_R2022b.app/toolbox/m_map');
addpath('/Applications/MATLAB_R2022b.app/toolbox/cbarrow');

%% nc file
src = 'MPI-SOM_FFN_v2021_NCEI_OCADS.nc';

finfo = ncinfo(src);

lon = ncread(src, 'lon');          % -180 ~ 180
lat = ncread(src, 'lat');          % -90 ~ 90
date = ncread(src, 'date');
spco2 = ncread(src, 'spco2_smoothed');

%% data handling
[latM, lonM] = meshgrid(lat, lon);
latM2 = [latM; latM];
lonM2 = [lonM; lonM + 360];
spco2 = squeeze(spco2);
spco2_tmp = [spco2(:, :, 234); spco2(:, :, 234)];

%% figure setting
f = figure('Name', 'sea surface pCO2 product', ...
           'NumberTitle', 'off');
f.Position(3:4) = [1000, 500];

%% title positioning
title('SOM-FFN: North Pacific pCO2');
set(gca, 'Units', 'normalized')
titleHandle = get(gca ,'Title');
titlePos = get(titleHandle , 'position');
titlePos = titlePos + [-0.5, 0.4, 0];
set(titleHandle, 'position', titlePos);

%% date table
d = table(datetime(date(1,:), date(2,:), date(3,:)));
d2 = splitvars(d);
d3 = table2array(d2)';
clear d;
clear d2;
clear date;

%% north pacific
lonNP = [90, 295];
latNP = [-5, 70];
spco2_NP = spco2_tmp(100:295, 90:157);

%% coloring

m_proj('robinson', 'lon', lonNP, 'lat', latNP); 
hold on;
m_pcolor(lonM2, latM2, spco2_tmp);
m_contourf(lonM2, latM2, spco2_tmp, 300:10:450, 'color', 'k');    % contour
m_coast('patch', [.6 .6 .6]);   

m_grid('tickdir', 'out', 'linewi', 2);
colormap(m_colmap('jet', 'step', 10));

set(gca, 'xlimmode', 'auto', 'ylimmode', 'auto');

%% colorbar setting
colormap(parula(15));   % dividing colorbar
h = colorbar;
h.Location = 'southoutside';
h.Position = [0.25 0.1 0.5 0.02];
h.Box = 'on';
clim([300, 450]);
cbarrow;                % function for pointy-end colorbar
set(h, 'tickdir', 'out');
set(get(h, 'ylabel'), 'String', 'pCO2 [μatm]');

% m_proj get;
