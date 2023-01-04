clear;clc;close all


%% Importing data
FileID = fopen('HOT-DOGS_ text output.txt');
%==========botid, date, time, press, temp, csal, coxy, bsal, boxy, dic, ph, alk, phos, nit, sil, no2
%=raw-data==  1     ,  2    ,  3    ,   4     , 5      , 6    , 7     ,   8   ,   9   ,  10, 11, 12,  13   , 14  15, 16
%= format === %n    %s   %s    , %n  x 13

C_var = textscan(FileID, repmat(' %s ', [1 16]), 1,...
    'HeaderLines', 3, 'Delimiter', ',', 'ReturnOnError', false);
C_unit = textscan(FileID, repmat(' %s ', [1 16]), 1,...
    'Delimiter', ',', 'ReturnOnError', false);
C_data = textscan(FileID, [' %n %s %s',    repmat( ' %n ', [1, 13]) ],...
    'Delimiter', ',', 'ReturnOnError', false);
fclose(FileID); clear FileID ans


%% Reorganizing data

for n = 1:length(C_data)
    Exprs = ['d_', C_var{n}{1} ' = C_data{', num2str(n), '};' ] ;
    %disp(Exprs)
    eval( Exprs)
    clear Exprs
end
clear n

% date값이 -00009인 것들이 있네. 해당 자료 지우는 작업.
I_nodateinfo = strcmp(d_date, '-00009'); %#ok<NASGU>
for k = 1:length(C_data)
    Exprs_k = ['d_', C_var{k}{1} ' = d_', C_var{k}{1}, '(~I_nodateinfo);'];
    eval(Exprs_k)
    clear Exprs_k
end
clear k I_nodateinfo

% 6자리 문자로 된 숫자를 2개씩 끊어서 숫자로 출력함. -00009도 0, 0, 9로 출력되긴 함.
[d_mon, d_day, d_yr] = Convert_sixchar2threenum_221228(d_date);
[d_hour, d_min, d_sec] = Convert_sixchar2threenum_221228(d_time);

aa = d_yr<80;
d_yr(aa) = d_yr(aa) + 2000;
d_yr(~aa) = d_yr(~aa) +1900;
clear aa


%% displaying data

NumV = 13;
List_varnum = (1:NumV) +3;

for v = 1:NumV

    % Assigning data (used to plot; this changes with 'v') to 'd_vm' variable
    varname = C_var{List_varnum(v)}{1};
    d_vm = eval(  [ 'd_',  varname, ';' ] );

    % Pop up figure window every 'v' 
    figure('Color', 'w', 'Position', [20, 20, 1000, 500])

    % plot d_vm for 12 months
    for m = 1:12

        subplot(3,4,m)     
        % indexing
        I_mon = (d_mon == m);
        I_dep = (d_press < 10);
        I_validdata = d_vm >0;
        I_forplot = I_mon & I_dep & I_validdata;

        % calculation
        NumD = length( find(I_forplot));

        % plotting (each month)
        plot( d_yr(I_forplot), d_vm(I_forplot), 'ro-')
        xlabel('Year')
        ylabel([varname, ' (', C_unit{List_varnum(v)}{1}, ')'])
        title([datestr(datenum([2022,m,15]), 'mmm'), '(#:', num2str(NumD), ')'])

        clear I_* NumD
    end

    % saving figures as tiff format with 300 dpi resolution
    % close figure window after saving it
    print([varname, '.tif'], '-dtiff', '-r300')
    close all

    clear m d_vm varname
end
clear v NumV List_varnum





