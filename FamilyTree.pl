/* Facts */

male(bob).
male(chad).
male(frank).
male(gary).
male(howard).
male(isaiah).

female(ann).
female(diane).
female(ella).
female(jane).
female(kelly).

parent_of(ann,chad).
parent_of(bob,chad).
parent_of(ann,ella).
parent_of(bob,ella).
parent_of(diane,gary).
parent_of(chad,gary).
parent_of(chad,howard).
parent_of(diane,howard).
parent_of(ella,isaiah).
parent_of(frank,isaiah).
parent_of(jane,kelly).
parent_of(isiah,kelly).


/* Rules */

father_of(X,Y):- male(X),
    parent_of(X,Y).

mother_of(X,Y):- female(X),
    parent_of(X,Y).

grandfather_of(X,Y):- male(X),
    parent_of(X,Z),
    parent_of(Z,Y).

grandmother_of(X,Y):- female(X),
    parent_of(X,Z),
    parent_of(Z,Y).

sister_of(X,Y):- %(X,Y or Y,X)%
    female(X),
    father_of(F, Y),
    father_of(F,X),
    X \= Y.

sister_of(X,Y):- female(X),
    mother_of(M, Y),
    mother_of(M,X),
    X \= Y.

aunt_of(X,Y):- female(X),
    parent_of(Z,Y),
    sister_of(Z,X),
    !.

brother_of(X,Y):- %(X,Y or Y,X)%
    male(X),
    father_of(F, Y),
    father_of(F,X),
    X \= Y.

brother_of(X,Y):- male(X),
    mother_of(M, Y),
    mother_of(M,X),
    X \= Y.

uncle_of(X,Y):-
    parent_of(Z,Y),
    brother_of(Z,X).

ancestor_of(X,Y):- parent_of(X,Y).

ancestor_of(X,Y):-
    parent_of(X,Z),
    ancestor_of(Z,Y).
