function x = dpiago(y, q)
%DPIAGO Inverse of the local rolling-window accumulation DPAGO.
%   For k<=q: x(k)=y(k)-y(k-1), with y(0)=0.
%   For k>q:  x(k)=y(k)-y(k-1)+x(k-q).
y = gdag.validateInput(y, 'y');
n = numel(y);
if ~isscalar(q) || ~isreal(q) || ~isfinite(q) || q ~= floor(q) || q < 1 || q > n
    error('gdag:InvalidWindow', 'q must be an integer in [1,numel(y)].');
end
x = zeros(n,1);
for k = 1:n
    prev = 0;
    if k > 1
        prev = y(k-1);
    end
    x(k) = y(k) - prev;
    if k > q
        x(k) = x(k) + x(k-q);
    end
end
end
