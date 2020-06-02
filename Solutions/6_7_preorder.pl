preorder(Tree):-
	preorderr(Tree,L),write(L).
preorderr(nil,[]).
preorderr(bt(Left,Root,Right),L):-
	preorderr(Left,L1),
	preorderr(Right,L2),
	append([Root|L1],L2,L).

