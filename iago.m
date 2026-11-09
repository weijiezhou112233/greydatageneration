function x = iago(y)
% IAGO Inverse first-order accumulated generating operation (1-IAGO).
%   x(1)=y(1); x(k)=y(k)-y(k-1).
y = gdag.validateInput(y, 'y');
x = [y(1); diff(y)];
end
