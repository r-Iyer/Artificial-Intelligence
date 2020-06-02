our_member(X,[X|_]).
our_member(X,[_|Rest]):-
    our_member(X,Rest).

add_element(X,[],[X]).
add_element(X,L,L):-our_member(X,L),!.
add_element(X,L,[X|L]).