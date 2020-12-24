function out = DecomposeT(in)
%%% prend en argument un tableau contenant indifféremment des triangles et
%%% des quadrilatères et renvoie les triangles qui composent leur
%%% décompositon.
c = cell(height(in),1);

for k = 1:height(in)
    t_k = in(k,:);
    
    switch in.Type(k)
        case "R"
            c{k} = decomposeRhombusT(t_k);
            
        case "Rp"
            c{k} = decomposepRhombusT(t_k);
            
        case "S"
            c{k} = decomposeSquaresT(t_k);
        case "Sp"
            c{k} = decomposepSquaresT(t_k);
        case "T"
            c{k} = decomposeTrianglesT(t_k);
        case "Tp"
            c{k} = decomposepTrianglesT(t_k);
    end
end

out = cat(1,c{:});