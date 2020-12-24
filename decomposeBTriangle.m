function out = decomposeBTriangle(in)
%decomposeBTriangle Decompose type B triangle.
%
%   t = decomposeBTriangle(in) decomposes a type B triangle into a type A
%   triangle, a type B triangle, and a type B-prime triangle. The input is
%   a one-row table as returned by bTriangle, and the output is a three-row
%   table.

%   Copyright 2018 The MathWorks, Inc.

t_A = apTriangle(in.Left,[],in.Apex);
t_cp = cpTriangle([],t_A.Left,t_A.Right);
t_b = bTriangle(t_cp.Apex,t_cp.Right,[]);
t_bp = bpTriangle(t_cp.Apex,[],t_cp.Left);
t_a = aTriangle(t_cp.Apex,t_b.Right,[]);
t_ap = apTriangle(t_A.Apex,t_a.Right,[]);
t_c = cTriangle([],in.Apex,t_A.Left);
t_c2 = cTriangle(t_c.Apex,t_c.Right,[]);
t_b2 = bTriangle(t_c2.Right,in.Right,[]);

out = [ t_cp ; t_b ; t_bp ; t_a ; t_ap ; t_c ; t_c2 ; t_b2];

end
