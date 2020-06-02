:-[append].
rev(L,L1):-
	revacc(L,[],L1).
revacc([],A,A).
revacc([H|T],A,L1):-
	revacc(T,[H|A],L1).