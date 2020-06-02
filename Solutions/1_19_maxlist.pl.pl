max(X,Y,X):-
    X>Y,!.
max(X,Y,Y):-
    X=<Y.
max_list([X],X):-!.
max_list([H|T],M):-
    max_list(T,M1),
    max(H,M1,M).
