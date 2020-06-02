production(right,[x______________________x],0,0,3,3,L):-!.

production(left,[move_left_bank_to_right_bank(X,Y,X1,Y1,"-->",X2,Y2,X3,Y3)|Rest],X,Y,X1,Y1,L):-
	permutations(X,Y,X1,Y1,X2,Y2,X3,Y3),
	check(X2,Y2,X3,Y3),
	not_visited(right/X2/Y2/X3/Y3,L),
	add(right/X2/Y2/X3/Y3,L,L1),
	production(right,Rest,X2,Y2,X3,Y3,L1).

production(right,[move_right_bank_to_left_bank(X,Y,X1,Y1,"-->",X2,Y2,X3,Y3)|Rest],X,Y,X1,Y1,L):-
	permutations2(X,Y,X1,Y1,X2,Y2,X3,Y3),
	check(X2,Y2,X3,Y3),
	not_visited(left/X2/Y2/X3/Y3,L),
	add(left/X2/Y2/X3/Y3,L,L1),
	production(left,Rest,X2,Y2,X3,Y3,L1).


permutations(X,Y,X1,Y1,X2,Y2,X3,Y3):-
	X2 is X-1,Y2 is Y-1,X3 is X1+1,Y3 is Y1+1;
	X2 is X-2,Y2 is Y,X3 is X1+2,Y3 is Y1;
	X2 is X,Y2 is Y-2,X3 is X1, Y3 is Y1+2;
	X2 is X-1,Y2 is Y,X3 is X1+1, Y3 is Y1;
	X2 is X,Y2 is Y-1,X3 is X1, Y3 is Y1+1.

permutations2(X,Y,X1,Y1,X2,Y2,X3,Y3):-
	X2 is X+1,Y2 is Y+1,X3 is X1-1,Y3 is Y1-1;
	X2 is X+2,Y2 is Y,X3 is X1-2,Y3 is Y1;
	X2 is X,Y2 is Y+2,X3 is X1, Y3 is Y1-2;
	X2 is X+1,Y2 is Y,X3 is X1-1, Y3 is Y1;
	X2 is X,Y2 is Y+1,X3 is X1, Y3 is Y1-1.

add(A/B/C/D/E,L,[A/B/C/D/E|L]).


not_visited(A/B/C/D/E,[]):-!.
not_visited(A/B/C/D/E,[A/B/C/D/E|Others]):-!,false.
	not_visited(A/B/C/D/E,[_/_/_/_/_|Others]):-
	not_visited(A/B/C/D/E,Others).

problem(Boat,X,Y,X1,Y1):-
	production(Boat,Move,X,Y,X1,Y1,[Boat/X/Y/X1/Y1]),print2(Move).

print2([X|Move]):-
	write(X),nl,print2(Move).

check(X,Y,X1,Y1):-
	X>=Y,X1>=Y1,Y>=0,Y1>=0,!;
	X=0,X1>=Y1,Y>=0,Y1>=0,!;
	X>=Y,X1=0,Y>=0,Y1>=0.