function x = validateInput(x, name)
%VALIDATEINPUT Validate and convert a numeric sequence to a column vector.
if nargin < 2
    name = 'x';
end
if ~isnumeric(x) || ~isreal(x) || ~isvector(x) || isempty(x)
    error('gdag:InvalidInput', '%s must be a nonempty real numeric vector.', name);
end
x = double(x(:));
if any(~isfinite(x))
    error('gdag:NonFiniteInput', '%s must contain only finite values.', name);
end
if any(x < 0)
    error('gdag:NegativeInput', ...
        '%s must be nonnegative under the definitions used in this package.', name);
end
end
