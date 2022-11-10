/*
 * SICSTUS CLPFD DEMONSTRATION PROGRAM
 * Purpose   : Car Sequencing Problem
 * Author    : Mats Carlsson

 TODO: In any column of OptionsVars, the longest stretch of zeros is:

		n - (k + (q-p)*max(0,ceiling(k/p)-2)) =
		n - (k + (q-p)*max(0,(k-p-1)//p))

 where:

 n = #cars
 k = demand for option
 p/q = capacity of option
 
 */

:- module(cars, [cars/2]).
:- use_module(library(lists)).
:- use_module(library(clpfd)).

:- discontiguous
	problem/4,
	capacities/2,
	sizes/2,
	class/4.
:- dynamic
	problem/4,
	capacities/2,
	sizes/2,
	class/4.

cars(ff, Key) :-
	system(Key, Vars, _, _),
	labeling([ff], Vars),
	writeq(Vars),
	nl.
cars(minslack, Key) :-
	system(Key, Vars, OptionsVarsT, Ks),
	problem(Key, NbCars, _, _),
	capacities(Key, Ps),
	sizes(Key, Qs),
	(   foreach(P,Ps),
	    foreach(Q,Qs),
	    foreach(K,Ks),
	    foreach(Slack-J,Options1),
	    count(J,1,_),
	    param(NbCars)
	do  slack_length(P, Q, K, NbCars, Slack0),
	    Slack is Slack0 - Q
	),
	keysort(Options1, Options2),
	(   foreach(_-Option,Options2),
	    foreach(Column2,Columns2),
	    param(OptionsVarsT,NbCars)
	do  nth1(Option, OptionsVarsT, Column1),
	    N0 is -(NbCars // 2),
	    (   foreach(C1,Column1),
	        foreach(C2,Column2),
		foreach(K-C1,KL1),
		foreach(_-C2,KL2),
		count(I,N0,_)
	    do  K is abs(I)
	    ),
	    keysort(KL1, KL2)
	),
	append(Columns2, LabelVars),
	labeling([down], LabelVars),
	writeq(Vars), nl.

slack_length(P, Q, K, N, L) :-
	L is N - (K + (Q-P)*max((K-P-1)//P,0)) + 1.
	
system(Key, ClassVars, OptionVarsT, DemandsPerOption) :-
	problem(Key, NbCars, NbOptions, NbClasses),
	capacities(Key, Capacities),
	sizes(Key, Sizes),
	NbCl1 is NbClasses-1,
	length(ClassVars, NbCars),
	domain(ClassVars, 0, NbCl1),
	findall(Demand, class(Key,_,Demand,_), Demands1),
	findall(Row, class(Key,_,_,Row), Rows),
	sumlist(Demands1, NbCars), % sanity check
	(   foreach(D1,Demands1),
	    foreach(I-D1,Demands2),
	    count(I,0,_)
	do  true
	),
	global_cardinality(ClassVars, Demands2),
	transpose(Rows, Columns),
	(   foreach(Col,Columns),
	    foreach(D2,DemandsPerOption),
	    param(Demands1)
	do  scalar_product(Demands1, Col, #=, D2)
	),
	findall([Class|Row], class(Key,Class,_,Row), ClassesRows),
	(   foreach(C,ClassVars),
	    foreach([C|O],ClassOptionVars),
	    foreach(O,OptionVars),
	    param(NbOptions)
	do  length(O, NbOptions),
	    domain(O, 0, 1)
	),
	table(ClassOptionVars, ClassesRows),
	transpose(OptionVars, OptionVarsT),
	(   foreach(Use,OptionVarsT),
	    foreach(Cap,Capacities),
	    foreach(Size,Sizes),
	    foreach(Demand1,DemandsPerOption)
	do  capacity(Use, Cap, Size, Demand1)
	).

% Capacity constraints in terms of finite automata.
% capacity(Vars, P, Q, K).
capacity(Vars, 1, 2, K) :- !,
	regexp_k(K, REk),
	RE_1_outof_2 = [*(0),*([1,0,*(0)]),?(1),*(0)],
	regular(Vars, REk /\ RE_1_outof_2).
capacity(Vars, 1, 3, K) :- !,
	regexp_k(K, REk),
	RE_1_outof_3 = [*(0),*([1,0,0,*(0)]),?(1),*(0)],
	regular(Vars, REk /\ RE_1_outof_3).
capacity(Vars, 2, 3, K) :- !,
	regexp_k(K, REk),
	Repeat = {[1,1],[1]},
	RE_2_outof_3 = [*(0), *([Repeat,0,*(0)]), ?(Repeat), *(0)],
	regular(Vars, REk /\ RE_2_outof_3).
capacity(Vars, 1, 5, K) :- !,
	regexp_k(K, REk),
	RE_1_outof_5 = [*(0),*([1,0,0,0,0,*(0)]),?(1),*(0)],
	regular(Vars, REk /\ RE_1_outof_5).
capacity(Vars, 2, 5, K) :- !,
	regexp_k(K, REk),
	ZO = [0,1],
	ZZO = [0,0,1],
	Repeat = {[1],
		  [1,1],
		  [1, ZO],
		  [1, ?(ZO), +(ZZO), *([ZO,+(ZZO)]), ?(ZO)]},
	RE_2_outof_5 = [*(0), *([Repeat, 0, 0, 0, *(0)]), ?(Repeat), *(0)],
	regular(Vars, REk /\ RE_2_outof_5).

regexp_k(K, REk) :-
	(   for(_, 1, K),
	    fromto(REk,RE2,RE3,[*(0)])
	do  RE2 = [*(0),1|RE3]
	).

% problem(ID, #cars, #options, #classes).
% capacities(ID, [for each option, the maximum number of cars with that option in a block]).
% sizes(ID, [for each option, the block size to which the maximum number refers]).
% class(ID, class, #cars, [for each option, whether or not this class requires it (1 or 0)]).

problem(tiny, 10, 5, 6).
capacities(tiny, [1,2,1,2,1]).
sizes(tiny, [2,3,3,5,5]).
class(tiny, 0, 1, [1,0,1,1,0]).
class(tiny, 1, 1, [0,0,0,1,0]).
class(tiny, 2, 2, [0,1,0,0,1]).
class(tiny, 3, 2, [0,1,0,1,0]).
class(tiny, 4, 2, [1,0,1,0,0]).
class(tiny, 5, 2, [1,1,0,0,0]).

%---------------------------------
% Problem 4/72  (Regin & Puget #1)
%---------------------------------

problem('4/72', 100, 5, 22).
capacities('4/72', [1,2,1,2,1]).
sizes('4/72', [2,3,3,5,5]).
class('4/72', 0, 6, [1,0,0,1,0]).
class('4/72', 1, 10,[1,1,1,0,0]).
class('4/72', 2, 2, [1,1,0,0,1]).
class('4/72', 3, 2, [0,1,1,0,0]).
class('4/72', 4, 8, [0,0,0,1,0]).
class('4/72', 5, 15,[0,1,0,0,0]).
class('4/72', 6, 1, [0,1,1,1,0]).
class('4/72', 7, 5, [0,0,1,1,0]).
class('4/72', 8, 2, [1,0,1,1,0]).
class('4/72', 9, 3, [0,0,1,0,0]).
class('4/72', 10, 2, [1,0,1,0,0]).
class('4/72', 11, 1, [1,1,1,0,1]).
class('4/72', 12, 8, [0,1,0,1,0]).
class('4/72', 13, 3, [1,0,0,1,1]).
class('4/72', 14, 10,[1,0,0,0,0]).
class('4/72', 15, 4, [0,1,0,0,1]).
class('4/72', 16, 4, [0,0,0,0,1]).
class('4/72', 17, 2, [1,0,0,0,1]).
class('4/72', 18, 4, [1,1,0,0,0]).
class('4/72', 19, 6, [1,1,0,1,0]).
class('4/72', 20, 1, [1,0,1,0,1]).
class('4/72', 21, 1, [1,1,1,1,1]).


%--------------
% Problem 16/81
%--------------

problem('16/81', 100,5,26).
capacities('16/81', [1,2,1,2,1]).
sizes('16/81', [2,3,3,5,5]).
class('16/81', 0, 10, [1,0,0,0,0]).
class('16/81', 1, 2, [0,0,0,0,1]).
class('16/81', 2, 8, [0,1,0,1,0]).
class('16/81', 3, 8, [0,0,0,1,0]).
class('16/81', 4, 6, [0,1,1,0,0]).
class('16/81', 5, 11, [0,1,0,0,0]).
class('16/81', 6, 3, [0,0,1,0,0]).
class('16/81', 7, 2, [0,0,1,1,0]).
class('16/81', 8, 7, [1,1,0,0,0]).
class('16/81', 9, 2, [1,0,0,1,1]).
class('16/81', 10, 4, [1,0,1,0,0]).
class('16/81', 11, 7, [1,0,0,1,0]).
class('16/81', 12, 1, [1,1,1,0,1]).
class('16/81', 13, 3, [0,1,1,1,0]).
class('16/81', 14, 4, [0,1,0,0,1]).
class('16/81', 15, 5, [1,1,1,0,0]).
class('16/81', 16, 2, [1,1,0,0,1]).
class('16/81', 17, 1, [1,0,1,1,1]).
class('16/81', 18, 2, [1,0,1,1,0]).
class('16/81', 19, 3, [1,0,0,0,1]).
class('16/81', 20, 2, [0,1,1,0,1]).
class('16/81', 21, 1, [0,1,0,1,1]).
class('16/81', 22, 3, [1,1,0,1,0]).
class('16/81', 23, 1, [0,0,1,1,1]).
class('16/81', 24, 1, [1,1,1,1,1]).
class('16/81', 25, 1, [1,1,1,1,0]).


%--------------
% Problem 41/66
%--------------
problem('41/66', 100,5,19).
capacities('41/66', [1,2,1,2,1]).
sizes('41/66', [2,3,3,5,5]).
class('41/66', 0, 7, [1,0,0,0,0]).
class('41/66', 1, 9, [0,1,1,0,0]).
class('41/66', 2, 4, [0,0,0,1,0]).
class('41/66', 3, 2, [0,1,0,1,1]).
class('41/66', 4, 6, [0,0,1,0,0]).
class('41/66', 5, 18, [0,1,0,0,0]).
class('41/66', 6, 6, [0,1,0,0,1]).
class('41/66', 7, 6, [0,0,0,0,1]).
class('41/66', 8, 1, [1,1,0,1,1]).
class('41/66', 9, 10, [1,1,0,0,0]).
class('41/66', 10, 2, [1,0,0,0,1]).
class('41/66', 11, 11, [0,1,0,1,0]).
class('41/66', 12, 5, [0,0,1,1,0]).
class('41/66', 13, 1, [0,1,1,1,0]).
class('41/66', 14, 1, [0,1,1,0,1]).
class('41/66', 15, 3, [1,0,1,0,0]).
class('41/66', 16, 3, [1,1,1,0,0]).
class('41/66', 17, 3, [1,1,0,1,0]).
class('41/66', 18, 2, [1,1,1,1,0]).

%-------------
%Problem 26/82
%-------------
problem('26/82', 100,5,24).
capacities('26/82', [1,2,1,2,1]).
sizes('26/82', [2,3,3,5,5]).
class('26/82', 0, 2, [1,1,0,1,0]).
class('26/82', 1, 13, [0,1,0,0,0]).
class('26/82', 2, 10, [0,1,0,1,0]).
class('26/82', 3, 14, [1,1,0,0,0]).
class('26/82', 4, 5, [0,0,0,1,0]).
class('26/82', 5, 2, [0,1,0,1,1]).
class('26/82', 6, 2, [0,1,1,0,0]).
class('26/82', 7, 8, [1,0,0,1,0]).
class('26/82', 8, 5, [0,0,1,1,0]).
class('26/82', 9, 3, [1,1,1,0,0]).
class('26/82', 10, 9, [1,0,0,0,0]).
class('26/82', 11, 6, [1,1,0,0,1]).
class('26/82', 12, 2, [1,1,1,1,0]).
class('26/82', 13, 2, [0,0,0,0,1]).
class('26/82', 14, 1, [1,1,1,0,1]).
class('26/82', 15, 2, [0,1,1,1,0]).
class('26/82', 16, 2, [1,0,1,0,0]).
class('26/82', 17, 1, [1,0,0,0,1]).
class('26/82', 18, 1, [1,0,1,1,0]).
class('26/82', 19, 6, [0,0,1,0,0]).
class('26/82', 20, 1, [1,1,1,1,1]).
class('26/82', 21, 1, [0,0,1,1,1]).
class('26/82', 22, 1, [0,1,1,0,1]).
class('26/82', 23, 1, [0,0,1,0,1]).
