function [apex,a,b]=rectTriangle1(apex,a,b,r)
%%% renvoie les trois sommets en complexe du triangle rectangle carcatérisé
%%% par la position de ses sommet et du ratio de longueur des côtés
%%% adjacent à l'angle droite. Si un 2 des paramètres sont manquants ils
%%% sont calculés

if isempty(apex)
    s=1/(1+r^2);
    m=s*a+(1-s)*b;
    apex=scrub(m-1i*(a-m)/r);

elseif isempty(a)
    a=scrub(apex+1i*(apex-b)*r);
    
elseif isempty(b)
    b=scrub(apex+1i*(a-apex)/r);
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
    
