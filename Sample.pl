studies(aryan, datastructure).
studies(avinash, datastructure).
studies(ashutosh, dstl).
studies(abhishek, coa).

teaches(dubey, datastructure).
teaches(govind, dstl).
teaches(rizwan, coa).
teaches(rizwan, os).

professor(X, Y) :-
    teaches(X, C),
    studies(Y, C).
