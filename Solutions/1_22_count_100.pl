great([],0):-!.
great([H|L],X):-
    H>100,!,
    great(L,X1),
    X is X1+1.
great([H|L],X1):-
    great(L,X1).