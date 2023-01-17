is_ordered([_]).
is_ordered([X,Y|T]):- X =< Y,
                        is_ordered([Y|T]).

insert_ordered(V, [], [V]).
insert_ordered(V, [H|T], [V,H|T]):- V =< H.
insert_ordered(V, [H|T], [H|T2]):- V > H,
                                insert_ordered(V, T, [T2]).

insert_sort([], []).
insert_sort([H|T], Ordered):- insert_sort(T, OrderedTail),
                                insert_ordered(H, OrderedTail, Ordered).