can_get(state(_,_,_,has),[],L):-!.
can_get(Oldstate,[Move|Rest],L):-
	move(Oldstate,Move,Newstate,L,L1),
	can_get(Newstate,Rest,L1).

move(state(middle,on_box,middle,has_not),grasp,state(middle,on_box,middle,has),L,L1):-not_visited(state(middle,on_box,middle,has),L),add(state(middle,on_box,middle,has),L,L1).

move(state(P,on_floor,P,H),climb,state(P,on_box,P,H),L,L1):-not_visited(state(P,on_box,P,H),L),add(state(P,on_box,P,H),L,L1).

move(state(P1,on_floor,P1,H),push(P1,P2),state(P2,on_floor,P2,H),L,L1):-push1(P1,P2),not_visited(state(P2,on_floor,P2,H),L),add(state(P2,on_floor,P2,H),L,L1).

move(state(P1,on_floor,P,H),walk(P1,P2),state(P2,on_floor,P,H),L,L1):-walk1(P1,P2),not_visited(state(P2,on_floor,P,H),L),add(state(P2,on_floor,P,H),L,L1).


not_visited(state(_,_,_,_),[]):-!.
not_visited(state(X,Y,Z,W),[state(X,Y,Z,W)|L]):-!,false.
not_visited(state(X,Y,Z,W),[state(_,_,_,_)|L]):-
	not_visited(state(X,Y,Z,W),L).
add(state(X,Y,Z,W),L,[state(X,Y,Z,W)|L]).

push1(P1,at_window).
push1(P1,middle).
push1(P1,at_door).

walk1(P1,at_window).
walk1(P1,middle).
walk1(P1,at_door).

printall([]).
printall([X|L]):-
	printall(L),
	write(X),nl.