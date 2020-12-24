%% Test Carrés
close all;
hold on, axis equal
i=complex(0,1);
[apex,left,top,right]=Squares(0,-1,[],[]);
plot([apex,left,top,right,apex],'r-')
scatter(real([apex,left,top,right]),imag([apex,left,top,right]),5,'r')

[apex,left,top,right]=Squares([],-1+i,2i,[]);
plot([apex,left,top,right,apex],'b-')
scatter(real([apex,left,top,right]),imag([apex,left,top,right]),5,'b')
figure(2)
t = Square(0,i,[],[]);
showRhombus(t)
T=t;
for k=1:10
    t= Square(t.Top,[],[],t.Apex);
    T=[T;t];
    showRhombus(T)
    pause(1)
end

showRhombus(T)
%% test losanges
close all,axis equal
hold on,

[apex,left,top,right] = Rhombuses([],1,[],0,135,1);
plot([apex,left,top,right,apex],'r-')
[apex,left,top,right] = Rhombuses(0,[],1,[],-135,1);
plot([apex,left,top,right,apex],'g-.')
% [apex,left,top,right] = Rhombuses(0,i,[],[],135,1);
% plot([apex,left,top,right,apex],'b--')
% 
t = Rhombus(0,i,[],[]);
t_p = pRhombus(0,1,[],[]);
s = Square(t_p.Left,[],[],t_p.Top);
r = RectTriangle([],t.Left,t.Top);
r_p = pRectTriangle([],t_p.Right,t_p.Top);


% showRhombus([t;t_p;s])
% showRectTriangles1([r;r_p])

%% test parralélogrammes
close all
figure(1), hold on, axis equal
s=2;
L=2;
R_p=L*s*exp(i*60*pi/180);
scatter(real([0,L,R_p,L+R_p]),imag([0,L,R_p,L+R_p]))
b=(abs(R_p-L))/sqrt(s^2+1-2*s*cos(pi/3));
disp('longueur théorique'),disp(b)
disp('Longueur réelle'),disp(abs(L));
a=abs(L-R_p);
disp('Angle théorique')
acos(((a^2)+((s*b)^2)-b^2)/(2*b*s*a))*180/pi
disp('Angle réel')
plot([L,R_p])

[apex,left,top,right] = Parallelograms(0,[],L+R_p,[],120,s);
plot([apex,left,top,right,apex])
%% test decomposition
close all
S = Square(0,i,[],[]);
r = decomposeSquaresR(S);
s = decomposeSquaresS(S);

showRhombus([s;r])

%% substitutions itérées
close all
s = Square(0,i,[],[]);
t=[];
r=[];
subplot(2,3,1)
showTangramR(s)
title('Configuration de départ')
for k=1:5
   t1 = t;  % On stocke les valeurs au début de chaque boucle pour ne pas faire de substitutions sur les formes
   r1 = r;  % Qui sont apparues sur les premières substitutions de la boucle
   s1 = s;
   t = DecomposeT([s1;r1);  % On décompose d'abord les quadrilatères en triangles, car les triangles ne peuvent pas être stockés dans le même tableau
   t = [t;DecomposeT(t1)];  % On décompose ensuite les triangles en triangles
   r = DecomposeR([r1;s1]); % On décompose ensuite les parallélogrammes et carrées en parallélogrammes (pas les triangles car les triangles ne sont décomposés qu'en carrés et triangles
   s = DecomposeS(s1);      % Idem, les parallélogrammes ne sont pas décomposés en carrés donc on ne les prend pas en compte
   s = [s;DecomposeS(t1)];
   subplot(2,3,k+1)
   showTangramT(t)
   hold on
   showTangramR([s;r])
   title(['décomposition #',num2str(k+1)])
end
print('-r200','MiniTangram Tiling Différentes étapes','-djpeg')
figure(2)
% % On modifie les couleurs ici pour changer le rendu visuel
% r_color = [0 0 153]/255;
% rp_color = [255, 153, 0]/255;
% s_color = [204, 0, 28]/255;
% sp_color = [204, 0, 28]/255;
% t_color = [255 255 0]/255;
% tp_color = [102, 255, 51]/255;
showTangramT(t,0.5,t_color,tp_color)
hold on
showTangramR([s;r],0.5,r_color,rp_color,s_color,sp_color)
print('-r100','MiniTangram Tiling','-djpeg')
