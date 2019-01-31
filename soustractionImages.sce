function ImgRetour=soustractionImages(ImgA, ImgB)

[xA,yA] = size(ImgA);
[xB,yB] = size(ImgB);
if(xA*yA <= xB*yB)then
    imresize(ImgA,[xB,yB])    
else
    imresize(ImgB,[xA,yA])
end

ImgRetour = ImgA;
[x,y] = size(ImgA);
for i = 1:x
   for j = 1:y
   somme = ImgA(i,j) - ImgB(i,j)
   
   if(somme < 0) then
        ImgRetour(i,j)= 0;  
    else ImgRetour(i,j)= somme;
        end,
    end 
end

endfunction
