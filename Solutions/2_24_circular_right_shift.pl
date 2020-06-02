right_shift([],[]).
right_shift([X],[X]):-!.
right_shift(L,L1):-
	len(L,Y),
	shift_right(L,L1,Y).
shift_right(L,L,1):-!.
shift_right(L,L1,Y):-
	Y1 is Y - 1,
	left_shift(L,L2),
	shift_right(L2,L1,Y1).