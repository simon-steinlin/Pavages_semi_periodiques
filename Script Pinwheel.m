%% test triangles
close all,hold on,axis equal
A=complex(0,1); 
r=4;
B=complex(r,0);
[apex,a,b]=rectTriangle2(B,A,[],r);
plot([apex,a,b,apex])
hold on
[apex,a,b]=rectTriangle1(A,B,[],r);
plot([apex,a,b,apex])

%% test triangles sous forme de tableaux
close all
hold on, axis equal,
% 
% [apex,right,top]=rectTriangle1(0,[],1,1/2);
% plot([apex,right,top,apex])
% [apex,right,top]=rectTriangle1(0,[],1,-1/2);
% plot([apex,right,top,apex])


t = apRectTriangle(1,0,[]);
t_1=aRectTriangle(0,1,[]);
showRectTriangles1([t;t_1])
%% Test Substitution
% subplot(2,1,1), axis equal,
% TR = aRectTriangle([],2,0);
% t = decomposeARectTriangle(TR);
% showRectTriangles1([TR;t])
% 
% subplot(2,1,2), axis equal
close all
hold on
TR = apRectTriangle([],2,0);
t = decomposeApRectTriangle(TR);
showRectTriangles1(t)

%% Décomposition complète
close all
subplot(2,3,1)
i = complex(0,1);
t = aRectTriangle(0,2,[]);
t= [t;aRectTriangle([],t.b,t.a)];
showTilesRectTriangles(t)
title('Pinwheel Tiling étape 1')
print('-r500','1','-djpeg')
for k=1:5
    name = num2str(k+1);
    subplot(2,3,K+1);
    t = decomposeRectTriangles(t);
    showTilesRectTriangles(t)
    title(['Pinwheel Tiling étape : ',num2str(k+1)])
    print('-r500',name,'-djpeg')
    name = [num2str(k+1),'.jpg'];
    image1 = imread(name);
end
print('-r1000','Etapes de la décomposition en TF','-dpng')

%% Analyse de la TF des pavages

% t = t_pinwheel_6;   % On a fait la décomposition jusqu'à l'étape 6 une fois mais comme ça prend du temps on a sauvegardé un tableau contenant déjà la décomposition après 6 itérations afin de ne pas avoir à la refaire à chaque fois.
% Il faut "import data" en cliquant sur 't_pinheel_6' dans le dossier
% contenant les fonctions.
% Attention à lui donner le bon nom.
%showTilesRectTriangles(t)
%print('-r1000','Pinwheel_tiling_6','-djpeg')
%image1 = imread('Pinwheel_tiling_6.jpg');
% figure(1)
% imshow(image1)

image2 = imread('Danzer_7-fold_tiling r500.jpg');
figure(3)
imshow(image2)

% I1= rgb2gray(image1);
% figure(2)
% imshow(I1)

I2= rgb2gray(image2);
figure(2)
imshow(I2)

figure(5)
colormap(jet)
F1=fft2(double(I2));
% L=log2(abs(F1)).^2;
% L_1=log2(abs(F1(1,:))).^2;
% S=fftshift(L);
F1=fftshift(F1);
F1(750:1250,1200:1800)=0;   % On met à 0 la zone centrale (cette zone correspond à l'image Danzer 7-fold)
imagesc(log(abs(F1)).^2)    % On affiche le log^2 pour voir mieux le contraste
figure(6)
colormap(jet)
F1 = fftshift(F1);
F3 = log(abs(F1).^2);
imagesc(F3)
% print('-r500','log^2(FFT2) of Pinwheel tiling 6 ite','-djpeg')
figure(7)
colormap(gray)
F2=ifft2(fftshift(F1)); % On revient à l'image de départ
imagesc(abs(F2));


% figure(6)
% colormap(jet)
% F2=fft2(double(I2));
% S=fftshift(F2);
% L=log2(S).^2;
% A=abs(L);
% imagesc(A)
% print('-r500','log^2(FFT2) of Danzer 7-fold','-djpeg')
