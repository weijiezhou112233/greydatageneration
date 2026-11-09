function y = dpago(x, q)
%DPAGO Dynamic/local accumulated generating operation with window q.
%   y(k)=sum(x(max(1,k-q+1):k)).
%   q is a positive integer not greater than the sequence length.
x = gdag.validateInput(x, 'x');
n = numel(x);
if ~isscalar(q) || ~isreal(q) || ~isfinite(q) || q ~= floor(q) || q < 1 || q > n
    error('gdag:InvalidWindow', 'q must be an integer in [1,numel(x)].');
end
y = zeros(n,1);
for k = 1:n
    first = max(1, k-q+1);
    y(k) = sum(x(first:k));
end
end
