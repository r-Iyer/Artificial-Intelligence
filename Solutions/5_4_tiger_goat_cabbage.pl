production([[f/g/w/c],[]],L):-add([[w/c],[f/g]],L,L1),production([[w/c],[f/g]],L1).
production([[w/c],[f/g]],L):-add([[f/w/c],[g]],L,L1),production([[f/w/c],[g]],L1).
production([[f/w/c],[g]],L):-add([[c],[f/w/g]],L,L1),production([[c],[f/w/g]],L1).
production([[c],[f/w/g]],L):-add([[f/g/c],[w]],L,L1),production([[f/g/c],[w]],L1).
production([[f/g/c],[w]],L):-add([[g],[f/w/c]],L,L1),production([[g],[f/w/c]],L1).
production([[g],[f/w/c]],L):-add([[f/g],[w/c]],L,L1),production([[f/g],[w/c]],L1).
production([[f/g],[w/c]],L):-add([[],[f/g/w/c]],L,L1),production([[],[f/g/w/c]],L1).
production([[f/w/c],[g]],L):-add([[w],[f/g/c]],L,L1),production([[w],[f/g/c]],L1).
production([[w],[f/g/c]],L):-add([[f/g/w],[c]],L,L1),production([[f/g/w],[c]],L1).
production([[f/g/w],[c]],L):-add([[g],[f/w/c]],L,L1),production([[g],[f/w/c]],L1).
production([[],[f/g/w/c]],L):-printall(L),!.

add(L1,L,L2):-
	append([L1],L,L2).
printall([]).
printall([[X,Y]|L]):-
	printall(L),
	write("Left Bank "),write(X),write(" Right Bank "),write(Y),nl.



problem([[X/Y/Z/W],[]]):-
	production([[f/g/w/c],[]],[[[f/g/w/c],[]]]).