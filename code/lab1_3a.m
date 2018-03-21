% ELEN3015
% Tyson Cross
% 1239448

% Formatting and clearing
clear all;
clc;

% Read in textfile, stripped all non alphabetical chars, UPPERCASE
text = strip(readfile('sample_text_22_chars.txt'),1);
column = encolumn(text,7);
recovered_text = decolumn(column,7);

IC_plaintext = ic(text);
IC_column = ic(column);
IC_decolumn = ic(recovered_text);

% Check results
correct = 0;
for K=1:length(text)
    if strcmp(text(K),recovered_text(K))
        correct = correct + 1;
    end
end

% Output information based on results
if ~strcmp(recovered_text , text) 
    disp('The decolumned text does NOT match the original text!')
else
    disp('The decolumned text matches the original text')
end

if ~isequal(length(text),length(recovered_text))
    disp('The texts have different lengths')
    
end

disp(' ')   
disp(['Original:   ', text])
disp(['Encolumned: ', column])
disp(['Decolumned: ', recovered_text])
disp(' ')

% Display results
entries = ['Original  '; 'Encolumned'; 'Decolumned'];
lengths = [length(text), length(column), length(recovered_text)];
ICs = [IC_plaintext, IC_column, IC_decolumn];
T = table (entries, lengths', ICs');
T.Properties.VariableNames = {'Text','Length','IC'};
disp(T)
