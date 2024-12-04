function [output_vector] = DiffHash(grey_im)
%DiffHash makes an m-by-(n + 1) greyscale image into a
% hash containing mn bits following the Differential Hashing algorithm.
%   Inputs:
% grey_im : An m-by-(n + 1) uint8 array that is a greyscale image.
%   Outputs:
% output_vector : A 1-by-mn logical row vector
% which is the differential hash of the greyscale image.
% Author: Jeruh Kim

% Initializing
grey_im = double(grey_im);
m = size(grey_im, 1);
n = size(grey_im, 2) - 1;
output_vector = zeros([m n]); %pre-allocating the output

% checking n > 0
if n < 1
    error('The input has not enough width to undergo this algorithm')
end

% Following the differential hashing algorithm 
for i = 1:m
    for j = 1:n
        if grey_im(i,j) >= grey_im(i, (j + 1)) 
            output_vector(i,j) = 1;
        elseif grey_im(i,j) < grey_im(i, (j + 1))
            output_vector(i,j) = 0;
        end
    end
end
% Turning the output array values into a logical array
output_vector = logical(output_vector);

% Making the output array into a row vector
output_vector = reshape(output_vector.' ,1,[]);

end