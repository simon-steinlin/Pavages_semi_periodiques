function t = pRhombus(Apex,Left,Top,Right)
%%% crée un parallélogramme mais avec les côtes inversés (même rôle que les
%%% triangles A et Ap dans le pavage Pinwheel).
[Apex,Right,Top,Left] = Parallelograms(Apex,Right,Top,Left,135,sqrt(2));
Type = categorical("Rp");
t = table(Apex,Left,Top,Right,Type);

end