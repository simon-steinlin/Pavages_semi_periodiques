function out = decomposepRhombusT (in)

m = (in.Left+in.Top)/2;
t_p1 = pRectTriangle([],m,in.Left);
t_p2 = pRectTriangle(in.Left,[],t_p1.Apex);
t_p3 = pRectTriangle(t_p1.Apex,[],in.Right);
t_p4 = pRectTriangle(in.Right,[],t_p3.Apex);

out = [t_p1;t_p2;t_p3;t_p4];
end