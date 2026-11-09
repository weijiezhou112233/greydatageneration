function y = nipago(x, lambda)
%NIPAGO New-information-priority accumulated generating operation.
%   y(1)=x(1); y(k)=lambda*y(k-1)+x(k).
%   lambda=1 reduces to conventional 1-AGO.
x = gdag.validateInput(x, 'x');
if ~isscalar(lambda) || ~isreal(lambda) || ~isfinite(lambda) || lambda <= 0 || lambda > 1
    error('gdag:InvalidLambda', 'lambda must be a finite scalar in (0,1].');
end
y = zeros(size(x));
y(1) = x(1);
for k = 2:numel(x)
    y(k) = lambda * y(k-1) + x(k);
end
end
