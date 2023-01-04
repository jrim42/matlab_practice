function [N12, N34, N56] = Convert_sixchar2threenum_221228(d_sixchar)


%% input 확인
if iscell(d_sixchar) || isstring(d_sixchar)
    dc_sixchar = char( d_sixchar );
elseif ischar(d_sixchar)
    dc_sixchar = d_sixchar ;
else
    error('input 확인')
end

% 결과 출력: 
% 1. string function -->  char type을 string type으로 바꿈
% 2. str2double --> 문자로 되어 있는 숫자를 그냥 숫자로 바꿈
N12 = str2double( string(dc_sixchar(:, 1:2)));
N34 = str2double( string(dc_sixchar(:, 3:4)));
N56 = str2double( string(dc_sixchar(:, 5:6)));
