function out = decomposepSquaresT(in)

m1 = (in.Apex+in.Right)/2;
m2 = (in.Apex+in.Left)/2;

r_p1 = pRectTriangle(in.Right,[],m1);
r_1 = RectTriangle(in.Left,[],m2);

out = [r_p1;r_1];


end