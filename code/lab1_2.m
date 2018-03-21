% ELEN3015
% Tyson Cross
% 1239448

% Formatting and clearing
clear all;
clc;

% Read in textfile, stripped all non alphabetical chars, UPPERCASE
message = strip(readfile('sample_text.txt'),1);
% Generate alphabets and initialise arrays
key = 'a':'z';
number_of_keys = 7;
IC_table = zeros(0,number_of_keys);
difference = zeros(0,number_of_keys);
Given_IC_table = [0.068, 0.052, 0.047, 0.044, 0.044, 0.041, 0.038];

% For alphabets 1:5
for K = 1:5
    IC_table(K) = ic(enpoly(message,key(1:K)));
end
% For alphabet 10
IC_table(6) = ic(enpoly(message,key(1:10)));
% For full alphabet (26)
IC_table(7) = ic(enpoly(message,key(1:26)));
  
% Calculate difference in values
for K = 1:number_of_keys
    difference(K) = abs(IC_table(K) - Given_IC_table(K));
end

% Display results
alphabet_length = [1:5 10 26]; % Table column labels for the 7 different length keys
T = table (alphabet_length', IC_table', Given_IC_table', difference');
T.Properties.VariableNames ={'Alphabet_Size','Measured_IC','Given_IC','Difference'};
disp(T)