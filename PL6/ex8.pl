list_to(0, []).
list_to(N, L):- N > 0,
                N1 is N-1,
                list_to(N1, L1),
                append(L1, [N], L).

list_from_to(Lim, Lim, [Lim]).
list_from_to(Inf, Sup, List) :- Inf < Sup,
                                Inf1 is Inf + 1,
                                list_from_to(Inf1, Sup, L1),
                                append([Inf], L1, List).

list_from_to_step(Inf, _, Sup, []) :- Inf > Sup.
list_from_to_step(Lim, _, Lim, [Lim]).
list_from_to_step(Inf, Step, Sup, [Inf|L]):-  InfStep is Inf + Step,
                                             InfStep =< Sup,
                                             list_from_to_step(InfStep, Step, Sup, L).
                            
                            
:- use_module(library(lists)).

list_from_to2(Inf, Sup, List) :- Inf > Sup,
                                list_from_to(Sup, Inf, RevL),
                                reverse(RevL, List).
list_from_to2(Inf, Sup, List) :- Inf =< Sup,
                                list_from_to(Inf, Sup, List).

list_from_to_step2(Inf, Step, Sup, List) :- Inf > Sup,
                                            list_from_to_step(Sup, Step, Inf, RevL),
                                            reverse(RevL, List).
list_from_to_step2(Inf, Step, Sup, List) :- Inf =< Sup,
                                            list_from_to_step(Inf, Step, Sup, List).

anyDivisible(X, Div) :- Div < X,
                        0 is X rem Div.

anyDivisible(X, Div) :- Div < X,
                    NewDiv is Div + 1,
                    anyDivisible(X, NewDiv).
isPrime(X) :- X >= 2,
                Div is 2,
                \+ anyDivisible(X, Div).

primes(1, []).
primes(N, List) :- N >= 2,
                   \+ isPrime(N),
                   NewN is N - 1,
                   primes(NewN, List).
primes(N, List) :- N >= 2,
                   isPrime(N),
                   NewN is N - 1,
                   primes(NewN, Front),
                   append(Front, [N], List).


fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(N, F) :- N > 1,
                    N1 is N - 1,
                    N2 is N - 2,
                    fibonacci(N1, F1),
                    fibonacci(N2, F2),
                    F is F1 + F2.

fibs(0, [0]).
fibs(1, [0,1]).
fibs(N, List) :- N > 1,
                    NewN is N - 1,
                    fibonacci(N, FN),
                    fibs(NewN, Front),
                    append(Front, [FN], List).