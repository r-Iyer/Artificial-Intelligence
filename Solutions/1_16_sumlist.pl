sum([],0).
sum([X|Rest],S):-
    sum(Rest,Sr),
    S is Sr+X.