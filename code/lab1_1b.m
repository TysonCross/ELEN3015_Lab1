% ELEN3015
% Tyson Cross
% 1239448

% Formatting and clearing
clear;
clc;
% Read in textfile, stripped all non alphabetical chars, UPPERCASE
text = strip(readfile('sample_text.txt'),1);
% Get the the letter frequency distributions of the text
letter_freq = freqget(text)';
% Canonical values from 'freqmatch' as the English Language distribution
expected_freq = [ 0.0749    0.0129    0.0354    0.0362    0.1400    0.0218    0.0174 ... %  abcdefg
                  0.0422    0.0665    0.0027    0.0047    0.0357    0.0339    0.0674 ... %  hijklmn
                  0.0737    0.0243    0.0026    0.0614    0.0695    0.0985    0.0300 ... %  opqrstu
                  0.0116    0.0169    0.0028    0.0164    0.0004 ]';                     %  vwxyz
% Make a table of the results (alphabetical)
alphabet=['a':'z']';
T = table(alphabet,letter_freq,expected_freq);
T.Properties.VariableNames ={'Letter','Frequency','Expected_Frequency'};
disp(T)

% Sort the results for ordered graph
[sorted_expected_freq, sortIndex] = sort(expected_freq,'descend');
sorted_alphabet = alphabet(sortIndex);
sorted_letter_freq = letter_freq(sortIndex);

%% Display setting and output setup
scr = get(groot,'ScreenSize');                              % screen resolution
ratio = (3/5);
fig1 =  figure('Position',...                               % draw figure
    [1 512 640 880]);
pos = get(fig1,'Position')
set(fig1,'numbertitle','off',...                            % Give figure useful title
    'name','ELEN3015 Lab1: Classical Cryptography',...
    'Color','white');
% set(fig1, 'MenuBar', 'none');                             % Make figure clean
% set(fig1, 'ToolBar', 'none');                             
% c = listfonts
fontName='CMU Serif';
set(0,'defaultAxesFontName', fontName);                     % Make fonts pretty
set(0,'defaultTextFontName', fontName);
set(groot,'FixedWidthFontName', 'ElroNet Monospace')      

%% Plot
% Top
ax1 = subplot(2,1,1);
set(ax1, 'Position', [0.1 0.55 0.85 0.4]); 
p1_1 = plot(letter_freq,...                           
        'Color',[0.18 0.18 0.9 .6],...                 
        'LineStyle','-',...
        'LineWidth',2);
hold on
p1_2 = plot(expected_freq,...                           
        'Color',[0.9 0.18 0.18 .6],...                 
        'LineStyle','-',...
        'LineWidth',2);
hold on
% Top title
title('Alphabetical Frequency',...
    'FontSize',14,...
    'FontName',fontName);
% Top axes and labels
ylabel('Frequency \rightarrow',...
    'FontName',fontName,...
    'FontSize',14,...
    'Position', [-0.8 .08]);
set(ax1,'xtick',[1:26],...
    'xticklabel',alphabet,...
    'FontSize',14)
axis(ax1,[1 26 0 max(letter_freq*1.2)]);
% Top legend
legend1 = legend({'Sample Text','English Language'});
 set(legend1,...
     'Position',[0.7    0.88    0.1125    0.0403],...
     'Box','off');

% Bottom
ax2 = subplot(2,1,2);
set(ax2, 'Position', [0.1 0.05 0.85 0.4]); 
p2_1 = plot(sorted_letter_freq,...                           
        'Color',[0.18 0.18 0.9 .6],...                 
        'LineStyle','-',...
        'LineWidth',2);
hold on
p2_2 = plot(sorted_expected_freq,...                           
        'Color',[0.9 0.18 0.18 .6],...                 
        'LineStyle','-',...
        'LineWidth',2);
hold on
% Bottom title
title('Descending Letter Frequency',...
    'FontSize',20,...
    'FontName',fontName);
% Bottom axes and labels
ylabel('Frequency \rightarrow',...
    'FontName',fontName,...
    'FontSize',14,...
    'Position', [-0.8 .08]);
set(ax2,'xtick',[1:26],...
    'xticklabel',sorted_alphabet,...
    'FontSize',14)
axis(ax2,[1 26 0 max(letter_freq*1.2)]);
% Bottom legend
legend2 = legend({'Sample Text','English Language'});
 set(legend2,...
     'Position',[0.7    0.38    0.1125    0.0403],...
     'Box','off');
hold off
% export (fix for missing CMU fonts in eps export)
% export_fig Report/letter_frequency.eps

