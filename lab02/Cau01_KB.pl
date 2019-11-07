% -------------------------------------------Facts-----------------------------------------------------
female('Queen Elizabeth II').
male('Prince Phillip').
married('Prince Phillip', 'Queen Elizabeth II').
married('Queen Elizabeth II', 'Prince Phillip').

%Facts: 1st
male('Prince Charles').
female('Princess Diana').
female('Camilla Parker Bowles').
parent('Queen Elizabeth II', 'Prince Charles').
parent('Prince Phillip', 'Prince Charles').
divorced('Prince Charles', 'Princess Diana').
divorced('Princess Diana', 'Prince Charles').
married('Prince Charles', 'Camilla Parker Bowles').
married('Camilla Parker Bowles', 'Prince Charles').

%Facts: 12st
female('Princess Anne').
male('Captain Mark Phillips').
male('Timothy Laurence').
parent('Queen Elizabeth II', 'Princess Anne').
parent('Prince Phillip', 'Princess Anne').
divorced('Princess Anne', 'Captain Mark Phillips').
divorced('Captain Mark Phillips', 'Princess Anne').
married('Princess Anne', 'Timothy Laurence').
married('Timothy Laurence', 'Princess Anne').

%Facts: 6th
male('Prince Andrew').
female('Sarah Ferguson').
divorced('Prince Andrew', 'Sarah Ferguson').
divorced('Sarah Ferguson', 'Prince Andrew').
parent('Queen Elizabeth II', 'Prince Andrew').
parent('Prince Phillip', 'Prince Andrew').

%Facts: 9th
male('Prince Edward').
female('Sophie Rhys-jones').
married('Prince Edward', 'Sophie Rhys-jones').
married('Sophie Rhys-jones', 'Prince Edward').
parent('Queen Elizabeth II', 'Prince Edward').
parent('Prince Phillip', 'Prince Edward').

%Facts: 2nd
male('Prince William').
female('Kate Middleton').
parent('Princess Diana', 'Prince William').
parent('Prince Charles', 'Prince William').
married('Prince William', 'Kate Middleton').
married('Kate Middleton', 'Prince William').

%Facts: 5th
male('Prince Harry').
parent('Princess Diana', 'Prince Harry').
parent('Prince Charles', 'Prince Harry').

%Facts: 13th
male('Peter Phillips').
female('Autumn Kelly').
parent('Princess Anne', 'Peter Phillips').
parent('Prince Mark Phillips', 'Peter Phillips').
married('Peter Phillips','Autumn Kelly').
married('Autumn Kelly','Peter Phillips').

%Facts: 16th
female('Zara Phillips').
male('Mike Tindall').
parent('Princess Anne', 'Zara Phillips').
parent('Prince Mark Phillips', 'Zara Phillips').
married('Zara Phillips', 'Mike Tindall').
married('Mike Tindall', 'Zara Phillips').

%Facts: 7th
female('Princess Beatrice').
parent('Prince Andrew', 'Princess Beatrice').
parent('Sarah Ferguson', 'Princess Beatrice').

%Facts: 8th
female('Princess Eugenie').
parent('Prince Andrew', 'Princess Eugenie').
parent('Sarah Ferguson', 'Princess Eugenie').

%Facts: 10th
male('James, Viscount Severn').
parent('Prince Edward', 'James, Viscount Severn').
parent('Sophie Rhys-jones', 'James, Viscount Severn').

%Facts: 11th
female('Lady Louise Mountbatten-Windsor').
parent('Prince Edward', 'Lady Louise Mountbatten-Windsor').
parent('Sophie Rhys-jones', 'Lady Louise Mountbatten-Windsor').

%Facts: 3rd
male('Prince George').
parent('Prince William', 'Prince George').
parent('Kate Middleton', 'Prince George').

%Facts: 4th
female('Princess Charlotte').
parent('Prince William', 'Princess Charlotte').
parent('Kate Middleton', 'Princess Charlotte').

%Facts: 14th
female('Savannah Phillips').
parent('Peter Phillips', 'Savannah Phillips').
parent('Autumn Kelly', 'Savannah Phillips').

%Facts: 15th
female('Isla Phillips').
parent('Peter Phillips', 'Isla Phillips').
parent('Autumn Kelly', 'Isla Phillips').

%Facts: 17th
male('Mia Grace Tindall').
parent('Zara Phillips', 'Mia Grace Tindall').
parent('Mike Tindall', 'Mia Grace Tindall').

% ---------------------------------------------Rules---------------------------------------
husband(Person, Wife):-
    married(Person, Wife),
    male(Person),
    female(Wife).

wife(Person, Husband):-
    married(Person, Husband),
    female(Person),
    male(Husband).

father(Parent, Child):-
    parent(Parent, Child),
    male(Parent).

mother(Parent, Child):-
    parent(Parent, Child),
    female(Parent).

child(Child, Parent):-
    parent(Parent, Child).

son(Child, Parent):-
    child(Child, Parent),
    male(Child).

daughter(Child, Parent):-
    child(Child, Parent),
    female(Child).

grandparent(GP, GC):-
    parent(GP, P),
    parent(P, GC).

grandmother(GM, GC):-
    grandparent(GM, GC),
    female(GM).

grandfather(GF, GC):-
    grandparent(GF, GC),
    male(GF).

grandchild(GC, GP):-
    grandparent(GP, GC).

grandson(GS, GP):-
    grandchild(GS, GP),
    male(GS).

granddaughter(GD, GP):-
    grandchild(GD, GP),
    female(GS).

sibling(Person1, Person2):-
    parent(P, Person1),
    parent(P, Person2), 
	not(Person1==Person2).

brother(Person, Sibling):-
    sibling(Person, Sibling),
    male(Person).

sister(Person, Sibling):-
    sibling(Person, Sibling),
    female(Person).
	
aunt(Person, NieceNephew):-  
	parent(X, NieceNephew),
	sister(Person, X).
	
uncle(Person, NieceNephew):-
	parent(X, NieceNephew),
	brother(Person, X).
	
niece_or_nephew(Person, AuntUncle):-
	parent(X, Person),
	sibling(X, AuntUncle).

niece(Person, AuntUncle):-
    female(Person),
	niece_or_nephew(Person, AuntUncle). 

nephew(Person, AuntUncle):-
    male(Person),
	niece_or_nephew(Person, AuntUncle). 