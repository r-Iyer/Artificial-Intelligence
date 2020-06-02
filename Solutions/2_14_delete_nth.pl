del(X,[],[]).
del(1,[H|L],L).
del(X,[H|L],[H|L1]):-
	X1 is X - 1,
	del(X1,L,L1).
