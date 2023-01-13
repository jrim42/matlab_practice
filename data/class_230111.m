%% 230111 class nc file
%%
clc;
clear;
close all;

load LandMask.mat;

%%
src = 'CCMP_Wind_Analysis_201601_V02.0_L3.5_RSS.nc';

ncdisp(src);

finfo = ncinfo(src);
vinfo = ncinfo(src, "uwnd");

ncreadatt(src, "/", "references");

%%
wind_u = double(ncread(src, "uwnd"));
wind_v = double(ncread(src, "vwnd"));
wind_m = sqrt(wind_u.^2 + wind_v.^2);

Lat = double(ncread(src, "latitude"));
latIntv = diff(Lat);
Lon = double(ncread(src, "longitude"));
lonIntv = diff(Lon);

latGrd = repmat(Lat, length(Lon), 1);
lonGrd = repmat(Lon, 1, length(Lat));

%%
figure;

m_proj('robinson', 'Lon', [0, 360]);
hold on;
m_pcolor(lonGrd - (lonIntv(1) / 2), latGrd - (latIntv(1) / 2), wind_m);
% m_pcolor(lonGrid, latGrid, wind_m);
m_coast('patch', [.7 .7 .7], 'edgecolor', 'none');

m_grid('tickdir', 'out', 'linewi', 2);
colormap(m_colmap('jet', 'step', 10));
h = colorbar('westoutside');
title(h, 'wind speed (m/s)', 'fontsize', 10);
set(h, 'tickdir', 'out');

%%
lon_aoi = [128, 132];
lat_aoi = [36.5, 38];

x2 = lon_aoi(1) < Lon & Lon < lon_aoi(2);
x2 = x2';
y2 = lat_aoi(1) < Lat & Lat < lat_aoi(2);

res = [datetime(2016, 01, 15), mean(reshape(wind_m(x2, y2), [], 1), 'omitnan')];
