inorder(Tree,L):-
	inorderr(Tree,L).
inorderr(nil,[]).
inorderr(bt(Left,Root,Right),L):-
	inorderr(Left,L1),
	inorderr(Right,L2),
	append(L1,[Root|L2],L).

