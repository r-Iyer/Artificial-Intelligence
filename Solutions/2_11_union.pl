union([],L1,L1).
union([X|L],L1,Ans):-
	our_member(X,L1),!,
	union(L,L1,Ans).
union([H|L],L1,[H|Ans]):-
	union(L,L1,Ans).
