reverse_list([],[]).
reverse_list([H|T],L):-
	reverse_list(T,Z),
	append1(Z,[H],L).