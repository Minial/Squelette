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

clear all; 
xdel(winsid());
imgTest1 = [1 0 1; 1 1 1; 0 0 0];
imshow(imgTest1);

imgTest2 = [0 0 0; 1 0 1; 0 1 0];
figure(1);
imshow(imgTest2);

retour = soustractionImages(imgTest1,imgTest2);
figure(2);
imshow(retour);
