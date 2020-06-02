append1([],L,L).
append1([X|L1],L2,[X|L3]):-
    append1(L1,L2,L3).

reverse1([],[]).
reverse1([H|T],L):-
    reverse1(T,Z),
    append1(Z,[H],L).