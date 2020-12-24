function showTangramR(R,w,r_color,rp_color,s_color,sp_color)

%%% même rôle que la fonction showTiles mais il faut différencier
%%% quadrilatères et triangles.

ax = gca;
if nargin < 2
    w = 0.5;
end
if nargin < 6
    sp_color = [255 51 51]/255;
end
if nargin < 5
    s_color = [235 20 100]/255;
end
if nargin < 4
   rp_color = [0 0 204]/255;
end
if nargin < 3
   r_color = [51 51 255]/255;
end

    

% Display all the tiles as one patch object, constructed in face-vertex
% form.

points = [R.Apex R.Left R.Top R.Right];
points = points.';
points = points(:);
vertices = [real(points) imag(points)];
faces = reshape(1:(4*height(R)),4,[])';
colors = zeros(height(R),3);

for k = 1:height(R)
    switch R.Type(k)
        case {'R'}
            colors(k,:) = r_color;
            
        case {'Rp'}
            colors(k,:) = rp_color;
            
        case {'S'}
            colors(k,:) = s_color;
        case{'Sp'}
            colors(k,:) = sp_color;
    end
end

patch(ax,'Faces',faces,'Vertices',vertices,...
    'EdgeColor','none',...
    'FaceColor','flat',...
    'FaceVertexCData',colors);
 
% Now display the rhombus edges. These are the triangle sides, omitting
% the triangle bases.

points = [R.Apex R.Left R.Top R.Right R.Apex];
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