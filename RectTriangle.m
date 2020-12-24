function t = RectTriangle(Apex,a,b)

[Apex,a,b] = rectTriangle1(Apex,a,b,1); 
Type = categorical("T");
t = table(Apex,a,b,Type);

end