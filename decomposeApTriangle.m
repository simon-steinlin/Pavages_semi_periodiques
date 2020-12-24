function out = decomposeApTriangle(in)
%decomposeATriangle Decompose type A triangle.
%
%   t = decomposeATriangle(in) decomposes a type A triangle into a type A
%   and a type B-prime triangle. The input is a one-row table as returned
%   by aTriangle, and the output is a two-row table.

%   Copyright 2018 The MathWorks, Inc.

t_cp = cTriangle([],in.Left,in.Right);
t_b = bTriangle(t_cp.Apex,[],t_cp.Left);
t_bp = bpTriangle(t_cp.Apex,in.Right,[]);
t_ap=apTriangle(t_cp.Apex,[],t_b.Left);
t_a=aTriangle([],t_ap.Right,t_ap.Left);
out=[t_cp ; t_b ; t_bp ; t_ap ; t_a ];


end
