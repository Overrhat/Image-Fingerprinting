function [outputcell] = FingerprintCollection(imagename, hash, resize)
%FingerprintCollection stores all of the image fingerprints
% from a list of image filenames so they can be compared to each others.
%   Inputs:
% imagename : An m-by-1 string array which is a list of image file names.
% hash : A character vector contains 'AvgHash' or 'DiffHash'.
% resize : A character vector contains 'Nearest' or 'Box'.
%   Outputs:
% outputcell : An m-by-1 cell array containing all the fingerprints

% Author: Jeruh Kim

% Preallocating the outputcell
outputcell = cell(size(imagename));

% Calculations
for i = 1:size(imagename, 1)
    % Reading and storing image for each file
    image = imread(imagename(i));
    
    %Using ImageFingerprint function to find the fingerprint of the image
    outputcell{i} = ImageFingerprint(image, hash, resize);
end

end