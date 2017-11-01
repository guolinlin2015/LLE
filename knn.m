function index = knn(k,X)
% Finds k nearest neighbors of all points in X

% k = desired number of neighbors
% X = d x n matrix of data points - dimension d, n points
% index = k x n matrix of indices for neighbors
[~,n] = size(X);

% Calculate pairwise distances for points in X
X2 = sum(X.^2,1); % row vector
dist = repmat(X2,n,1) + repmat(X2',1,n) - 2*(X'*X);

% Sort
[~,index] = sort(dist,1,'ascend');

% Check for case where k > n, return index of k points for each
if k >= n
index = index(2:end,:);
else
    index = index(2:(k+1),:);
end

return
