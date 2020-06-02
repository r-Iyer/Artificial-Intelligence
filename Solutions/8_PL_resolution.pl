:-["2_8_our_member"].
:-["2_9_subset"].
:-["2_11_union"].
%% "Format: solve([ [ clause 1 ] , [ clause 2 ], .... ], [ [ conclusion_clause 1 ], [ conclusion_clause 2 ] , .... ]."
%% "clause: not(p),q,not(r) "
%% "e.g. solve([[not(mg),not(bg)],[mg,mc],[not(mc),bcr]],[[not(bg),bcr]])."
%%"----------------Clause 1------Clause 2----Clause 3-----Concl Clause 1"
solve(Clauses,Conclusion):-
        negate(Conclusion,Negateconclusion),
        append(Clauses,Negateconclusion,Freshclauses),
        pl_resolution(Freshclauses),!;
        write("CANNOT BE SOLVED USING RESOLUTION REFUTATION AS WE DID NOT GET AN EMPTY CLAUSE"),false.

pl_resolution(Clauses) :-
        findall(Pair,get_pairs(2,Clauses,Pair),All_pairs),
        get_clauses(All_pairs,[],New),
        our_member([],New),
        write("Old Clauses: "),write(Clauses),nl,nl,
        write("New Generated clause : "),write(New),nl,nl,
        write("CAN BE SOLVED USING RESOLUTION REFUTATION AS WE CAN SEE EMPTY CLAUSE"),!;
        findall(Pair,get_pairs(2,Clauses,Pair),All_pairs),
        get_clauses(All_pairs,[],New),
        write("Old Clauses: "),write(Clauses),nl,nl,
        write("New Generated clause : "),write(New),nl,nl,
        not(subset(New,Clauses)),
        union(Clauses,New,Newclause),
        write("New appended clause: "),write(Newclause),nl,
        write("________________________________________________________"),nl,
        pl_resolution(Newclause).

%%EVALUATING ALL CLAUSES
get_clauses([],A,A):-!.
get_clauses([Pair|Restclauses],A,New):-
        pl_resolve(Pair,Resolvent),
        append(A,[Resolvent],New1),
        get_clauses(Restclauses,New1,New),!;
        get_clauses(Restclauses,A,New).

%RESOLVING CLAUSES
pl_resolve([Clause1,Clause2],Resolvent):-
        select(P,Clause1,Rest1),
        select(not(P),Clause2,Rest2),
        union(Rest1,Rest2,Resolvent);
        select(not(P),Clause1,Rest1),
        select(P,Clause2,Rest2),
        union(Rest1,Rest2,Resolvent).
               
%%ALL POSSIBLE PAIRS OF CLAUSES
get_pairs(0,_,[]).
get_pairs(N,[X|Clauses],[X|Pair]) :-
    N>0,
    N1 is N-1,
    get_pairs(N1,Clauses,Pair).
get_pairs(N,[_|Clauses],Pair) :-
    N>0,
    get_pairs(N,Clauses,Pair).

%%TO EVALUATE NEGATION OF CONCLUSION
negate(Clause,Freshclauses):-
        negate1(Clause,Freshclauses),!.
negate(Clause,[Freshclauses]):-
        negate2(Clause,Freshclauses).

%%TO CONVERT OR TO AND [[a,b]] --> [[not(a)][not(b)]]
negate1([[]],[]).
negate1([[not(P)|Restclauses]],Freshclauses):-
        negate1([Restclauses],Freshclauses1),!,
        append([[P]],Freshclauses1,Freshclauses).
negate1([[P|Restclauses]],Freshclauses):-
        negate1([Restclauses],Freshclauses1),!,
        append([[not(P)]],Freshclauses1,Freshclauses).

%%TO CONVERT AND TO OR [[a],[b]] --> [[not(a),not(b)]]
negate2([],[]).
negate2(Clauses,Freshclauses):-
        append([[not(P)]],Restclauses,Clauses),
        negate2(Restclauses,Freshclauses1),
        append([P],Freshclauses1,Freshclauses),!.
negate2(Clauses,Freshclauses):-
        append([[P]],Restclauses,Clauses),
        negate2(Restclauses,Freshclauses1),
        append([not(P)],Freshclauses1,Freshclauses),!.