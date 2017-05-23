function Y = LLE_embed(W,d)
% Takes matrix W with columns as weights and solves eigenvector problem to
% find imbedding into d dimensions 

% d = desired embedding dimension
% W = matrix of LLE weights (including zeros)
% Y = matrix of embedding coordinates (n x d)

n = size(W,1);
opts.isreal = 1;
opts.issym = 1;
[Y,evals] = eigs((eye(n)-W)'*(eye(n)-W),d+1,'SM',opts);
evals
Y = Y(:,2:d+1).*sqrt(n);
