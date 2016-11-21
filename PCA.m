function [dimensionReducedData,k,projectionMatrix]=PCA(historicalData,percentVariance)
% Description: Use SVD to compute principal component analysis of the
% historical market data previously collected for data reduction.  The
% output of this function is input into a machine learning classifier of
% some type. Variable reduction is good for the classifier but PCA retains
% the information of all the variables.
% Input: 
%   historicalData
%   percentVariance, units are decimals, i.e. 95% = 0.95
% Output:
%   dimensionReducedData, dimension will be k by 1000
%   k, the number or principal components used
%   projectionMatrix, matrix with k dimension for use in reducing
%   historical data dimension

%   Use SVD on historicalData
[U, D, V] = svd(cov(historicalData))
% Columns of U are the eigenvectors
% Original data is D*D' XXXXX is this right? XXXXX
% Eigenvalues are diagonal entries of D XXXXX is this right? XXXX

% How many components do we want to retain? Compute ratio or entries of D
% to the sum of the diagonal entries of D
sumOfDiagonalEntries=0
for i=1:size(D,2)
    sumOfDiagonalEntries=sumOfDiagonalEntries+D(i,i)
end
k=0
ratio=0
for i=1:size(D,2)
    ratio=ratio+D(i,i)/sumOfDiagonalEntries
    if ratio<=percentVariance
        if k<size(D,2)
            k=k+1
        end
    end
end
k=k+1

% Retain only k eigenvectors accouting for at least percentVariance
% explained
newU=U(:,1:k)


% Output the projection matrix
projectionMatrix=newU

% Compute principal components, that is, dimension reduction
dimensionReducedData=historicalData*projectionMatrix

end
    

