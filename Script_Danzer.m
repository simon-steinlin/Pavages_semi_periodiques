%% test 
% 

% % t = aTriangle([],-1,1);
% % t = decomposeATriangle(t);
% % t(1,:)
% % showTriangles(t)
% 
% % t=apTriangle([],-1,1);
% % t = decomposeApTriangle(t);
% % showTriangles(t)
%% chaque décomposition
axis equal, hold on, set(gcf,'color','w')
% subplot(2,3,1)
% axis equal, hold on, set(gcf,'color','w')
% t=aTriangle([],-1,1);
% t=decomposeATriangle(t);
% showTriangles(t)
% showTiles(t)
% 
% subplot(2,3,2)
% axis equal, hold on, set(gcf,'color','w')
% t=apTriangle([],-1,1);
% t=decomposeApTriangle(t);
% showTriangles(t)
% showTiles(t)

%subplot(2,3,3)
% axis equal, hold on, set(gcf,'color','w')
% t=bTriangle([],-1,1);
% t=decomposeBTriangle(t);
% showTriangles(t)

% subplot(2,3,4)
% axis equal, hold on, set(gcf,'color','w')
% t=bpTriangle([],-1,1);
% t=decomposeBpTriangle(t);
% showTriangles(t)
% showTiles(t)
% 
subplot(2,3,5)
axis equal, hold on, set(gcf,'color','w')
t=cTriangle([],-1,1);
t=decomposeCTriangle(t);
showTriangles(t)
% showTiles(t)
% 
% subplot(2,3,6)
% axis equal, hold on, set(gcf,'color','w')
% t=cpTriangle([],-1,1);
% t=decomposeCpTriangle(t);
% showTriangles(t)
% showTiles(t)



print -r250 -djpeg 'Décompositions Danzer Tiling'
%% tracé du pavage complet
close all,
figure(2)
t = table ; % tableau vide
i=complex(0,1);
for k=1:13
    theta=(k-1)*180/7;
    t_A=aTriangle(0,exp(i*theta*pi/180),[]);    % On crée des triangles orientés autour de 0.
    t_Ap=apTriangle(0,t_A.Right,[]);     
    t=[t;t_Ap;t_A];                             % On ajoute tout au tableau
    % disp(k)
end
showTiles(t)    % On affiche la situtation initiale
print('-r500','Danzer_7-fold_tiling r500 2','-djpeg')


for k=1:4
    t=decomposeTriangles(t);    % On décompose petit à petit
    disp(k)
    showTiles(t)
    print('-r500',['Danzer_7-fold_tiling r500 1',num2str(k)],'-djpeg')

end



