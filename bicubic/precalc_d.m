function [Ix, Iy, Ixy] = precalc_d(I)
    % =========================================================================
    % Prealculeaza matricile Ix, Iy si Ixy ce contin derivatele dx, dy, dxy ale 
    % imaginii I pentru fiecare pixel al acesteia
    % =========================================================================
    
    % obtine dimensiunea imaginii
    [m n nr_colors] = size(I);
    
    % TODO: fa cast matricii I la double
    I=double(I);

    % TODO: calculeaza matricea cu derivate fata de x Ix
    for i=1:m
      for j=1:n
       %prima coloana cu zero
        Ix(:,1)=0;
      %ultima coloana cu zero
        Ix(:,n)=0;
        if j>1 && j<n
          Ix(i,j)=fx(I,i,j);
        endif
      endfor
    endfor

    % TODO: calculeaza matricea cu derivate fata de y Iy
    for i=1:m
      for j=1:n
      %prima linie cu 0
        Iy(1,:)=0;
      %ultima linie cu 0
        Iy(m,:)=0;
        if i>1 && i<m
          Iy(i,j)=fy(I,i,j);
        endif
      endfor
    endfor
   
    % TODO: calculeaza matricea cu derivate fata de xy Ixy
    for i=1:m
      for j=1:n
        Ixy(:,1)=0;
        Ixy(:,n)=0;
        Ixy(1,:)=0;
        Ixy(m,:)=0;
        if i>1 && j>1 && i<m && j<n
          Ixy(i,j)=fxy(I,i,j);
        endif
      endfor
    endfor
endfunction
