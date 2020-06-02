double([X],[X|X]).
double([],[]).
double([Y|Rest],[Y|[Y|Rest1]]):-
    double(Rest,Rest1).