append1([],L,L).
append1([X|L1],L2,[X|L3]):-
    append1(L1,L2,L3).

reverse1([],[]).
reverse1([H|T],L):-
    reverse1(T,Z),
    append1(Z,[H],L).

fib(1,[0]):-!.
fib(2,[1,0]):-!.
fib(N,[H|[X|[Y|L]]]):-
    N1 is N-1,
    fib(N1,[X|[Y|L]]),
    H is X+Y.

fibonacci(N,L):-
    fib(N,L1),
    reverse1(L1,L).