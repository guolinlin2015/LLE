function [W,index] = LLE_weights(X,k)
% Finds weights for reconstructing data points from k neighbors

% X is a n x d data matrix, n points with dimension d
% k is number of neighbors
% W - ith column contains weights for reconstructing ith point from
% neighbors

[n,d] = size(X);

% Get index of k nearest neighbors for all points
index = knn(k,X);

% Set tolerance for conditioning
delta = 0.001^2;

W = eye(n);

for i = 1:n
% Calculate covariance matrix
C1 = repmat(X(i,:),k,1) - X(index(i,:),:);
C = C1*C1';

% Condition covariance matrix
C = C + (delta^2/k)*eye(k)*trace(C);

% Calculate weight vector
w = C\ones(k,1);

W(index(i,:),i) = w./sum(w); 

end