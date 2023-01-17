double(X, Y):- Y is X*2.

map(Pred, [], []).
map(Pred, [H|T], L2):- length(L1, Index),
                    Index >0,
                    I1 is Index-1,
                    map(Pred, T, L3),
                    L2 = []