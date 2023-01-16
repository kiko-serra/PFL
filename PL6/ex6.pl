invert(Xs, List):- invert(Xs, [], List).
invert([X|T], Acc, List):- invert(T, [X|Acc], List).
invert([], Inv, Inv).

del_one(_, [], []).
del_one(E, [E|T], T).
del_one(E, [X|T], Ret):- E =\= X,
                            del_one(E, T, List),
                            Ret = [X|List].

del_all(_, [], []).
del_all(E,[E|T], L):- del_all(E, T, L).
del_all(E, [X|T], L):- E =\= X,
                        del_all(E, T, LT),
                        L = [X|LT].

del_all_list(_, [], []).
del_all_list(LE, [X|T], List):- member(X, LE),
                                del_all_list(LE, T, List).
del_all_list(LE, [X|T], List):- \+ member(X, LE),
                                del_all_list(LE, T, L),
                                List = [X | L].

del_dups([], []).
del_dups([X|T], L):-del_all(X, T, List),
                    del_dups(List, L1),
                    L = [X|L1].

list_perm([], []).
list_perm([H1 | T1], L2) :- del_one(H1, L2, DelL2),
                            list_perm(T1, DelL2).


replicate(0, _, []).
replicate(X, E, [E|L]):- X > 0,
                    X1 is X-1,
                    replicate(X1, E, L).

intersperse(_, [], []).
intersperse(E, [X|T], L):- intersperse(E, T, L1),
                            L = [X,E|L1].

insert_elem(_, [], _, []).
insert_elem(0, [X|T], E, [E,X|T]).
insert_elem(In, [X|T], E, L):- In > 0,
                            I1 is In -1,
                            insert_elem(I1, T, E, L2),
                            L = [X|L2].

delete_elem(_, [], _, []).
delete_elem(0, [E|T], E, T).
delete_elem(In, [X|T], E, L):- In > 0,
                                I1 is In-1,
                                delete_elem(I1, T, E, L1),
                                L = [X|L1].

replace([], _, _, _, []).
replace([Old|T], 0, Old, New, [New|T]).
replace([X|T], In, Old, New, L):- In > 0,
                                    I1 is In -1,
                                    replace(T, I1, Old, New, L1),
                                    L = [X|L1].