delete(A,[],[]):-!.
delete(A,[A|L],L1):-
    delete(A,L,L1),!.

delete(A,[B|L],[B|M]):-
    delete(A,L,M).