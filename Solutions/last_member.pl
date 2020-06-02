last_member([],_).
last_member([X],X):-!.
last_member([X|L],Ans):-
	last_member(L,Ans).