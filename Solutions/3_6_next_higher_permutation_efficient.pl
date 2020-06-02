:-[append].
:-[length1].
:-["3_5_reverse_using_acc"].
not(P):-P,!,false;true.
next_higher_permutation(L,L7):-
	append1(L1,[A|[B|L2]],L),
	A<B,
	not(next_higher_permutation([B|L2],_)),!,
	greater_than([B|L2],A,U,L3,L4),
	append1(L3,[A|L4],L5),
	rev(L5,L6),
	append1(L1,[U|L6],L7),!.
greater_than(L,Y,U,L1,L2):-
	append1(L1,[U|L2],L),
	U>Y,
	not(greater_than(L2,Y,U1,_,_)).

