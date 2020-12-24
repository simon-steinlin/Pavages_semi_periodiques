function showTilesRectTriangles(T,a_color,ap_color,w)
%%% affiche les tuiles du pavage Pinwheel T avec les couleurs a_color et
%%% ap_color et l'épaisseur des traits est donnée par w.
%%% a_color et ap_color sont des vecteurs (1,3) RGB avec de valeurs entre 0
%%% et 1.
%%% T est un tableau contenant tous les triangles à afficher.

ax = gca;
if nargin < 4       % si jamais le seul argument d'entrée est le tableau les variables sont automatiquement associées à une valeur
    w = 0.5;
end
if nargin < 3
   ap_color = [0 250 100]/255;
end
if nargin < 2
   a_color = [0 100 250]/255;
end

    

% Display all the tiles as one patch object, constructed in face-vertex
% form.

points = [T.Apex T.a T.b];  % On acquière les points du tableau d'entrée
points = points.';
points = points(:);
vertices = [real(points) imag(points)]; % on récupère les coordonnées pour la fonction patch
faces = reshape(1:(3*height(T)),3,[])';
colors = zeros(height(T),3);

for k = 1:height(T)     % On parcourt tous les triangles et on associe une couleur en fonction du Type
    switch T.Type(k)
        case {'A'}
            colors(k,:) = a_color;
            
        case {'Ap'}
            colors(k,:) = ap_color;  
    end
end

patch(ax,'Faces',faces,'Vertices',vertices,...
    'EdgeColor','none',...
    'FaceColor','flat',...
    'FaceVertexCData',colors);
 
% Now display the rhombus edges. These are the triangle sides, omitting
% the triangle bases.

points = [T.Apex T.a T.b T.Apex];   % Pour tracer les triangles on récupère les points
points(:,end+1) = NaN;              % Pour que les triangles ne soient pas reliés
points = points.';
points = points(:);
x = real(points);                   
y = imag(points);
hold on
plot(ax,x,y,'k','LineWidth',w)      % On affiche les triangles avec l'épaisseur désirée
hold off

axis(ax,'equal')                    % On garde bien les proportions
axis(ax,'off')                      % On ne veut pas les avoir sur l'image