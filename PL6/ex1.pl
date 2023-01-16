fatorial(0, 1).
fatorial(N, F):- N > 0,
                N1 is N-1,
                fatorial(N1, Fac),
                F is Fac * N.

somaRec(0,0).
somaRec(N, Sum):- N > 0,
                N1 is N-1,
                somaRec(N1, Sum1),
                Sum is Sum1 + N.

fibonacci(0,0).
fibonacci(1,1).
fibonacci(N, Fib):- N>0,
                    N1 is N-1,
                    N2 is N-2,
                    fibonacci(N1, Fib1),
                    fibonacci(N2, Fib2),
                    Fib is Fib1 + Fib2.

anyDivisible(X, Div) :- Div < X,
                        0 is X rem Div.

anyDivisible(X, Div) :- Div < X,
                    NewDiv is Div + 1,
                    anyDivisible(X, NewDiv).

isPrime(X) :- X >= 2,
          Div is 2,
          \+ anyDivisible(X, Div).
                