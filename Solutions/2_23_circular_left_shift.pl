left_shift([],[]).
left_shift([X],[X]).
left_shift(L,L1):-
	append1([First|Mid],[Last],L),!,
	append1(Mid,[Last|[First]],L1).