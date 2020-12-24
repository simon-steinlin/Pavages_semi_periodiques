function [apex,left,top,right] = Squares(apex,left,top,right)  %vu comme un losange avec le apexen bas.

%%% prend en argument les positions des 4 coins d'un carré et la taille de
%%% ses côté. Renvoie la position des 4 coins même si il en manque une.

i=complex(0,1);

if isempty(apex) && isempty(left)
    apex = right + (top-right)*i;
    left = top + (top-right)*(-i);
    
elseif isempty(apex) && isempty(right)
    apex = left + (top-left)*(-i);
    right = top + (top-left)*(-i);
    
elseif isempty(apex) && isempty(top)
    apex = left+exp(-i*pi/4)*(right-left)/sqrt(2);
    top = left+exp(i*pi/4)*(right-left)/sqrt(2);
    
elseif isempty(right) && isempty(left)
    left = apex+exp(i*pi/4)*(top-apex)/sqrt(2);
    right = apex+exp(-i*pi/4)*(top-apex)/sqrt(2);

elseif isempty(top) && isempty(left)
    top = right+(right-apex)*i;
    left = apex +(right-apex)*i;
elseif isempty(top) && isempty(right)
    top = left + (left-apex)*(-i);
    right = apex + (left-apex)*(-i);
    
end

end
