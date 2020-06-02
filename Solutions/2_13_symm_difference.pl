symm_difference(L1,L2,L):-
	difference(L1,L2,L3),
	difference(L2,L1,L4),
	union(L3,L4,L).