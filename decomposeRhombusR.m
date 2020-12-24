function out = decomposeRhombusR(in)


m=(in.Left+in.Apex)/2;
r_1 = Rhombus(in.Apex,m,[],[]);
r_2 = Rhombus(r_1.Top,[],in.Top,[]);
out = [r_1;r_2];

end