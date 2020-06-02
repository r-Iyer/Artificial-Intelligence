:-["2_8_our_member"].
del([],[]).
del([X|L],L1):-
	our_member(X,L),!,
	del(L,L1).
del([H|L],[H|L1]):-
	del(L,L1).
