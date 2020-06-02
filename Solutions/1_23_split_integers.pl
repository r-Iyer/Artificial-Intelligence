split([],[],[]):-!.
split([H|L],[H|L1],L2):-
    H>0,!,
    split(L,L1,L2).
split([H|L],L1,[H|L2]):-
    H<0,!,
    split(L,L1,L2).
