function y = ago(x)
%AGO First-order accumulated generating operation (1-AGO).
%   y(k) = sum(x(1:k)).
x = gdag.validateInput(x, 'x');
y = cumsum(x);
end
