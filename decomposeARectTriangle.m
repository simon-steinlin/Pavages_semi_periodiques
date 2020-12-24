function out = decomposeARectTriangle(in)
%%% prend en argument un tableau composé de triangles rectangles de type A
%%% et renvoie un tableau contenant tous les triangles de leur
%%% décomposition.
A = (in.Apex+in.a)/2;   % On a besoin d'un premier point pour tracer un triangle
t_ap1 = apRectTriangle([],A,in.Apex);   % On peut tracer les autres en se basant sur les autres triangles
t_a1 = aRectTriangle(t_ap1.Apex,t_ap1.a,[]);
t_ap2 = apRectTriangle(t_a1.b,in.Apex,[]);
t_a2 = aRectTriangle([],t_a1.b,t_a1.a);
t_ap3 = apRectTriangle(t_a2.Apex,in.a,[]);

out=[t_ap1;t_a1;t_ap2;t_a2;t_ap3];


end