:-["2_8_our_member"].
subset([],_).
subset([X|L1],L):-
	our_member(X,L),
	subset(L1,L).