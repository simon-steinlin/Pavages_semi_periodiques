function out = decomposeTrianglesT(in)

m=(in.a+in.b)/2;

t_1 = RectTriangle([],m,in.b);
t_2 = RectTriangle([],in.a,m);

out = [t_1;t_2];


end