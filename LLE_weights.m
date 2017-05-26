function [W,index] = LLE_weights(X,k)
% Finds weights for reconstructing data points from k neighbors

% X is a d x n data matrix, n points with dimension d
% k is number of neighbors
% W - ith column contains weights for reconstructing ith point from
% neighbors

[d,n] = size(X);

% Get index of k nearest neighbors for all points
index = knn(k,X);

% Set tolerance for conditioning
delta = 0.001;

W = zeros(k,n);

for i = 1:n
% Calculate covariance matrix
C1 = X(:,index(:,i)) - repmat(X(:,i),1,k);
C = C1'*C1;

% Condition covariance matrix
C = C + (delta)*eye(k)*trace(C);

% Calculate weight vector
w = C\ones(k,1);
W(:,i) = w./sum(w); 

end
