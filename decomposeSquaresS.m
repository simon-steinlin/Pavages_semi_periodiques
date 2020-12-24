function out = decomposeSquaresS(in)

m = (in.Top+in.Apex)/2;

s = Square(m,[],in.Top,[]);

out = [s];

end