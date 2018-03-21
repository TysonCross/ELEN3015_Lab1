% ELEN3015
% Tyson Cross
% 1239448

% Formatting and clearing
clear all;
clc;

% Read in textfile, stripped all non alphabetical chars, UPPERCASE
text = strip(readfile('sample_text_20_chars.txt'),1)
column_width = 5;

% Check results
if ~mod(length(text),column_width)==0
    disp(['The input text of ', num2str(length(text)),...
        ' chars is not recoverable with multiple columnar encipherments using ',...
        num2str(column_width), ' columns'])
    return
end

column = encolumn(text, column_width);
count = 1;
while ~strcmp(column , text)
    column = encolumn(column, column_width);
    count = count + 1;
end


% Display results
disp(['It requires ', num2str(count), ' applications of columnar transposition with ',...
    num2str(column_width), ' columns to recover a text of ', num2str(length(text)),' chars.'])
