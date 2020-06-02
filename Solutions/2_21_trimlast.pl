trimlast(N,L,L1):-
	len(L,Len),
	N1 is Len - N,
	trim(N1,L,L1).
trim(_,[],[]):-!.
trim(0,L,[]):-!.
trim(N,[X|L],[X|L1]):-
	N1 is N - 1,
	trim(N1,L,L1). 