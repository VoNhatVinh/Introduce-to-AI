pokemon(charmanderI, 1).
pokemon(charmanderII, 2).
pokemon(charmanderIII, 3).

specy(charmander, charmanderI).
specy(charmander, charmanderII).
specy(charmander, charmanderIII).

pokemon(bulbasaurI, 1).
pokemon(bulbasaurII, 2).
pokemon(bulbasaurIII, 3).
specy(bulbasaur, bulbasaurI).
specy(bulbasaur, bulbasaurII).
specy(bulbasaur, bulbasaurIII).

pokemon(charizardI, 1).
pokemon(charizardII, 2).
pokemon(charizardIII, 3).
specy(charizard, charizardI).
specy(charizard, charizardII).
specy(charizard, charizardIII).

pokemon(blastoiseI, 1).
pokemon(blastoiseII, 2).
pokemon(blastoiseIII, 3).
specy(blastoise, blastoiseI).
specy(blastoise, blastoiseII).
specy(blastoise, blastoiseIII).

pokemon(metapodI, 1).
pokemon(metapodII, 2).
pokemon(metapodIII, 3).
specy(metapod, metapodI).
specy(metapod, metapodII).
specy(metapod, metapodIII).

pokemon(pidgeyI, 1).
pokemon(pidgeyII, 2).
pokemon(pidgeyIII, 3).
specy(pidgey, pidgeyI).
specy(pidgey, pidgeyII).
specy(pidgey, pidgeyIII).

pokemon(raticateI, 1).
pokemon(raticateII, 2).
pokemon(raticateIII, 3).
specy(raticate, raticateI).
specy(raticate, raticateII).
specy(raticate, raticateIII).

pokemon(nidokingI, 1).
pokemon(nidokingII, 2).
pokemon(nidokingIII, 3).
specy(nidoking, nidokingI).
specy(nidoking, nidokingII).
specy(nidoking, nidokingIII).

pokemon(ninetalesI, 1).
pokemon(ninetalesII, 2).
pokemon(ninetalesIII, 3).
specy(ninetales, ninetalesI).
specy(ninetales, ninetalesII).
specy(ninetales, ninetalesIII).

water(charizardI).
water(charizardII).
water(charizardIII).
water(nidokingI).
water(nidokingII).
water(nidokingIII).
water(ninetalesI).
water(ninetalesII).
water(ninetalesIII).
fire(charmanderI).
fire(charmanderII).
fire(charmanderIII).
fire(pidgeyI).
fire(pidgeyII).
fire(pidgeyIII).
fire(raticateI).
fire(raticateII).
fire(raticateIII).
leaf(bulbasaurI).
leaf(bulbasaurII).
leaf(bulbasaurIII).
leaf(blastoiseI).
leaf(blastoiseII).
leaf(blastoiseIII).
leaf(metapodI).
leaf(metapodII).
leaf(metapodIII).

trainer(takeshi).
trainer(chaien).
trainer(naruto).
trainer(doraemon).

own(takeshi, charizardI).
own(takeshi, charmanderII).
own(takeshi, metapodII).
own(chaien, nidokingIII).
own(chaien, pidgeyI).
own(naruto, bulbasaurII).
own(doraemon, blastoiseIII).

evolution(P2, P1):-
    specy(S, P2),
    specy(S, P1),
    pokemon(P2, L2),
    pokemon(P1, L1),
    L2 > L1.

same_gen(P1, P2):-
    water(P1),
    water(P2),
    not(P1 = P2).
same_gen(P1, P2):-
    fire(P1),
    fire(P2),
    not(P1 = P2).
same_gen(P1, P2):-
    leaf(P1),
    leaf(P2),
    not(P1 = P2).
win(P1, P2):-
    pokemon(P1, L1),
    pokemon(P2, L2),
    L1 > L2.
win(P1, P2):-
    pokemon(P1, L1),
    pokemon(P2, L2),
    L1 = L2,
    water(P1),
    fire(P2).
win(P1, P2):-
    pokemon(P1, L1),
    pokemon(P2, L2),
    L1 = L2,
    fire(P1),
    leaf(P2).
win(P1, P2):-
    pokemon(P1, L1),
    pokemon(P2, L2),
    L1 = L2,
    leaf(P1),
    water(P2).
can_recruit(H, P):-
    pokemon(P, L),
    not(own(H1, P)).
is_adult(P):-
    pokemon(P, L),
    L = 3.
