/*
Was ergibt 2 + 1?
?- add(succ(succ(0)),succ(0),Y). 
Y = succ(succ(succ(0))).

Was ergibt X + 1 = 2?
?- add(X,succ(0),succ(succ(0))). 
X = succ(0)
*/

add(0,Y,Y). % Abbruch, da 0 + Y = Y ergibt true
/*
?- add(0,succ(0),succ(0)).
true

?- add(0,succ(0),succ(succ(0))).
false
*/

add(succ(X),Y,succ(Z)) :- add(X,Y,Z).


/*
Beispiel mit interner Unifikation
?- add(succ(succ(0)),0, succ(succ(0))).
=> Aufruf von add(X,Y,Z)
[add(succ(succ(0)),0, succ(succ(0))) = add(succ(X),Y,succ(Z))] -> Unifikation
| succ(X) = succ(succ(0)) => X = succ(0) 
| Y = 0
| succ(Z) = succ(succ(0)) => Z = succ(0)
=> Aufruf von add(X,Y,Z)
[add(succ(0),0, succ(0)) = add(succ(X),Y,succ(Z))] -> Unifikation
| succ(X) = succ(0) => X = 0 
| Y = 0
| succ(Z) = succ(0) => Z = 0
=> Aufruf von add(0,Y,Y)
| true
*/