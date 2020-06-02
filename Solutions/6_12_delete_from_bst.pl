del(X,bt(nil,X,nil),nil):-!.
del(X,bt(Left,X,nil),Left):-!.
del(X,bt(nil,X,Right),Right):-!.
del(X,bt(Left,X,Right),bt(Left1,Y,Right1)):-
	del_min(Right,Y,Right1),!.
del(X,bt(Left,Root,Right),bt(Left1,Root,Right)):-
	X=<Root,!,
	del(X,Left,Left1).
del(X,bt(Left,Root,Right),bt(Left,Root,Right1)):-
	del(X,Right,Right1).

del_min(bt(nil,Y,Right),Y,Right):-!.
del_min(bt(Left,Root,Right),Y,bt(Left1,Root,Right)):-
	del_min(Left,Y,Left1).
