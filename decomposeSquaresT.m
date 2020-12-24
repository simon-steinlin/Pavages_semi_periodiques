function out = decomposeSquaresT(in)

m1 = (in.Apex+in.Left)/2;
m2 = (in.Apex+in.Right)/2;

t_p1 = pRectTriangle(in.Right,m2,[]);
t_1 = RectTriangle(in.Left,m1,[]);

out = [t_1;t_p1];

end