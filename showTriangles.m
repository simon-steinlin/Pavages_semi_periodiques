function showTriangles(T,w)
%showTriangles Show triangles.
%
%   showTriangles(T) shows the outline of each triangle contained in the
%   input table. Each row of the input table has the form returned by
%   aTriangle, apTriangle, bTriangle, or bpTriangle.
%
%   EXAMPLE
%
%   Show how a B triangle is decomposed into three triangles according
%   to Penrose tiling rules.
%
%       t = bTriangle([],-1,1);
%       t1 = decomposeTriangles(t);
%       showTriangles(t1)

%   Copyright 2018 The MathWorks, Inc.

if nargin<2
    w=1.5;
end

vertices = [T.Left T.Apex T.Right T.Left];
vertices(:,end+1) = NaN;
vertices = vertices.';
vertices = vertices(:);
x = real(vertices);
y = imag(vertices);

plot(x,y,'k','LineWidth',w)
axis equal
axis off