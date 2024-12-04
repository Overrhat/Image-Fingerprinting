function [] = RankSimilarity(fingerprint, filenames, collection, n)
%RankSimilarity function displays n image files ranked by
% descending similarity (i.e., the image most similar to the
% search image will be at the top of the list).
%   Inputs:
% fingerprint : A 1-by-64 logical row vector
% which is the image fingerprint to search on. 
%
% filenames : An m-by-1 string array that is a list of image file names.
%
% collection : An m-by-1 cell array that
% contains a collection of image fingerprints.
%
% n : An integer n showing how many image fingerprint matches to display.
%
%   Outputs: None.
%
% Author: Jeruh Kim

% Checking the integer n is within the value range
if n < 1 || n >= 100 || n > length(filenames)
    error('The input integer n is not within the range');
end    

% Storing image information (rank, Hamming distance, filename)
image = zeros([length(collection) 3]);
image(:, 1) = 1:length(collection); % Initializing the ranks

% Getting the hamming distances between the input fingerprint and 
%the fingerprints in the collection by using HammingDistance function
ham_dis = zeros(length(collection), 1);
for i = 1:length(collection)
    ham_dis(i) = HammingDistance(fingerprint, collection{i});
end

% Sortout rows of the images by hamming distance
[~, indices] = sortrows([ham_dis image], [1 2]);

% Process of for loop for the output
for j = 1:n
    index = indices(j);
    rank = j;
    ham = ham_dis(index);
    filename = filenames{index};
        
    % Using sprintf to store rank and ham as string vector
    Rank_str = sprintf('%*d.', ceil(log10(n)), rank);
    Ham_str = sprintf('%2d', ham);
        
    % Displaying the output by using fprintf
    fprintf('%s %s - %s\n', Rank_str, Ham_str, filename);
end

end