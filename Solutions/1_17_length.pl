len([],0).
len([X|Rest],L):-
    len(Rest,Lr),
    L is Lr+1.