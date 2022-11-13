% to load
% use consult('Ficha5.pl')

%gender

female(grace).
female(dede).
female(gloria).
female(barb).
female(claire).
female(pameron).
female(haley).
female(alex).
female(lily).
female(poppy).

male(frank).
male(jay).
male(javier).
male(merle).
male(phil).
male(mitchell).
male(joe).
male(manny).
male(cameron).
male(bo).
male(dylan).
male(luke).
male(rexford).
male(calhoun).
male(george).

%relations
parent(grace, phil).
parent(frank, phil).

parent(dede, claire).
parent(jay, claire).

parent(dede, mitchell).
parent(jay, mitchell).

parent(gloria, joe).
parent(jay, joe).

parent(gloria, manny).
parent(javier, manny).

parent(barb, cameron).
parent(merle, cameron).

parent(barb, pameron).
parent(merle, pameron).

parent(phil, haley).
parent(claire, haley).

parent(phil, alex).
parent(claire, alex).

parent(phil, luke).
parent(claire, luke).

parent(mitchell, lily).
parent(cameron, lily).

parent(mitchell, rexford).
parent(cameron, rexford).

parent(pameron, calhoun).
parent(bo, calhoun).

parent(dylan, george).
parent(haley, george).

parent(dylan, poppy).
parent(haley, poppy).

%rules
father(X,Y) :- parent(X,Y), male(X).
mother(X,Y) :- parent(X,Y), female(X).
grandparent(X,Y) :- parent(X,Z), parent(Z,Y).
grandfather(X,Y) :- grandparent(X,Y), male(X).
grandmother(X,Y) :- grandparent(X,Y), female(X).

