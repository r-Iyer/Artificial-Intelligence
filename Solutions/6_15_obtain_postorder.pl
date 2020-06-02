postorder(_,[],[]):-!.

postorder([Root|Preorder],Inorder,Postorder):-
	inorder(Root,Inorder,L1,L2),
	len(L2,X1),
	append(PreorderNew1,PreorderNew2,Preorder),
	len(PreorderNew2,X2),
	X1=X2,
	postorder(PreorderNew1,L1,Postorder1),
	postorder(PreorderNew2,L2,Postorder2),	
	append(Postorder2,[Root],Postorder3),
	append(Postorder1,Postorder3,Postorder).


inorder(Root,Inorder,L1,L2):-
	append(L1,[Root|L2],Inorder).

len([],0).
len([H|T],X):-
	len(T,X1),
	X is X1 + 1.