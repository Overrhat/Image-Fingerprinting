function [fingerprint] = ImageFingerprint(input_image, hash, resize)
%ImageFingerprint makes a 64-bit image fingerprint using the
% inputed hashing and resizing algorithm for a given colour image.
%   Inputs:
% input_image : An m-by-n-by-3 uint8 array that is a colour image.
% hash : A character vector contains 'AvgHash' or 'DiffHash'.
% resize : A character vector contains 'Nearest' or 'Box'.
%   Outputs:
% fingerprint : A 1-by-64 logical row vector which is the image fingerprint
% Author: Jeruh Kim

% Checking the hash and resize are containing the vectors that the code
%can handle with. 
if (~strcmp(hash, 'AvgHash') && ~strcmp(hash, 'DiffHash')) || (~strcmp(resize, 'Nearest') && ~strcmp(resize, 'Box'))
    error('The inputed character vector(s) is/are not usable');
end    

% Turning input_image into greyscale image by using GreyscaleLuma function
input_image = GreyscaleLuma(input_image);

%% Creating image fingerprint
% When the inputed hashing method is AvgHash
if strcmp(hash, 'AvgHash')
    % When the inputed resizing is Nearest
    if strcmp(resize, 'Nearest')
        input_image = ResizeNearest(input_image, [8 8]);
        fingerprint = AvgHash(input_image);
    % When the inputed resizing is Box
    elseif strcmp(resize, 'Box')
        input_image = ResizeBox(input_image, [8 8]);
        fingerprint = AvgHash(input_image);
    end    
% When the inputed hashing method is DiffHash
elseif strcmp(hash, 'DiffHash')
    % When the inputed resizing is Nearest
    if strcmp(resize, 'Nearest')
        input_image = ResizeNearest(input_image, [8 9]);
        fingerprint = DiffHash(input_image);
    % When the inputed resizing is Box
    elseif strcmp(resize, 'Box')
        input_image = ResizeBox(input_image, [8 9]);
        fingerprint = DiffHash(input_image);
    end    
end    

end