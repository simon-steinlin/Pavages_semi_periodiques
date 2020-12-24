function [apex,a,b]=rectTriangle2 (apex,a,b,r)
%%% renvoie les trois sommets en complexe du triangle rectangle carcatérisé
%%% par la position de ses sommet et du ratio de longueur des côtés
%%% adjacent à l'angle droite. Si un 3 des paramètres est manquant il
%%% est calculé
%%% La différence avec rectTriangle1 est que étant donné deux sommets, il y
%%% a toujours deux possibilités pour tracer le dernier point si on a le
%%% ratio des côtés. Donc cette fonction trace l'une des deux option et
%%% l'autre fonction donne l'autre (remarque les  signes qui changent lors
%%% de l'affectation finale

if isempty(apex)
    s=1/(1+r^2);
    m=s*a+(1-s)*b;
    apex=scrub(m+1i*(a-m)/r);   % Signe change par rapport à recTriangles1

elseif isempty(a)
    a=scrub(apex-1i*(apex-b)*r);    % Signe change par rapport à recTriangles1
    
elseif isempty(b)
    b=scrub(apex-1i*(a-apex)/r);    % Signe change par rapport à recTriangles1
end

end

function z = scrub(z)
% z = scrub(z) removes unsightly real or imaginary part.
if abs(real(z)) < 10*eps(abs(imag(z)))
    z = imag(z)*1i;
end
if abs(imag(z)) < 10*eps(abs(real(z)))
    z = real(z);
end

end
    
