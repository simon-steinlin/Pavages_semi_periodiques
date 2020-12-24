function out = decomposeSquaresR(in)

m = (in.Left+in.Top)/2;
r_1 = Rhombus(in.Apex,[],m,[]);
r_p1 = pRhombus(in.Apex,[],[],r_1.Right);


out = [r_1;r_p1];

end