function out = DecomposeR(in)
%%% prend en argument un tableau contenant indifféremment des triangles et
%%% des quadrilatères et renvoie les parallélogrammes qui composent leur
%%% décompositon.
c = cell(height(in),1);

for k = 1:height(in)
    t_k = in(k,:);
    
    switch in.Type(k)
        case "R"
            c{k} = decomposeRhombusR(t_k);
            
        case "Rp"
            c{k} = decomposepRhombusR(t_k);
            
        case "S"
            c{k} = decomposeSquaresR(t_k);
            
        case "Sp"
            c{k} = decomposepSquaresR(t_k);
    end
end

out = cat(1,c{:});