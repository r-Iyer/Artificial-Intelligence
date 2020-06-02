intersection([],_,[]).
intersection([X|L],L1,[X|Ans]):-
	our_member(X,L1),!,
	intersection(L,L1,Ans).
intersection([H|L],L1,Ans):-
	intersection(L,L1,Ans).