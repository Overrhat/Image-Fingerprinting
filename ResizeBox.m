function [output_array] = ResizeBox(input_array, array_size)
%ResizeBox function undergoes the Box Sampling algorithm to
% change the dimensions of an image to the specified dimensions.
%   Inputs:
%  input_array : An m-by-n-by-p uint8 array that is  
% a greyscale image or a RGB colour image. grescale(p = 1), RGB(p = 3).
%  array_size : A 1-by-2 double array containing two values (i, j)
% which is the dimensions wanted to resize the image to.
%   Outputs:
%   output_array : An i-by-j-by-p uint8 array that is the
% resized greyscale or RGB colour image.
% Author: Jeruh Kim

%% Initializing 
% Making uint8 into double for the input_array before calculations
input_array = double(input_array); 

% Get input dimensions
[m, n, p] = size(input_array);

% Get the 2D size of the output array
i_size = array_size(1);
j_size = array_size(2);

% Get the size of each box
box_height = m / i_size; 
box_width = n / j_size;

% Initialize the output_array
output_array = zeros(i_size, j_size, p, 'uint8');

%% Actual calculations
for i = 1:i_size
    for j = 1:j_size
        % Define the boundaries of the current box by getting each sides
        box_top = round((i - 1) * box_height + 1, TieBreaker="tozero");
        box_bottom = round(i * box_height);
        box_left = round((j - 1) * box_width + 1, TieBreaker="tozero");
        box_right = round(j * box_width);
            
        % Initialize sums for RGBs in the pixel and the pixel count in box
        r_sum = 0;
        g_sum = 0;
        b_sum = 0;
        pixel_count = 0;

        % Iterate through pixels in the box
        for y = box_top:box_bottom
            for x = box_left:box_right
                if y <= m && x <= n
                    % Include the pixel in the sum
                    pixel_count = pixel_count + 1;
                    if p == 1
                        % For grayscale images
                        r_sum = r_sum + input_array(y, x);
                    else
                        % For RGB images
                        r_sum = r_sum + input_array(y, x, 1);
                        g_sum = g_sum + input_array(y, x, 2);
                        b_sum = b_sum + input_array(y, x, 3);
                    end
                end
            end
        end
        
        % Calculate the average pixel values
        if pixel_count > 0
            if p == 1
                % For grayscale images
                output_array(i, j) = round(r_sum / pixel_count);
            else
                % For RGB images
                output_array(i, j, 1) = round(r_sum / pixel_count);
                output_array(i, j, 2) = round(g_sum / pixel_count);
                output_array(i, j, 3) = round(b_sum / pixel_count);
            end
        end
    end
end

% Converting the final output into uint8 array
output_array = uint8(output_array);
end