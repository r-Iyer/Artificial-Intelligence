height(nil,0).
height(bt(nil,X,nil),1):-!	.
height(bt(Left,Root,Right),X4):-
	height(Left,X1),
	height(Right,X2),
	max(X1,X2,X3),
	X4 is X3 + 1.
max(X1,X2,X1):-
	X1>X2,!.
max(X1,X2,X2).




