function [out]=decomposeCpTriangle(in)

r = 1/(1+2*cos(pi/7));
a = in.Left ; b = in.Right; c = in.Apex;
ap = a; bp = a+(b-a)*r; cp = a+(c-a)*r;

t_cp = cpTriangle(cp,ap,bp);
t_cp2 = cpTriangle(t_cp.Apex,t_cp.Right,[]);
t_c = cTriangle([],t_cp2.Right,t_cp2.Left);
t_Ap = apTriangle(in.Apex,t_cp2.Left,[]);
t_ap = apTriangle(t_Ap.Left,t_Ap.Right,[]);
t_bp = bpTriangle(t_cp2.Right,t_Ap.Apex,[]);
t_b = bTriangle(t_bp.Apex,t_ap.Right,[]);
t_c2 = cTriangle([],t_ap.Left,in.Right);
t_c3 = cTriangle(t_c2.Apex,[],t_c2.Left);
t_b2 = bTriangle(t_c3.Left,t_c3.Apex,[]);

out = [t_cp;t_cp2;t_c;t_ap;t_bp;t_b;t_c2;t_c3;t_b2];

end
