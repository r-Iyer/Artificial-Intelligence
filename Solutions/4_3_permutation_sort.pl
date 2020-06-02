permutation_sort([],[]).
permutation_sort(L,L1):-
	permutation(L,L1),
	ordered(L1),!.
permutation([],[]).
permutation(L,[H|L1]):-
	sel(H,L,R),
	permutation(R,L1).

sel(X,[X|L],L).
sel(X,[H|L],[H|L1]):-
	sel(X,L,L1).

ordered([]):-!.
ordered([X]):-!.
ordered([X|[Y|L]]):-
	X<Y,
	ordered([Y|L]).