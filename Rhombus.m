function t = Rhombus(Apex,Left,Top,Right)
%%% même rôle que les fonction rectTriangle1 dans le pavage Pinwheel
[Apex,Left,Top,Right] = Parallelograms(Apex,Left,Top,Right,135,1/sqrt(2));
Type = categorical("R");
t = table(Apex,Left,Top,Right,Type);

end