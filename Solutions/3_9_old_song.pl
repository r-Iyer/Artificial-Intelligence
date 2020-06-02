old_song(0):-
	write("No bottle of coke on the wall"),!.
old_song(1):-
	write("1 bottle of coke on the wall"),nl,
	write("1 bottle of coke"),nl,
	write("You take one down and pass it around"),nl,old_song(0),!.
old_song(N):-
	N1 is N-1,
	write(N),
	write(" bottles of coke on the wall "),nl,
	write(N),
	write(" bottles of coke"),nl,
	write("You take one down and pass it around"),nl,
	old_song(N1).
