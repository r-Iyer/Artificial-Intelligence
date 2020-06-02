:-["6_10_insert_bst"].
:-["6_8_inorder"].
treesort([],[]).
treesort(L,L1):-
	insert_acc(L,nil,T),
	inorder(T,L1).
insert_acc([],A,A).
insert_acc([X|L],A,T):-
	insert_bst(X,A,T1),
	insert_acc(L,T1,T).