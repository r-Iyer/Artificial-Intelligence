last1(X,[X]).
last1(X,[Y|Rest]):-
    last1(X,Rest).