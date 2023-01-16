list_append(L1, L2, L3):- append(L1, L2, L3).

list_member(Elem, List) :- list_append(_Part1, [Elem | _Part2], List).

list_last(List, Last):- list_append(_Part1, [_Part2, Last], List).

list_nth(N, List, Elem):- list_append(Part1, [Elem|_Part2], List),
                            length(Part1, N).

list_append([], []).
list_append([H|T], List) :- list_append(T, L),
                            append(H, L, List).

list_del([Elem|T], Elem, Res):- append(T, [], Res).
list_del([X|T], Elem, Res):- list_del(T, Elem, Res1),
                                Res = [X|Res1].

list_before(First, Second, List):- list_append(_Part1, [First|Part2], List),
                                    list_append(_, [Second|_Part3], Part2).

list_replace_one(X, Y, L1, L2):- list_append(Part1, [X|Part2], L1),
                                list_append(Part1, [Y|Part2], L2).

list_repeated(X, L1):- list_append(_Part1, [X,X|_Part2], L1).


list_slice(L, Index, Size, List2):- list_append(Front, Rem, L),
                                    length(Front, Index),
                                    list_append(List2, _last, Rem),
                                    length(List2, Size).

list_shift_rotate(L, N, L2):- list_append(Front, Back, L),
                                length(Front, N),
                                list_append(Back, Front, L2).
