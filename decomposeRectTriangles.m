function out = decomposeRectTriangles(in)
%%% prend un tableau de triangles et renvoie leur décomposition. Celle-ci
%%% est différente pour les triangles A ou Ap.
c = cell(height(in),1);

for k = 1:height(in)
    t_k = in(k,:);
     switch in.Type(k)
        case "A"
            c{k} = decomposeARectTriangle(t_k);
            
        case "Ap"
            c{k} = decomposeApRectTriangle(t_k);
     end
end

out = cat(1,c{:});
        
end