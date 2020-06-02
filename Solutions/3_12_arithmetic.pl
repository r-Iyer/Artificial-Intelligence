not(P):-P,!,false;true.
plus(0,Y,Y).
plus(s(X),Y,s(Z)):-
	plus(X,Y,Z).
mult(0,Y,0):-!.
mult(s(X),Y,Res):-
	mult(X,Y,Res1),
	plus(Res1,Y,Res).
sub(X,0,X).
sub(s(X),s(Y),Z):-
	sub(X,Y,Z).

div(_,0,0):-!.	
div(0,Y,0).
div(X,Y,s(Res)):-
	greater_than_equal(X,Y),
	sub(X,Y,Rem),
	div(Rem,Y,Res),!.
div(X,Y,Res):-
	div(0,_,Res).



rem(0,Y,0):-!.
rem(X,Y,Res):-
	greater_than_equal(X,Y),!,
	sub(X,Y,Rem),
	rem(Rem,Y,Res).
rem(X,Y,X).

sqroot(X,Res):-
	sqacc(X,Res,s(0)).
sqacc(X,Res,A):-
	mult(A,A,Y),
	less_than_equal(Y,X),
	sqacc(X,Res,s(A)),!.
sqacc(X,A,s(A)):-!.




greater_than(s(X),0):-!.
greater_than(s(X),s(Y)):-
	greater_than(X,Y).

greater_than_equal(X,0):-!.
greater_than_equal(s(X),s(Y)):-
	greater_than_equal(X,Y).

less_than(0,s(Y)):-!.
less_than(s(X),s(Y)):-
	less_than(X,Y).

less_than_equal(0,Y):-!.
less_than_equal(s(X),s(Y)):-
	less_than_equal(X,Y).