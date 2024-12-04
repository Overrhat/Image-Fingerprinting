function [output_array] = AvgHash(input_array)
%AvgHash undergoes the Average Hashing algorithm to make
% an m-by-n greyscale image array into a hash containing mn bits array. 
%   Inputs:
% input_array : An m-by-n uint8 array that is a greyscale image.
%   Outputs:
% output_array : A 1-by-mn logical row vector which is the
% average hash of the greyscale image.
% Author: Jeruh Kim

% Initializing 
input_array = double(input_array);
output_array = zeros(size(input_array)); % Preallocate output array

% Making sure the input is a greyscale image
if size(input_array, 3) ~= 1
    error('Input image must be a greyscale image.');
end

% Finding the average value avg of the pixels in the image array
avg = round(mean(input_array, "all"), 0);

% Following the average hashing algorithm to find the output_array
for i = 1:size(input_array, 1)
    for j = 1:size(input_array, 2)
        % checking the pixel in (i,j) is equal or greater than avg
        if input_array(i,j) >= avg
            output_array(i,j) = 1;
        else
            output_array(i,j) = 0;
        end
    end
end
% Turning the output array values into a logical array
output_array = logical(output_array);

% Making the output array into a row vector
output_array = reshape(output_array.' ,1,[]);

end