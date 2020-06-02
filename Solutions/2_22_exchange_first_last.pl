exchange([],[]).
exchange([X],[X]):-!.
exchange(L,L1):-
	append1([First|Mid],[Last],L),!,
	append1([Last|Mid],[First],L1).