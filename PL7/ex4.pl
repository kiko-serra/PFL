print_n(_, 0).
print_n(S, N):- N>0,
                N1 is N-1,
                write(S), 
                print_n(S, N1).


print_string("").
print_string([Code|T]):- char_code(Char,Code),
                        write(Char),
                        print_string(T).

print_text(Text, Sym, Padd):- write(Sym),
                                print_n(' ', Padd),
                                print_string(Text),
                                print_n(' ', Padd),
                                write(Sym).


print_banner(Text, Sym, Padd):- length(Text, Length),
                                print_n(Sym, Length + Padd*2 + 1), nl,
                                write(Sym), print_n(' ', Length + Padd*2 -1), write(Sym), nl,
                                print_text(Text, Sym, Padd), nl,
                                write(Sym), print_n(' ', Length + Padd*2 -1), write(Sym),nl,
                                print_n(Sym, Length + Padd*2 + 1), nl.


read_number_acc(X, X) :- peek_code(10), !.
read_number_acc(Acc, X) :- \+ peek_code(10),
                            get_code(Code),
                            char_code('0', Zero),
                            Digit is Code-Zero,
                            Digit >= 0,
                            Digit < 10,
                            NewAcc is Acc*10 + Digit,
                            read_number_acc(NewAcc, X).
                        
read_number(X) :- read_number_acc(0, X),
                    get_code(10).
