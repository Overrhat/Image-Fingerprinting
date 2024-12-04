function [output_array] = ResizeNearest(input_array, array_size)
%RESIZENEAREST function makes the inputed uint8 array into specified
%dimensions by using a Nearest Neighbour Interpolation algorithm
%   Inputs:
%  input_array : An m-by-n-by-p uint8 array that is  
% a greyscale image or a RGB colour image. grescale(p = 1), RGB(p = 3).
%  array_size : A 1-by-2 double array containing two values (i, j)
% which is the dimensions wanted to resize the image to.
%   Outputs:
%   output_array : An i-by-j-by-p uint8 array that is the
% resized greyscale or RGB colour image.
% Author: Jeruh Kim

% Initalizing 
input_array = double(input_array); % making uint8 into double
output_array = zeros(array_size); % pre-allocation of the output
i_size = array_size(1);
j_size = array_size(2);

% row and column size ratios (R_row and R_col)
R_row = height(input_array) / i_size;
R_col = width(input_array) / j_size;

for i = 1:i_size
    for j = 1:j_size
        %calculate the relative position (i_o, j_o) of our resized pixel (i,j)
        i_o = min(ceil((i - 0.5) * R_row), height(input_array));
        j_o = min(ceil((j - 0.5) * R_col), width(input_array));

        %if the input image is in greyscale
        if size(input_array, 3) == 1
            %Assign values to output_array
            output_array(i, j) = input_array(i_o, j_o);
        end

        %if the input image is an RGB image
        if size(input_array, 3) == 3
            r = input_array(i_o, j_o, 1);
            g = input_array(i_o, j_o, 2);
            b = input_array(i_o, j_o, 3);

            output_array(i, j, 1) = r;
            output_array(i, j, 2) = g;
            output_array(i, j, 3) = b;

        end    

    end    
end
% making the output array back to uint8 
output_array = uint8(output_array);

end