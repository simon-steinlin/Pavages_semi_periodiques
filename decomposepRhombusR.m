function out = decomposepRhombusR(in)

m=(in.Left+in.Apex)/2;
r_p1 = pRhombus(in.Apex,m,[],[]);
r_p2 = pRhombus(r_p1.Top,[],in.Top,[]);
out = [r_p1;r_p2];

end