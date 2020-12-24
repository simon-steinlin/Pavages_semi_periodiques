function out = decomposeTrianglesS(in)


m = (in.Apex+in.a)/2;

s_1 = Square(in.Apex,[],[],m);

out = [s_1];


end