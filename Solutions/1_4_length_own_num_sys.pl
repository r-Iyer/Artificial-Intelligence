len([],0).
len([X|L],s(N)):-
    len(L,N).
