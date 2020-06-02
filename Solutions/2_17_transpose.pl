transpose([],[],[]).
transpose([X|L1],[Y|L2],[[X|[Y]]|L]):-
	len(L1,A),
	len(L2,B),
	A=B,!,
	transpose(L1,L2,L).
