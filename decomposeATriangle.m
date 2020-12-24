function out = decomposeATriangle(in)
%decomposeATriangle Decompose type A triangle.
%
%   t = decomposeATriangle(in) decomposes a type A triangle into a type A
%   and a type B-prime triangle. The input is a one-row table as returned
%   by aTriangle, and the output is a two-row table.

%   Copyright 2018 The MathWorks, Inc.

t_c = cTriangle([],in.Left,in.Right);
t_bp = bpTriangle(t_c.Apex,[],t_c.Left);
t_b = bTriangle(t_c.Apex,in.Right,[]);
t_a = aTriangle(t_c.Apex,t_b.Right,t_bp.Left);
t_ap = apTriangle(in.Apex,t_a.Right,t_a.Left);
out=[t_c ; t_bp ; t_b ; t_a ; t_ap ];


end
