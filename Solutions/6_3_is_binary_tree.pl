is_bt(nil):-!.
is_bt(bt(nil,Root,nil)):-!.
is_bt(bt(Left,Root,Right)):-
	not(is_bt(Root)),
	is_bt(Left),
	is_bt(Right).
not(P):-P,!,false;true.