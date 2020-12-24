function out = decomposeCTriangle(in)

r = 1/(1+2*cos(pi/7));
a = in.Left ; b = in.Right; c = in.Apex;
ap = a; bp = a+(b-a)*r; cp = a+(c-a)*r;

t_c = cTriangle(cp,ap,bp);
t_c2 = cTriangle(t_c.Apex,t_c.Right,[]);
t_cp = cpTriangle([],t_c2.Right,t_c2.Left);
t_A = aTriangle(in.Apex,t_c2.Left,[]);
t_a = aTriangle(t_A.Left,t_A.Right,[]);
t_b = bTriangle(t_c2.Right,t_A.Apex,[]);
t_bp = bpTriangle(t_b.Apex,t_a.Right,[]);
t_cp2 = cpTriangle([],t_a.Left,in.Right);
t_cp3 = cpTriangle(t_cp2.Apex,[],t_cp2.Left);
t_bp2 = bpTriangle(t_cp3.Left,t_cp3.Apex,[]);

out = [t_c;t_c2;t_cp;t_a;t_b;t_bp;t_cp2;t_cp3;t_bp2];

