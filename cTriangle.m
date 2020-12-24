function t = cTriangle(Apex,Left,Right)
%cTriangle Representation of type A triangle in table form.
%   t = cTriangle(apex,left,right) returns a type C triangle represented as
%   a one-row table. The triangle vertices (apex, left, and right) are
%   complex numbers. If one of the triangle vertices is empty, it is
%   computed automatically.
%
%   EXAMPLE
%   Compute a type C triangle with apex at (0,1) and left base vertex at
%   (0,0) in the complex plane.
%
%       t = cTriangle(1i,0,[])

%   Copyright 2018 The MathWorks, Inc.

[Apex,Left,Right] = isoscelesTriangle(Apex,Left,Right,3*180/7);
Type = categorical("C");
t = table(Apex,Left,Right,Type);