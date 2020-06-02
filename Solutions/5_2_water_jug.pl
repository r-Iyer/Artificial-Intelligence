water(2,Y,L,[]):-printall(L),write("halt"),nl,!.

water(X,Y,L,[pour_from_jug3_to_jug4_until_jug4_is_filled|Move]):-X>=0,X2 is X+Y,X2<7,Y1 is Y-(4-X),Y1>=0,Y1=<3,not_visited(4/Y1,L),add(4/Y1,L,L1),water(4,Y1,L1,Move).
water(X,Y,L,[pour_from_jug4_to_jug3_until_jug3_is_filled|Move]):-Y>=0,X2 is X+Y,X2<7,X1 is X-(3-Y),X1>=0,X1=<4,not_visited(X1/3,L),add(X1/3,L,L1),water(X1,3,L1,Move).

water(X,Y,L,[empty_jug4|Move]):-X>0,Y>=0,Y=<3,not_visited(0/Y,L),add(0/Y,L,L1),nl,water(0,Y,L1,Move).
water(X,Y,L,[empty_jug3|Move]):-Y>0,X>=0,X=<4,not_visited(X/0,L),add(X/0,L,L1),nl,water(X,0,L1,Move).

water(X,Y,L,[fill_jug4|Move]):-X>=0,Y>=0,Y=<3,not_visited(4/Y,L),add(4/Y,L,L1),water(4,Y,L1,Move).
water(X,Y,L,[fill_jug3|Move]):-Y>=0,X>=0,X=<4,not_visited(X/3,L),add(X/3,L,L1),water(X,3,L1,Move).

water(X,Y,L,[pour_entire_contents_of_jug3_to_jug4|Move]):-X<4,X>=0,Y>0,X1 is X+Y,X1=<4,not_visited(X1/0,L),add(X1/0,L,L1),water(X1,0,L1,Move).
water(X,Y,L,[pour_entire_contents_of_jug4_to_jug3|Move]):-Y<3,Y>=0,X>0,Y1 is X+Y,Y1=<3,not_visited(0/Y1,L),add(0/Y1,L,L1),water(0,Y1,L1,Move).

not_visited(X/Y,[]):-!.
not_visited(X/Y,[X/Y|Others]):-!,false.
not_visited(X/Y,[X1/Y1|Others]):-
        not_visited(X/Y,Others),!.
not_visited(X/Y,[X/Y1|Others]):-
        not_visited(X/Y,Others),!.
not_visited(X/Y,[X1/Y|Others]):-
        not_visited(X/Y,Others),!.

add(X/Y,L,[X/Y|L]).

printall([]).
printall([X/Y|L]):-
	printall(L),
	write("Jug 4 = "),write(X),write(" Jug 3 = "),write(Y),nl.
print2([X|Move]):-
	write(X),nl,print2(Move).

jug(X,Y):-
        water(X,Y,[0/0],Move),print2([initial_state(X,Y)|Move]).