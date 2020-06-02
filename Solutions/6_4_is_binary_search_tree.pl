is_bt(nil):-!.
is_bt(bt(nil,Root,nil)):-!.
is_bt(bt(Left,Root,Right)):-
	check(Left,Root,Right),
	is_bt(Left),
	is_bt(Right).


check(bt(nil,Root,bt(Left2,Right_val,Right2)):-
		Right_val>=Root,!.
check(bt(Left1,Left_val,Right1),Root,nil):-
		Left_val=<Root,!.
check(bt(Left1,Left_val,Right1),Root,bt(Left2,Right_val,Right2)):-
		Left_val=<Root,
		Right_val>=Root.