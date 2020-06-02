unfold([],[]).
unfold(L,L1):-
	append1(L2,[Mid|L3],L),
	len(L2,Y1),
	len(L3,Y2),
	Y1=Y2,!,
	append1(L3,[Mid|L2],L4),
	reverse_list(L4,L1).

