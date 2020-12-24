function t = Square(Apex,Left,Top,Right)

[Apex,Left,Top,Right] = Parallelograms(Apex,Left,Top,Right,90,1);
Type = categorical("S");
t = table(Apex,Left,Top,Right,Type);

end