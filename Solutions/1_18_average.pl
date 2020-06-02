len([],0).
len([X|Rest],L):-
    len(Rest,Lr),
    L is Lr+1.

sum([],0).
sum([X|Rest],S):-
    sum(Rest,Sr),
    S is Sr+X.

avg(L,A):-
    sum(L,S),
    len(L,X),
    A is S/X.