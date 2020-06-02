mergesort([],[]).
mergesort([X],[X]):-!.
mergesort(Unsorted,Sorted):-
	divide(Unsorted,Unsorted1,Unsorted2),
	mergesort(Unsorted1,Sorted1),
	mergesort(Unsorted2,Sorted2),
	merge(Sorted1,Sorted2,Sorted).
divide([],[],[]).
divide([X],[X],[]).
divide([X|[Y|Rest]],[X|L1],[Y|L2]):-
	divide(Rest,L1,L2).
merge(L,[],L).
merge([],L,L).
merge([X|L1],[Y|L2],[X|L3]):-
	X<Y,!,
	merge(L1,[Y|L2],L3).
merge([X|L1],[Y|L2],[Y|L3]):-
	X>Y,!,
	merge([X|L1],L2,L3).
merge([X|L1],[Y|L2],[X|[Y|L3]]):-
	X=Y,
	merge(L1,L2,L3).