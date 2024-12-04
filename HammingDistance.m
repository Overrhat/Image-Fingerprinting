function [num_diff] = HammingDistance(fingerprint1, fingerprint2)
%HammingDistance Summary of this function goes here
%   Inputs:
% fingerprint1 : A 1-by-𝑛 logical row vector for fingerprint 1
% fingerprint2 : A 1-by-𝑛 logical row vector for fingerprint 2
%   Outputs:
% num_diff : A integer that is the number of differing bits
% between the two inputed fingerprints
% Author: Jeruh Kim

% Checking that the 2 inputs have the same length
if length(fingerprint1) ~= length(fingerprint2)
    error('The two fingerprints have different values');
end

% Initializing
num_diff = double(0);
fingerprint1 = double(fingerprint1);
fingerprint2 = double(fingerprint2);

% Getting the num_diff by using a for loop
for i = 1:length(fingerprint1)
    % adds 1 to num_diff as it finds difference between the input vectors
    if fingerprint1(i) ~= fingerprint2(i)
        num_diff = num_diff + 1;
    end    
end

end