difference([],L1,[]).
difference([X|L],L1,Ans):-
	our_member(X,L1),!,
	difference(L,L1,Ans).
difference([H|L],L1,[H|Ans]):-
	difference(L,L1,Ans).