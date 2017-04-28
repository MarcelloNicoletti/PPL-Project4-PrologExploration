% Project 4: Create a predicate nextItem(L, N) that gives the next number in
%   the polynomial sequence L. ex: nextItem([146, 394, 882, 1730, 3082], N)
%   returns N = 5106
%
% Procedure: The input line is the top row of a triangular chart
%   where each row is one shorter. To reduce each row do subtraction for
%   each neighbor pair. Once the row is one long that value can be added to
%   the last item of the row above, that result to the last of the row above
%   that, and so on, until the very top row where that result is then the
%   answer for nextItem.
%
% Visual Example: nextItem([146, 394, 882, 1730, 3082], N)
%
% Reduction:
% 146     394      882     1730      3082
%     248     488      848      1352
%         240      360     504
%             120      144
%                  24
% Addition:
% 146     394      882     1730      3082 + 2024 = [5106]
%     248     488      848      1352 + 672 = 2024
%         240      360     504 + 168 = 672
%             120      144 + 24 = 168
%                  24
%
% Hints:
%   Predicates:
%     rowBelow(A, B): A is a list representing a row, B is the row below that.
%     myLast(A, X): X is the last item in row represented by list A

myLast([X], X) :- !.
myLast([_| R], X) :- myLast(R, X).

rowBelow([X, Y], [B]) :- B is Y - X, !.
rowBelow([X, Y| R], [B | T]) :- rowBelow([Y | R], T), B is Y - X.

nextItem([X], X) :- !.
nextItem(A, N) :- rowBelow(A, R), nextItem(R, M), myLast(A, Z), N is Z + M.
