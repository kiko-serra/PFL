% to load
% use consult('ex1.pl')

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
father(X,Y):- parent(X,Y), male(X).
mother(X,Y):- parent(X,Y), female(X).
grandfather(X,Y):- parent(X,Z), parent(Z,Y), male(X).
grandmother(X,Y):- parent(X,Z), parent(Z,Y), female(X).
sibling(X,Y):- parent(P1,X), parent(P1,Y), parent(P2,X), parent(P2,Y), (X\=Y), (P1\=P2).
brother(X,Y):- sibling(X,Y), male(X).
sister(X,Y):- sibling(X,Y), female(X).
halfSibling(X,Y):- \+ sibling(X,Y), parent(P1,X), parent(P1,Y), (X\=Y).
cousins(X,Y):- parent(PX, X), parent(PY, Y), sibling(PX,PY), (X\=Y), (PX\=PY).
genderlessUncle(X,Y):- parent(PY,Y), sibling(PY,X).
uncle(X,Y):- genderlessUncle(X,Y), male(X).
aunt(X,Y):- genderlessUncle(X,Y), female(X).

% marriages and divorces
married(jay, gloria, 2008).
married(jay, dede, 1968).
divorced(jay, dede, 2003).

% bonus
married(A,B,Y):- married(B,A,Y).
divorced(A,B,Y):- divorced(B,A,Y).