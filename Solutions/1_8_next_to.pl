next_to(X,Y,[X|[Y|Rest]]):-!.
next_to(X,Y,[H|Rest]):-
    next_to(X,Y,Rest).