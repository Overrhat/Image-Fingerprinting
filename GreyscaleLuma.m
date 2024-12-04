function [greyscale_image] = GreyscaleLuma(small_image)
% GREYSCALELUMA makes the input RGB colour image into
% a greyscale version of image by calculating a weighted sum for each pixel.
%   Inputs:
%   small_image: An m-by-n-by-3 uint8 array that is an RGB colour image.
%   Outputs:
%   greyscale_image: An m-by-n-by-1 uint8 array that is a greyscale image.
% Author : Jeruh Kim

% Initialising 
[nrow, ncol, ~] = size(small_image);
small_double = double(small_image);
greyscale_image = zeros([nrow ncol]);

% Making sure the input is RGB colour image
if size(small_image, 3) ~= 3
    error('Input image must be an RGB image.');
end

% Calculating the grescale_image values
for i = 1:nrow
    for j = 1:ncol
        r = small_double(i,j,1); %red at pixel position
        g = small_double(i,j,2); %green at pixel position
        b = small_double(i,j,3); %blue at pixel position

        %greyscale_image at pixel position i,j and rounded value to the nearest integer.
        greyscale_image(i,j) = round(0.2126*r + 0.7152*g + 0.0722*b);
    end
end    

% Making the output as uint8
greyscale_image = uint8(greyscale_image);

end