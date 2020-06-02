len([],0).
len([H|L],X):-
	len(L,X1),
	X is X1 + 1.