insert_bst(X,nil,bt(nil,X,nil)):-!.
insert_bst(X,bt(Left,Root,Right),bt(Left1,Root,Right)):-
	X<Root,!,
	insert_bst(X,Left,Left1).
insert_bst(X,bt(Left,Root,Right),bt(Left,Root,Right1)):-
	!,
	insert_bst(X,Right,Right1).
