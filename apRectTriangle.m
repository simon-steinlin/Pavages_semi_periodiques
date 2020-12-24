function t = apRectTriangle(Apex,a,b)
%%% Crée un tableau contenant les 3 sommets d'un triangle rectangle avec
%%% un facteur enre 2 entre les deux côtés de l'angle droit. Les
%%% coordonnées sont en complexe. Les trois sommets sont nommées Apex, a et
%%% b. Cette fonction est pareille que l'autre sauf qu'elle utilise
%%% rectTriangle2.

[Apex,a,b] = rectTriangle2(Apex,a,b,2); 
Type = categorical("Ap");
t = table(Apex,a,b,Type);

end