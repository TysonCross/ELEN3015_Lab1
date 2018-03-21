% ELEN3015
% Tyson Cross
% 1239448

% Formatting and clearing
clear all;
clc;
% Read in textfile, stripped all non alphabetical chars, UPPERCASE
message = strip(readfile('sample_text.txt'),1);
% Encrypt plaintext using these default (Caesar Cipher) keys
encrypt_translation_table = 'DEFGHIJKLMNOPQRSTUVWXYZABC';
translation_table = 'XYZABCDEFGHIJKLMNOPQRSTUVW';
encrypted_text = enmono(message);                   % use default key (as above)
decrypted_text = demono(encrypted_text);            % decrypt key with default (reverse key as above)
% Attempt to break the cipher with the default frequency distributions
[recovered_text,recovered_table] = freqmatch(encrypted_text);

% Check results
correct = 0;
for K=1:length(message)
    if strcmp(message(K),recovered_text(K))
        correct = correct + 1;
    end
end

% Output information based on results
if strcmp(decrypted_text , message) 
    disp('The decrypted message matches the original message')
else disp('The decrypted message does NOT match the original message!')
end

if strcmp(recovered_text , message) 
    disp('The recovered message matches the original message')
else disp('The recovered message does NOT match the original message!')
    disp(['The recovered message is ', num2str(round(correct/length(message) * 100,2)), '% correct'])
end

% Display results
disp(['Original Table  = ', translation_table])
disp(['Recovered Table = ', recovered_table])
disp(['Index of coincidence = ', num2str(ic(message))])


