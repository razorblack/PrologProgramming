birthday(1):-
    write('There should be atleast two people for finding probabilities.').
birthday(N):-
    N>1,
    write('The probability that two persons among '),
    write(N),
    write(' people have same birthday is: '),
    loop(N, 1.0, 1.0).

loop(1, probDiff, probSame):-
    ans = probSame - probDiff,
    write(ans).
loop(N, probDiff, probSame):-
    N>1,
    probDiff is (probDiff * ((365-N+1)/365)),
    loop(N-1, probDiff, probSame).

