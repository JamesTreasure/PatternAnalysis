function [y] = mycovariance(A)

one_vector(1:size(A,1)) = 1;
mu = (one_vector * A) / size(A,1);
A_mean_subtract = A - mu(one_vector, :);
y = (A_mean_subtract.' * A_mean_subtract) / (size(A,1) - 1);
end

