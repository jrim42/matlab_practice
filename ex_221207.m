clc;
clear;
close all;

a = randi([1, 50], 3, 3);

% for is not recommanded in matlab. 
% it makes your program SLOW.
for idx = 1:9
    if mod(a(idx), 2) == 0 
       disp([num2str(a(idx)), ' is even']);
    else
       disp([num2str(a(idx)), ' is odd']);
    end
end