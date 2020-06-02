factorial(N,Ans):-
	factorialacc(N,1,Ans).
factorialacc(0,A,A):-!.
factorialacc(N,A,Ans):-
	A1 is A*N,
	N1 is N-1,
	factorialacc(N1,A1,Ans).