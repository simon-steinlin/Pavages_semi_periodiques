function out = decomposeApRectTriangle(in)
%%% idem que decomposeARectTriangle mais pour les triangles de type Ap
A = (in.Apex+in.a)/2;
t_a1 = aRectTriangle([],A,in.Apex);
t_ap1 = apRectTriangle(t_a1.Apex,t_a1.a,[]);
t_ap2 = apRectTriangle([],t_ap1.b,t_ap1.a);
t_a2 = aRectTriangle(t_ap2.Apex,[],t_ap2.b);
t_a3 = aRectTriangle([],in.Apex,in.b);

out=[t_a1;t_ap1;t_ap2;t_a2;t_a3];


end