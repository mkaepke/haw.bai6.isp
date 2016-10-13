%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fakten
maennlich(karl).
maennlich(peter).
maennlich(klaus).
maennlich(johannes).
maennlich(paul).
weiblich(irmgrad).
weiblich(christina).
weiblich(levke).
weiblich(marlen).
weiblich(anna).
weiblich(helen).
weiblich(june).
weiblich(elfie).

verheiratet(karl,irmgrad).
verheiratet(peter,christina).
verheiratet(johannes,levke).
verheiratet(paul,june).

kind(peter,karl,irmgrad). % kind(X,Y,Z) => X ist Kind von Y und Z
kind(klaus,karl,irmgrad).
kind(johannes,peter,christina).
kind(marlen,peter,christina).
kind(helen,johannes,levke).
kind(anna,paul,marlen).
kind(elfie,paul,june).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Regeln
bruder(X,Y) :- maennlich(X), kind(X,V,M), kind(Y,V,M), X \== Y. % X ist Bruder von Y
schwester(X,Y) :- weiblich(X), kind(X,V,M), kind(Y,V,M), X \== Y.

mutter(X,Y) :- weiblich(X), kind(Y,_,X). % X ist Mutter von Y
vater(X,Y) :- maennlich(X), kind(Y,X,_). % X ist Vater von Y

onkel(X,Y) :- maennlich(X), kind(Y,V,M), (bruder(V,X); bruder(X,M)). % X ist direkter Onkel von Y
tante(X,Y) :- weiblich(X), kind(Y,V,M), (schwester(X,V); schwester(M,X)). % X ist direkte Tante von Y

neffe(X,Y) :- maennlich(X), (onkel(Y,X); tante(Y,X)). % X ist Neffe von Y
nichte(X,Y) :- weiblich(X), (onkel(Y,X); tante(Y,X)). % X ist Nichte von Y

stiefmutter(X,Y) :-  \+(mutter(X,Y)), vater(V,Y), verheiratet(V,X). % X ist Stiefmutter von Y
% wenn \+ (entspricht not) vorne steht (+ Anfrage enthaelt Variable), evaluiert Prolog immer zu false  