function out = decomposeBpTriangle(in)
%decomposeBpTriangle Decompose type B-prime triangle.
%
%   t = decomposeBpTriangle(in) decomposes a type B-prime triangle into a
%   type B-prime triangle, a type A-prime triangle, and a type B triangle.
%   The input is a one-row table as returned by bpTriangle, and the output
%   is a three-row table.

%   Copyright 2018 The MathWorks, Inc.

t_A = apTriangle(in.Left,[],in.Apex);
t_c = cTriangle([],t_A.Left,t_A.Right);
t_bp = bpTriangle(t_c.Apex,t_c.Right,[]);
t_b = bTriangle(t_c.Apex,[],t_c.Left);
t_a = aTriangle(t_c.Apex,t_bp.Right,[]);
t_ap = apTriangle([],t_a.Right,t_a.Left);
t_cp = cpTriangle([],in.Apex,t_A.Left);
t_cp2 = cpTriangle(t_cp.Apex,t_cp.Right,[]);
t_bp2 = bpTriangle(t_cp2.Right,in.Right,[]);

out = [t_c ; t_bp ; t_b; t_a; t_ap; t_cp; t_cp2; t_bp2];

end

