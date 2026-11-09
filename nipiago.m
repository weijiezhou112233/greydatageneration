function x = nipiago(y, lambda)
%NIPIAGO Inverse new-information-priority accumulation.
%   x(1)=y(1); x(k)=y(k)-lambda*y(k-1).
y = gdag.validateInput(y, 'y');
if ~isscalar(lambda) || ~isreal(lambda) || ~isfinite(lambda) || lambda <= 0 || lambda > 1
    error('gdag:InvalidLambda', 'lambda must be a finite scalar in (0,1].');
end
x = zeros(size(y));
x(1) = y(1);
for k = 2:numel(y)
    x(k) = y(k) - lambda * y(k-1);
end
% Small negative values may arise from roundoff; do not silently clip values.
end
