:-use_module(library(ordsets)).
leciona(algoritmos, adalberto).
leciona(bases_de_dados, bernardete).
leciona(compiladores, capitolino).
leciona(estatistica, diogenes).
leciona(redes, ermelinda).


frequenta(algoritmos, alberto).
frequenta(algoritmos, bruna).
frequenta(algoritmos, cristina).
frequenta(algoritmos, diogo).
frequenta(algoritmos, eduarda).

frequenta(bases_de_dados, antonio).
frequenta(bases_de_dados, bruno).
frequenta(bases_de_dados, cristina).
frequenta(bases_de_dados, duarte).
frequenta(bases_de_dados, eduardo).

frequenta(compiladores, alberto).
frequenta(compiladores, bernardo).
frequenta(compiladores, clara).
frequenta(compiladores, diana).
frequenta(compiladores, eurico).

frequenta(estatistica, antonio).
frequenta(estatistica, bruna).
frequenta(estatistica, claudio).
frequenta(estatistica, duarte).
frequenta(estatistica, eva).

frequenta(redes, alvaro).
frequenta(redes, beatriz).
frequenta(redes, claudio).
frequenta(redes, diana).
frequenta(redes, eduardo).

aluno(X, Y) :- frequenta(UC, X), leciona(UC, Y).

colega(X, Y, UC) :- frequenta(UC, X), frequenta(UC, Y), (X \= Y).

teachers(T):-setof(Teacher, Cadeira^leciona(Cadeira, Teacher), T).

students_of(Teacher, Students):- findall(Student, aluno(Student, Teacher), Students).

teachers_of(Student, Teachers):- findall(Teacher, aluno(Student,Teacher), Teachers).

common_courses(S1, S2, C):- setof(UC, colega(S1,S2, UC), C).

more_than_one_course(L):- setof(Student, (U1,U2)^(frequenta(U1,Student), frequenta(U2,Student), U1\=U2), L).

strangers(L) :- setof(S1-S2, (UC1,UC2)^(frequenta(UC1, S1), frequenta(UC2, S2), S1 \= S2), StudentPairs),
                setof(S1-S2, UC^colega(S1, S2, UC), MatePairs),
                ord_subtract(StudentPairs, MatePairs, L).
            

good_groups(L) :- setof(S1-S2, (UC1,UC2)^(frequenta(UC1, S1), frequenta(UC2, S1), frequenta(UC1, S2), frequenta(UC2, S2), UC1 \= UC2, S1 \= S2), L).