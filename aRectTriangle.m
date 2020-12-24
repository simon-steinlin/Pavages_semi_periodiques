function t = aRectTriangle(Apex,a,b)
%%% Crée un tableau contenant les 3 sommets d'un triangle rectangle avec
%%% un facteur enre 2 entre les deux côtés de l'angle droit. Les
%%% coordonnées sont en complexe. Les trois sommets sont nommées Apex, a et
%%% b.

[Apex,a,b] = rectTriangle1(Apex,a,b,2); 
Type = categorical("A");
t = table(Apex,a,b,Type);

end