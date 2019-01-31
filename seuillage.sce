function retour=seuillage(path, seuil)

img = imread(path);

imgGray = rgb2gray(img);

[x,y] = size(imgGray);
imgFinale = zeros(imgGray);

for i = 1:x
   for j = 1:y
   
    if(imgGray(i,j)<seuil) then
        imgFinale(i,j)= 0;  
    else imgFinale(i,j)=1;
        end,
    end 
end
retour = imgFinale;

endfunction
