trim(_,[],[]).
trim(1,[X|L],L):-!.
trim(N,[X|L],L1):-
	N1 is N - 1,
	trim(N1,L,L1). 