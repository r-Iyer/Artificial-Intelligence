:-["2_8_our_member"].
del(L,L1):-
	delacc(L,[],L1).
delacc([],A,A):-!.
delacc([X|L],A,L1):-
	our_member(X,L),!,
	delacc(L,A,L1);
	delacc(L,[X|A],L1).