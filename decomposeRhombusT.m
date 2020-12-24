function out = decomposeRhombusT(in)


m = (in.Apex+in.Left)/2;
t_1 = RectTriangle(in.Left,m,[]);
t_2 = RectTriangle(t_1.b,[],in.Left);
t_3 = RectTriangle(t_2.Apex,[],in.Right);
t_4 = RectTriangle(t_3.b,[],t_3.Apex);
out = [t_1;t_2;t_3;t_4];

end