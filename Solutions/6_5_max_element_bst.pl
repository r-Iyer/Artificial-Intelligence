:-["6_4_is_binary_search_tree.pl"].
max(X,Tree):-
	is_bt(Tree),
	maxx(X,Tree).

maxx(X,bt(nil,X,nil)):-!.
maxx(X,bt(Left,Root,Right)):-
	maxx(X,Right).