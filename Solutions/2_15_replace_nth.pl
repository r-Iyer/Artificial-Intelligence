replace(X,Y,[],[]).
replace(1,Y,[H|L],[Y|L]).
replace(X,Y,[H|L],[H|L1]):-
	X1 is X - 1,
	replace(X1,Y,L,L1).
