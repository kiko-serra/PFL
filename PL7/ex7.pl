%class(Course, ClassType, DayOfWeek, Time, Duration)
class(pfl, t, '1 Seg', 11, 1). 
class(pfl, t, '4 Qui', 10, 1). 
class(pfl, tp, '2 Ter', 10.5, 2). 
class(lbaw, t, '1 Seg', 8, 2). 
class(lbaw, tp, '3 Qua', 10.5, 2).
class(ltw, t, '1 Seg', 10, 1).
class(ltw, t, '4 Qui', 11, 1). 
class(ltw, tp, '5 Sex', 8.5, 2). 
class(fsi, t, '1 Seg', 12, 1). 
class(fsi, t, '4 Qui', 12, 1). 
class(fsi, tp, '3 Qua', 8.5, 2). 
class(rc, t, '4 Qui', 8, 2). 
class(rc, tp, '5 Sex', 10.5, 2).


same_day(U1, U2):- class(U1, _, Day, _, _), class(U2, _, Day, _, _), U1\=U2.

daily_courses(Day, Courses):- findall(Uc, class(Uc, _, Day, _, _), Courses).

short_classes(L):- findall(UC-Dia/Hora, X^(class(UC,_,Dia,Hora,X), X<2), L).

course_classes(Course, Classes):- findall(Dia/Hora-Tipo, Course^class(Course, Tipo, Dia, Hora, _), Classes).

courses(L):- setof(Course, (X,Y,Z,W)^class(Course, X,Y,Z,W), L).

print_list([]).
print_list([H | T]) :- write(H), nl,
                       print_list(T).

schedule :- setof(Day/Time/Duration-Course-Type, class(Course, Type, Day, Time, Duration), Classes),
            print_list(Classes).

traducao('1 Seg',seg).
traducao('2 Ter',ter).
traducao('3 Qua',qua).
traducao('4 Qui',qui).
traducao('5 Sex',sex).

find_class:-
    write('Descobrir que aula esta a decorrer!\nDigite um dia(seg,ter,qua,qui,sex): '),
    read(DayExterno),
    write('Digite um hora: '),
    read(Hora),
    traducao(DayInterno,DayExterno),
    findall(UC/HoraInicio-Duracao,
    (class(UC,_,DayInterno,HoraInicio,Duracao),
    Hora >= HoraInicio,
    HoraFinal is HoraInicio + Duracao,
    Hora =< HoraFinal),AulasAgora),
    write(AulasAgora).