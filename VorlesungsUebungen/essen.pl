% Seite 57
%person(frank).
%person(anna).
%person(kurt).

itali(pizza).
itali(spaghetti).
indi(dahl).
indi(curry).
mild(dahl).
scharf(curry).
isst_gern(anna,hamburger).
isst_gern(kurt,pizza).

isst_gern(frank,Y) :- itali(Y).
isst_gern(frank,Y) :- indi(Y), mild(Y).
isst_gern(anna,Y) :- indi(Y).
isst_gern(kurt,Y) :- isst_gern(anna,Y).

/* Anfragen
isst_gern(X,pizza).
isst_gern(X,dahl).
isst_gern(X,pizza),isst_gern(X,hamburger).
*/
