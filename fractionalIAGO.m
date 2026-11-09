function x = fractionalIAGO(y, r)
%FRACTIONALIAGO Inverse of the fractional-order AGO.
%   Uses the convolution coefficients of order -r.
y = gdag.validateInput(y, 'y');
if ~isscalar(r) || ~isreal(r) || ~isfinite(r) || r <= 0
    error('gdag:InvalidOrder', 'r must be a finite positive scalar.');
end
n = numel(y);
w = zeros(n,1);
w(1) = 1;
a = -r;
for j = 1:n-1
    w(j+1) = w(j) * (a + j - 1) / j;
end
x = zeros(n,1);
for k = 1:n
    j = 0:k-1;
    x(k) = sum(w(j+1) .* flipud(y(1:k)));
end
end
