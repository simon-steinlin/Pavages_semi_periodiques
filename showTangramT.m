function showTangramT(T,w,t_color,tp_color)
%showTiles Show Penrose rhombus tiles.
%
%   showTiles(T,acolor,bcolor) displays the Penrose rhombus tiles
%   constructed from the triangles in the input table, T. acolor is the
%   color of the rhombus tiles formed from A and A' triangles. bcolor is
%   the color of the rhombus tiles formed from B and B' triangles. If
%   not specified, bcolor is a shade of orange, and acolor is a shade of
%   blue.
%
%   EXAMPLE
%   Decompose a B triangle 4 times and display the resulting rhombus
%   tiles.
%
%       t = bTriangle([],-1,1);
%       for k = 1:4
%           t = decomposeTriangles(t);
%       end
%       showTiles(t)

%   Copyright 2018 The MathWorks, Inc.

ax = gca;
if nargin < 2
    w = 0.5;
end
if nargin < 4
   tp_color = [255 255 0]/255;
end
if nargin < 3
   t_color = [255 255 102]/255;
end

    

% Display all the tiles as one patch object, constructed in face-vertex
% form.

points = [T.Apex T.a T.b];
points = points.';
points = points(:);
vertices = [real(points) imag(points)];
faces = reshape(1:(3*height(T)),3,[])';
colors = zeros(height(T),3);

for k = 1:height(T)
    switch T.Type(k)
        case {'T'}
            colors(k,:) = t_color;
            
        case {'Tp'}
            colors(k,:) = tp_color;            
    end
end

patch(ax,'Faces',faces,'Vertices',vertices,...
    'EdgeColor','none',...
    'FaceColor','flat',...
    'FaceVertexCData',colors);
 
% Now display the rhombus edges. These are the triangle sides, omitting
% the triangle bases.

points = [T.Apex T.a T.b T.Apex];
points(:,end+1) = NaN;
points = points.';
points = points(:);
x = real(points);
y = imag(points);
hold on
plot(ax,x,y,'k','LineWidth',w)
hold off

axis(ax,'equal')
axis(ax,'off')