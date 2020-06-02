len([],0).
len([X|L],s(N)):-
    len(L,N).

same_length(L,L1):-
    len(L,X),
    len(L1,X).