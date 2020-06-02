between1(N2,N2,[N2]):-!.
between1(N1,N2,L):-
    N1<N2,!,
    N3 is N1+1,
    between1(N3,N2,L1),
    append([N1],L1,L).
