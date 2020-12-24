function t = pRectTriangle(Apex,a,b)

[Apex,a,b] = rectTriangle2(Apex,a,b,1); 
Type = categorical("Tp");
t = table(Apex,a,b,Type);

end