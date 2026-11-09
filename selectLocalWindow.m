function [bestQ, scores] = selectLocalWindow(x, candidates)
%SELECTLOCALWINDOW Evaluate candidate local windows using monotonicity.
%   [bestQ,scores] = gdag.selectLocalWindow(x,candidates)
%   scores is a table with q and monotonicityRatio. The selected q maximizes
%   the proportion of nonnegative first differences in DPAGO(x,q).
%
%   IMPORTANT: this is a transparent example criterion, not a claim that
%   this exact objective is specified in the book. Replace it with the
%   criterion defined by the final, verified research methodology.
x = gdag.validateInput(x, 'x');
n = numel(x);
if nargin < 2 || isempty(candidates)
    candidates = 1:n;
end
candidates = unique(candidates(:));
if any(~isfinite(candidates)) || any(candidates ~= floor(candidates)) || ...
        any(candidates < 1) || any(candidates > n)
    error('gdag:InvalidCandidates', 'candidates must be integers in [1,n].');
end
ratio = zeros(numel(candidates),1);
for i = 1:numel(candidates)
    z = gdag.dpago(x, candidates(i));
    if numel(z) <= 1
        ratio(i) = 1;
    else
        ratio(i) = mean(diff(z) >= 0);
    end
end
scores = table(candidates, ratio, 'VariableNames', {'q','monotonicityRatio'});
[~,idx] = max(ratio);
bestQ = candidates(idx);
end
