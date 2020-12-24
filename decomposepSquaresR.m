function out = decomposepSquaresR(in)

m = (in.Top + in.Left)/2;
r_p1 = pRhombus(in.Apex,[],m,[]);
r_1 = Rhombus(in.Apex,[],[],r_p1.Right);

out = [r_p1;r_1];


end