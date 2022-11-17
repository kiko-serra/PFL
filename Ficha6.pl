%reconsult('Ficha6.pl').
%1.a
factorial(0,1).
factorial(N,F):- N > 0,
                N1 is N-1,
                factorial(N1,F1),
                F is F1*N.

%1.b
somaRec(0,0).
somaRec(N,Sum):- N > 0,
                N1 is N-1,
                somaRec(N1,Sum1),
                Sum is Sum1+N.

%1.c
fibonacci(0,0).
fibonacci(1,1).
fibonacci(N,F):- N > 1,
                N1 is N-1,
                N2 is N-2,
                fibonacci(N1,F1),
                fibonacci(N2,F2),
                F is F1+F2.

%1.d


%5.a
list_size([],0).
list_size([_|R], N):- list_size(R,N1),
                       N is N1+1.