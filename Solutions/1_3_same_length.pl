same_length([],[]).
same_length([X|L],[X1|L1]):-
    same_length(L,L1).