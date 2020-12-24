function showRectTriangles1(T,w)
%%% cf ShowTilesRectTriangles
%%% fait la même chose sans remplir les faces.
if nargin<2
    w=1.5;
end

vertices = [T.Apex T.a T.b T.Apex];
vertices(:,end+1) = NaN;
vertices = vertices.';
vertices = vertices(:);
x = real(vertices);
y = imag(vertices);

plot(x,y,'k','LineWidth',w)
axis equal
axis off