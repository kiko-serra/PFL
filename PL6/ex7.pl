list_append(L1, L2, L3):- append(L1, L2, L3).

list_member(Elem, List) :- list_append(_Part1, [Elem | _Part2], List).

list_last(List, Last):- list_append(_Part1, [_Part2, Last], List).