/*
a) | ?- [a | [b, c, d] ] = [a, b, c, d] -> yes
b) | ?- [a | b, c, d ] = [a, b, c, d] -> no
c) | ?- [a | [b | [c, d] ] ] = [a, b, c, d] -> yes
d) | ?- [H|T] = [pfl, lbaw, redes, ltw] -> yes plf| lbaw, redes, ltw
e) | ?- [H|T] = [lbaw,ltw] -> yes lbaw| ltw
f) | ?- [H|T] = [leic] -> yes leic | []
g)| ?- [H|T] = [] -> no
h) | ?- [H|T] = [leic,[pfl, ltw, lbaw, redes] -> yes leic | [pfl, ltw, lbaw, redes]
i) | ?- [H|T] = [leic, Two] -> yes leic, | [Two]
j) | ?- [Inst, feup] = [gram, LEIC] -> Inst = gram, LEIC = feup
k) | ?- [One, Two | Tail] = [1, 2, 3, 4] -> yes One=1, Two=2 Tail=[3,4]
l)| ?- [One, Two | Tail] = [leic | Rest] -> One = leic, Rest = [Two|Tail]
*/