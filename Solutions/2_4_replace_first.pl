rep(A,B,[],[]):-!.
rep(A,B,[A|L],[B|L1]):-
    rep(A,B,L,L1),!.

rep(A,B,[C|L],[C|M]):-
    rep(A,B,L,M).