function [apex,left,top,right] = Parallelograms(apex,left,top,right,alpha,s)
% Alpha est en degrés, il représente l'angle au niveau des points Left et
% Right. s est le rapport de la longueur des côtés :
% s=abs((apex-left)/abs(apex-right))
% Cette fonction prend an argument les sommets d'un parallélogramme, l'un
% des angles et le rapport de longueurs et renvoie les sommets. Fonctionne
% toujours même avec seulement 2 sommets en entrée.
i=complex(0,1);
if nargin < 5
    s=1;
end

alpha = alpha*pi/180;
beta = pi-alpha;

if isempty(apex) && isempty(left)  %
    apex = right + (1/s)*(top-right)*exp(i*alpha);
    left = top - (1/s)*(right-top)*exp(i*alpha);
    
elseif isempty(apex) && isempty(right)
    apex = left + s*(top-left)*exp(-i*alpha);
    right = top - s*(top-left)*exp(i*beta);
   
    
elseif isempty(apex) && isempty(top)
    a = abs(right-left);
    b = a/sqrt(s^2+1-2*s*cos(beta));
    gamma = acos(((a^2)+((s*b)^2)-b^2)/(2*b*s*a));
    apex = left + (right-left)*(b*s/a)*exp(-i*gamma);
    top = right + (left-right)*(b*s/a)*exp(-i*gamma);
    
elseif isempty(right) && isempty(left)
    a = abs(top-apex);
    b = a/sqrt(s^2+1-2*s*cos(alpha));
    gamma = acos(((a^2)+(b^2)-(b*s)^2)/(2*b*a));
    left = top+(apex-top)*(b/a)*exp(-i*gamma);
    right = apex+(top-apex)*(b/a)*exp(-i*gamma);
    
elseif isempty(top) && isempty(left)
    top = right+s*(right-apex)*exp(i*beta);
    left = apex +s*(right-apex)*exp(i*beta);
    

    
elseif isempty(top) && isempty(right)
    top = left + 1/s*(left-apex)*exp(-i*beta);
    right = apex + 1/s*(left-apex)*exp(-i*beta);
    
end

 apex = scrub(apex);
 left = scrub(left);
 top = scrub(top);
 right = scrub(right);

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
