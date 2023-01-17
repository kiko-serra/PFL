:- dynamic round/4.
:- use_module(library(lists)).
% round(RoundNumber, DanceStyle, Minutes, [Dancer1-Dancer2 | DancerPairs])
% round/4 indica, para cada ronda, o estilo de dança, a sua duração, e os pares de dançarinos participantes.
round(1, waltz, 8, [eugene-fernanda]).
round(2, quickstep, 4, [asdrubal-bruna,cathy-dennis,eugene-fernanda]).
round(3, foxtrot, 6, [bruna-dennis,eugene-fernanda]).
round(4, samba, 4, [cathy-asdrubal,bruna-dennis,eugene-fernanda]).
round(5, rhumba, 5, [bruna-asdrubal,eugene-fernanda]).
% tempo(DanceStyle, Speed).
% tempo/2 indica a velocidade de cada estilo de dança.
tempo(waltz, slow).
tempo(quickstep, fast).
tempo(foxtrot, slow).
tempo(samba, fast).
tempo(rhumba, slow).

%ex1
style_round_number(DanceStyle, RoundNumber):- round(RoundNumber, DanceStyle, _X, _Y).

%ex2
n_dancers(RoundNumber, NDancers):- round(RoundNumber, _X, _Y, Dancers),
                                    length(Dancers, Length),
                                    NDancers is Length*2.
                                    
%ex3
danced_in_round(Round, Dancer):-
    round(Round, _Style, _Mins, Pairs),
    member(Dancer-_Pair, Pairs).
danced_in_round(Round, Dancer):-
    round(Round, _Style, _Mins, Pairs),
    member(_Pair-Dancer, Pairs).


%ex4 
n_rounds(Round):-
    round(Round, _Style, _Mins, _Pairs),
    \+( (round(R1,_,_,_), R1 > Round) ).

%ex5 
add_dancer_pair(Round, Dancer1, Dancer2):-
    \+ danced_in_round(Round, Dancer1),
    \+ danced_in_round(Round, Dancer2),
    retract( round(Round, Style, Minutes, Pairs) ),
    assert( round(Round, Style, Minutes, [Dancer1-Dancer2|Pairs]) ).

%ex6 
total_dance_time(Dancer, Time):-
	danceTime(Dancer, [], 0, Time).

danceTime(Dancer, Rounds, Temp, Time):-
	danced_in_round(Round, Dancer),
	\+ member(Round, Rounds),!,
	round(Round, _Style, Mins, _Pairs),
	NTemp is Temp + Mins,
	danceTime(Dancer, [Round|Rounds], NTemp, Time).
danceTime(_Dancer, _Rounds, Time, Time).
                                

%ex7
print_program:-
	round(_Round, Style, Mins, Pairs),
	length(Pairs, NPairs),
	write(Style), 
	write(' ('), write(Mins), 
	write(') - '), write(NPairs),
	nl,
	fail.
print_program.

%ex8
dancer_n_dances(Dancer, NDances):- setof(Round, danced_in_round(Round, Dancer), Rounds),
                                    length(Rounds, NDances).

%ex9
most_tireless_dancer(Dancer):- setof(Time-Dancer,Round^(danced_in_round(Round, Dancer), total_dance_time(Dancer, Time)), List),
                                reverse(List, [_Time-Dancer|_]).


%ex10
%O predicado predX(+L,-N) recebe uma lista L de termos e retorna em N o número de termos em L de aridade 2.

%ex11
%O cut é vermelho pois afeta o conjunto de soluções devolvidas por predX/2.
%Se for removido, predX/2 retorna diferentes valores de N (inferiores ao resultado correto) por backtracking.

%ex12
