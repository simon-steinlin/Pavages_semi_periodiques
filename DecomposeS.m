function out = DecomposeS(in)
%%% prend en argument un tableau contenant indifféremment des triangles et
%%% des quadrilatères et renvoie les carrés qui composent leur
%%% décompositon.
c = cell(height(in),1);

for k = 1:height(in)
    t_k = in(k,:);
    
    switch in.Type(k)
        case "T"
            c{k} = decomposeTrianglesS(t_k);
            
        case "Tp"
            c{k} = decomposepTrianglesS(t_k);
            
        case "S"
            c{k} = decomposeSquaresS(t_k);
            
        case "Sp"
            c{k} = decomposepSquaresS(t_k);
    end
end

out = cat(1,c{:});