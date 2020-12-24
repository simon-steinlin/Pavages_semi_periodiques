function t = pSquare(Apex,Left,Top,Right)

[Apex,Right,Top,Left] = Parallelograms(Apex,Right,Top,Left,90,1);
Type = categorical("Sp");
t = table(Apex,Left,Top,Right,Type);

end