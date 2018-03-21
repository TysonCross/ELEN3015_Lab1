% ELEN3015
% Tyson Cross
% 1239448

clear all;
clc;
format short;
text_strip = strip(readfile('sample_text.txt'),1);
IC = ic(text_strip)
