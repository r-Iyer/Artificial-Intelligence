:-[append].
:-["2_5_has_duplicate"].
our_member(X,L):-
/*	not(duplicate(L)),*/
	append(_,[X|_],L).
not(P):-P,!,false;true.