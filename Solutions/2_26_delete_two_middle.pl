delete_middle([],[]).
delete_middle([X],[X]).
delete_middle(L,L1):-
	append1(L2,[Mid1|[Mid2|L3]],L),
	len(L2,Y1),
	len(L3,Y2),
	Y1=Y2,!,
	append1(L2,L3,L1).