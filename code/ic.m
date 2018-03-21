function ic = ic( text )
% IC Index of coincidence calculation for input [text]
% Index of coincidence is a measure of how much variance there is in the frequency distribution for a sample text

% Ensure that text is always lower case for count() function
text = lower(strip(text));
% Get each characters incidences and the length of the text (no. of chars)
N = length(text);
x = count(text);

%% Method using UPPERCASE chars...
% y2 = double(text)-64;
% 
% for K=1:26
% 	x(K,1) = 0;
% end
%
% J=0;
% for K=1:N
%    if (y2(K)>0)
%      J = J + 1;
%      if (y2(K)<27)
%         x(y2(K)) = x(y2(K)) + 1; 
%      end
%    end
% end

% Apply the formula from the lecture notes for IC
 IC_array = x.*(x-1);
 denom = N.*(N-1);
 ic = sum(IC_array)/ denom;
end


