preorder(_,[],[]):-!.

preorder(Postorder,Inorder,Preorder):-
	append(PostorderNew,[Root],Postorder),
	inorder(Root,Inorder,L1,L2),
	len(L1,X1),
	append(PostorderNew1,PostorderNew2,PostorderNew),
	len(PostorderNew1,X2),
	X1=X2,
	preorder(PostorderNew1,L1,Preorder1),
	preorder(PostorderNew2,L2,Preorder2),	
	append([Root|Preorder1],Preorder2,Preorder).


inorder(Root,Inorder,L1,L2):-
	append(L1,[Root|L2],Inorder).

len([],0).
len([H|T],X):-
	len(T,X1),
	X is X1 + 1.