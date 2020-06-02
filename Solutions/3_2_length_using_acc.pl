length3(L,N):-
	lengthacc(L,0,N).
lengthacc([],A,A).
lengthacc([X|L],A,N):-
	A1 is A+1,
	lengthacc(L,A1,N).