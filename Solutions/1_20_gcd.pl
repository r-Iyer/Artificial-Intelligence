gcd1(0,X,X):-
    X>0,!.
gcd1(Y1,Y2,Y):-
    Y1>=Y2,!,
    Y3 is Y1-Y2,
    gcd1(Y3,Y2,Y).
gcd1(Y1,Y2,Y):-
    Y1<Y2,!,
    Y3 is Y2-Y1,
    gcd1(Y3,Y1,Y).