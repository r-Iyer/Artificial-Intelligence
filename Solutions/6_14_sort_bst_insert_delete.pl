:-["6_10_insert_bst"].
:-["6_12_delete_from_bst"].
:-["6_8_inorder"].
treesort([],[]).
treesort(L,L1):-
	insert_acc(L,nil,T),
	delete_from_bst(T,L1).

delete_from_bst(nil,[]):-!.
delete_from_bst(Tree,[X|L]):-
	min(X,Tree),
	del(X,Tree,NewTree),
	delete_from_bst(NewTree,L).
insert_acc([],A,A).
insert_acc([X|L],A,T):-
	insert_bst(X,A,T1),
	insert_acc(L,T1,T).

min(X,Tree):-
	minn(X,Tree).

minn(_,nil).
minn(X,bt(nil,X,nil)):-!.
minn(X,bt(Left,Root,Right)):-
	minn(X,Left).