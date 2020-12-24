function showRhombus(S,w)
%%% Idem que les fonctions pour les triangles mais il faut différencier
%%% quadrilatères et triangles

if nargin<2
    w=1.5;
end

vertices = [S.Apex S.Left S.Top S.Right S.Apex];
vertices(:,end+1) = NaN;
vertices = vertices.';
vertices = vertices(:);
x = real(vertices);
y = imag(vertices);

plot(x,y,'k','LineWidth',w)
axis equal
axis off