function [] = DispFP(fingerprint)
%DispFP makes the image fingerprint which is a logical row vector into
% a pretty format on one line by putting a space character every 8 bits.
%   Inputs:
% fingerprint : A 1-by-n logical row vector which is the image fingerprint.
%   Outputs:
% None.
% Author: Jeruh Kim

% Checking the input is a logical row vector
if ~isrow(fingerprint)
    error('The input is not a row vector');
elseif ~islogical(fingerprint)
    error('The input is not a logical vector');
end

% Initializing 
fingerprint = double(fingerprint);
output = '';

% Getting the total number tot_num in the input array
tot_num = length(fingerprint);

% Getting the number of groups of 8bits
group = ceil(tot_num / 8);

% Getting the each numbers in each group by using a for loop
for i = 1:group
    a = (i - 1) * 8 + 1; %a is the first number in the group
    b = min(i * 8, tot_num); %b is the last number in the group
    numbers = fingerprint(a:b);

    % Assigning the values into the eachgroup
    new_group = num2str(numbers, '%d');

    % Concatenate the formatted group to the existing output
    output = [output, new_group, ' '];
end

% Removing any whitesapce before or after to our porsion
output = strtrim(output);

% Displaying the output
fprintf('%s', output);

% Adding a new line at the end
fprintf('\n');

end