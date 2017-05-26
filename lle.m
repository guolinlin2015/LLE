function Y = lle(X,k,d)
% Performs local linear embedding on X using k neighbors
% Returns embedding Y in d dimensions
% Columns of X correspond to data points
% Rows of Y give embedding of each point

[W,nbd] = LLE_weights(X,k);

Y = LLE_embed(W,nbd,d);
