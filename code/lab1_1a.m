% ELEN3015
% Tyson Cross
% 1239448

% Formatting and clearing
clear;
clc;
format short;
format loose;

% Read in textfile, stripped all non alphabetical chars, UPPERCASE
text_strip = strip(readfile('sample_text.txt'),1);
% Get the the letter frequency distributions of the text
frequency = freqget(text_strip);
letter=['a':'z'];
% Sort the frequencies in descending letter rank
[sorted_frequency, sortIndex] = sort(frequency,'descend');
sorted_letter = letter(sortIndex);
% Display a table of the results
T = table(sorted_letter', sorted_frequency');
T.Properties.VariableNames ={'Letter','Frequency'};
disp(T)
