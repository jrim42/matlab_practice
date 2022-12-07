% ----------------------- 221205 -------------------------

close all;
clear;
clc;

x = NaN(2,2);
y = rand(2,2);

a = 3;
bool = (a ~= 4);

ch = 'a';
str = "Hello World";

% scalar is only for one variable, not array or string
% column vector
% row vector
% matrix
row1 = 1:5;
row2 = 1:2:9;
row3 = [row1 row2]; % concatenation
scl = row1(3);      % index로 접근. str은 불가능한 듯?
col = [1; 2; 3; 4];

% linespace, logspace

% indexing
    % subscript indexing
    % linear indexing
    % logical indexing  (cf. find 함수)

% dimensions
    % length, size, numel
    % dimension conversion
% empty vector

% calculation on matrix
    % use of .^ for self-square
