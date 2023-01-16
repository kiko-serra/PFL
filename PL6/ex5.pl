list_size([],0).
list_size([_|T], Size):- list_size(T, ST),
                        Size is ST + 1.

list_sum([], 0).
list_sum([X|T], Sum):- list_sum(T, SumT),
                        Sum is X + SumT.

list_prod([], 1).
list_prod([X|T], Prod):- list_prod(T, ProdT),
                        Prod is X * ProdT.
                        
inner_product([], [], 0).
inner_product([X|T1], [Y|T2], Prod):- inner_product(T1, T2, ProdT),
                                        Prod is (X*Y) + ProdT.

count(_, [], 0).
count(E, [E|T], N):- count(E, T, NT),
                    N is NT+1.

count(E, [X|T], N):- X =\= E ,
                    count(E,T,N).