zahl(0).
zahl(succ(X)):- zahl(X).

/*
?- zahl(succ(succ(0))).
true

-> succ(succ(0)) => 2, dies ist wiederum eine Zahl, da zahl(0) eine Zahl ist (Fakt Zeile 1)
*/