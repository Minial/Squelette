function retour= squeletteAmincissement(Img)
exec('.\amincissement.sce',-1)

imgTravail = Img;
sortie =0;
while(sortie==0)
    imgCompare = imgTravail;
    mat1=[1,1,1;2,1,2;0,0,0]
    imgTravail = amincissement(imgTravail,mat1)
    mat1=[1,1,1;2,1,2;0,0,0]
    imgTravail = amincissement(imgTravail,mat1)    
    mat2=[1,1,2;1,1,0;2,0,0]
    imgTravail = amincissement(imgTravail,mat2)
    mat3=[1,2,0;1,1,0;1,2,0]
    imgTravail = amincissement(imgTravail,mat3)
    mat4=[2,0,0;1,1,0;1,1,2]
    imgTravail = amincissement(imgTravail,mat4)
    mat5=[0,0,0;2,1,2;1,1,1]
    imgTravail = amincissement(imgTravail,mat5)
    mat6=[0,0,2;0,1,1;2,1,1]
    imgTravail = amincissement(imgTravail,mat6)
    mat7=[0,2,1;0,1,1;0,2,1]
    imgTravail = amincissement(imgTravail,mat7)
    mat8=[2,1,1;0,1,1;0,0,2]
    imgTravail = amincissement(imgTravail,mat8)
    
    exec('.\soustractionImages.sce',-1)
    retourSoustraction = soustractionImages(imgCompare,imgTravail);

    temp = find(retourSoustraction,255)
    
     if(size(temp)==0)then
        sortie =1;
     end
     
end    
retour = imgTravail;
endfunction
