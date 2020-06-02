hanoi(1,Left,Right,Middle):-
	write("Move disk 1 "),
	write(" from rod "),
	write(Left),write(" to "),
	write(Right),nl,!.
hanoi(N,Left,Right,Middle):-
	N1 is N - 1,
	hanoi(N1,Left,Middle,Right),
	write("Move disk "),
	write(N),
	write(" from rod "),
	write(Left),write(" to "),
	write(Right),nl,
	hanoi(N1,Middle,Right,Left).
