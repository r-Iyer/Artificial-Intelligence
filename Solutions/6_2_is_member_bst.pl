is_member(X,bt(nil,X,nil)):-!.
is_member(X,bt(Left,X,Right)):-!.
is_member(X,bt(Left,Root,Right)):-
	X<Root,!,is_member(X,Left);
	is_member(X,Right).