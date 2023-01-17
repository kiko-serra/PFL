:- dynamic male/1, female/1, private/1, parent/2.

save_person(male, Name) :- assert(male(Name)).
save_person(female, Name) :- assert(female(Name)).
save_person(private, Name) :- assert(private(Name)).
save_person(father, Name, Person):- assert(parent(Name, Person)), assert(male(Name)).
save_person(mother, Name, Person):- assert(parent(Name, Person)), assert(female(Name)).

add_person :- format('male/female/private?~n', []),
              read(Gender), nl,
              format('first name?~n', []),
              read(Name),
              save_person(Gender, Name).

add_parents(Person):- format('father/mother?~n',[]),
                        read(Parent), nl,
                        format('first name?~n', []),
                        read(Name),
                        save_person(Parent, Name, Person), nl,
                        format('father/mother?~n',[]),
                        read(Parent1), nl,
                        format('first name?~n', []),
                        read(Name2),
                        save_person(Parent1, Name2, Person).

                        remove_gender(Person) :- male(Person),
                        retract(male(Person)).

                    
remove_gender(Person) :- female(Person),
                        retract(female(Person)).
remove_gender(Person) :- private(Person),
                        retract(private(Person)).
remove_gender(_).

remove_person :- format('insert your death note entry, please~n', []),
                read(Person), nl,
                remove_gender(Person),
                retractall(parent(_, Person)),
                retractall(parent(Person, _)).