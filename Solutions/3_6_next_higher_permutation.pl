next_higher_permutation(L,L1):-
	higher_permutation(L,L1),
	not(far_higher(L,L1)),!.
higher_permutation(L,L1):-
	permutation(L,L1),
	higher(L1,L).
not(higher([],[])).
higher([H1|L],[H2|L1]):-
	H1>H2.
higher([H|L],[H|L1]):-
	higher(L,L1).
far_higher(L,L1):-
	higher_permutation(L,L2),
	higher(L1,L2).
permutation([],[]).
permutation(L,[H|L1]):-
	sel(H,L,R),
	permutation(R,L1).

sel(X,[X|L],L).
sel(X,[H|L],[H|L1]):-
	sel(X,L,L1).

not(P):-P,!,false;true.

