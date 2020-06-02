replace(X,Y,[],[]).
replace(X,Y,[H],[H]).
replace(X,Y,[X|L],[Y|L1]):-
	replace(X,Y,L,L1).
replace(X,Y,[H|L],[H|L1]):-
	replace(X,Y,L,L1).