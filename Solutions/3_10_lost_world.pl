template([anun,chatun,khatun,motun],[sana,tanana,kana,tana],[karu,maru,saru,laru],[kunuri,manuri,mayuri,kaveri],[bimbo,kimbo,rambo,sambo],
	[sonen,ronen,guten,morgen],[sitcom,romcom,latcom,rcom],[kama,mama,lama,gamma],[mote,sote,lote,tote]).
verse(0,A,B,C,D,E,F,G,H,I):-!.
verse(N,A,B,C,D,E,F,G,H,I):-
	random(0,4,X),loc(A,X,A1),loc(B,X,B1),loc(C,X,C1),loc(D,X,D1),loc(E,X,E1),loc(F,X,F1),loc(G,X,G1),loc(H,X,H1),loc(I,X,I1),
	random(0,4,X1),loc(B,X1,B2),loc(E,X1,E2),loc(C,X1,C2),loc(I,X1,I2),loc(F,X1,F2),
	random(0,4,X2),loc(C,X2,C3),
	write(A1),write(" "),
	write(B1),write(" "),
	write(B2),write(" "),
	write(C1),nl,
	write(D1),write(" "),
	write(E1),write(" "),
	write(E2),write(" "),
	write(C2),nl,
	write(F1),write(" "),
	write(F2),write(" "),
	write(G1),nl,
	write(H1),write(" "),
	write(I1),write(" "),
	write(I2),write(" "),
	write(C3),nl,nl,nl,
	N1 is N - 1,
	verse(N1,A,B,C,D,E,F,G,H,I).
loc([A|L],0,A):-!.
loc([A|L],X,A1):-
	X1 is X - 1,
	loc(L,X1,A1).
