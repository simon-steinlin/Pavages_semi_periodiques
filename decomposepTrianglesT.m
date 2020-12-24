function out = decomposepTrianglesT(in)

m = (in.a+in.b)/2;

t_p1 = pRectTriangle([],in.a,m);
t_p2 = pRectTriangle([],m,in.b);

out = [t_p1;t_p2];


end