double(X, Y):- Y is X*2.

map(P, [H], [R]) :-  G =.. [P, H, R], G.
map(Pred, [H|T], [R|RT]):- 
                            G=.. [Pred, H, R],
                            G,
                            map(Pred, T, RT). 


sum(A, B, C):- C is A+B.
fold(Pred, StartValue, [H], Final):- G=.. [Pred, H, StartValue, Final], G.
fold(Pred, StartValue, [H|T], Final):- 
                                        G=.. [Pred, StartValue, H, Final1],
                                        G,
                                        fold(Pred, Final1, T, Final).


separate([], _, [], []).
separate([H|T], P, [H|Yes], No) :- 
                G =.. [P, H],
                G,
                separate(T, P, Yes, No).

separate([H|T], P, Yes, [H|No]) :- 
                G =.. [P, H],
                \+ G,
                separate(T, P, Yes, No).