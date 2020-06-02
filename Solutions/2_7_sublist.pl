sublist([],_).
sublist([X|L1],[X|L]):-
	prefix(L1,L),!.
sublist(L1,[X|L]):-
	sublist(L1,L).
prefix([],_).
prefix([X|L1],[X|L]):-
	prefix(L1,L).