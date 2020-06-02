
postorder(Tree):-
	postorderr(Tree,L),write(L).

postorderr(nil,[]).
postorderr(bt(Left,Root,Right),L):-
	postorderr(Left,L1),
	postorderr(Right,L2),
	append(L2,[Root],L3),
	append(L1,L3,L).

