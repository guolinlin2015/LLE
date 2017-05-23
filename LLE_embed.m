function Y = LLE_embed(W,nbd,d)
% Takes matrix W with columns as weights and solves eigenvector problem to
% find imbedding into d dimensions 

% d = desired embedding dimension
% W = matrix of LLE weights (including zeros)
% Y = matrix of embedding coordinates (n x d)
nbd
[k,n] = size(W);

M = sparse(1:n,1:n,ones(1,n),n,n,4*k*n);
% M = eye(n);

% Compute (I-W)'(I-W)
for i=1:n
   w = W(:,i) % Weights are columns
   j = nbd(i,:) % Neighbor indices are rows
   M(i,j) = M(i,j) - w';
   M(j,i) = M(j,i) - w;
   M(j,j) = M(j,j) + w*w';
end

opts.isreal = 1;
opts.issym = 1;
[Y,evals] = eigs(M,d+1,'SM',opts);
evals
Y = Y(:,2:d+1).*sqrt(n);
