function y = fractionalAGO(x, r)
%FRACTIONALAGO Fractional-order accumulated generating operation.
%   y(k)=sum_{i=1}^k w(k-i+1)*x(i),
%   w(1)=1; w(j+1)=w(j)*(r+j-1)/j.
%   r=1 gives conventional 1-AGO.
x = gdag.validateInput(x, 'x');
if ~isscalar(r) || ~isreal(r) || ~isfinite(r) || r <= 0
    error('gdag:InvalidOrder', 'r must be a finite positive scalar.');
end
n = numel(x);
w = localWeights(r, n);
y = zeros(n,1);
for k = 1:n
    j = 0:k-1;
    y(k) = sum(w(j+1) .* flipud(x(1:k)));
end
end

function w = localWeights(r, n)
w = zeros(n,1);
w(1) = 1;
for j = 1:n-1
    w(j+1) = w(j) * (r + j - 1) / j;
end
end
