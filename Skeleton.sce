
//Fonction erosion matrice de point binaire
function [ImgE]= Erosion(Img)
    [TailleX,TailleY]=size(Img)
    //TailleY=size(Img(1))
    ImgE=Img
    
    for i= 2:TailleX-1
        for j = 2:TailleY-1
            for k = i-1:i+1
                for l = j-1:j+1
                    if(Img(i,j)==0)
                        ImgE(k,l)=0
                    end
                end
            end
        end        
    end
    
endfunction

//Fonction dilatation matrice de point binaire
function [ImgE]= Dilatation(Img)
    [TailleX,TailleY]=size(Img)
    //TailleY=size(Img(1))
    ImgE=Img
    
    for i= 2:TailleX-1
        for j = 2:TailleY-1
            for k = i-1:i+1
                for l = j-1:j+1
                    if(Img(i,j)==1)
                        ImgE(k,l)=0
                    end
                end
            end
        end        
    end
    
endfunction

function [ImgO] = Ouverture(Img)
    ImgO=Dilatation(Erosion(Img))
endfunction

function [ImgF] = Fermeture(Img)
    ImgF=Erosion(Dilatation(Img))
endfunction

function [NonVide] = VerificationImage(Img)
    [x,y]=size(Img)
    NonVide=%F
    for i=1:x
        for j=1:y
            if (Img(i,j)==1)
                NonVide=%F
            end
        end
    end
endfunction

function [ImgS] = SqueletteAntuejoul(Img)
    [x,y]=size(Img)
    imgS=zeros(x,y)
    ImgE=Img
    while VerificationImage(ImgE)==%T
        ImgS=additionImages(ImgS,soustractionImages(ImgE,Ouverture(ImgE)))
        ImgE=Erosion(ImgE)
    end
endfunction








function retour= epaississement(Img, mat)
    [x,y]=size(Img)
    retour=Img;
    faire = 1;
    
    for i= 2:x-1
        for j = 2:y-1
            matX=1;
            matY=1;
            faire = 1;
            for k = i-1:i+1
                for l = j-1:j+1
                    if(Img(k,l)== mat(matX,matY))then
                        
                     elseif(mat(matX,matY)==2) then
                          
                     else
                            faire = 0;
                            
                     end
                    matY = matY + 1;
                end
                matY=1;
                matX = matX +1;
             end
             
             if(faire == 1)then
                 retour(i,j)=1;
             end   
          end
     end           
endfunction

function retour= amincissement(Img, mat)
    [x,y]=size(Img)
    retour=Img;
    faire = 1;
    
    for i= 2:x-1
        for j = 2:y-1
            matX=1;
            matY=1;
            faire = 1;
            for k = i-1:i+1
                for l = j-1:j+1
                    if(Img(k,l)== mat(matX,matY))then
                        
                     elseif(mat(matX,matY)==2) then
                          
                     else
                            faire = 0;
                            
                     end
                    matY = matY + 1;
                end
                matY=1;
                matX = matX +1;
             end
             
             if(faire == 1)then
                 retour(i,j)=0;
             end   
          end
     end           
endfunction

function ImgRetour=additionImages(ImgA, ImgB)

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
   somme = ImgA(i,j) + ImgB(i,j);
   
   if(somme == 2) then
        ImgRetour(i,j)= 1;  
    else ImgRetour(i,j)= somme;
        end,
    end 
end

endfunction

function retour= squeletteAmincissement(Img)
//exec('C:\Users\sebas\Documents\Git_Scilab\Squelette\amincissement.sce',-1)

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
    
    exec('C:\Users\sebas\Documents\Git_Scilab\Squelette\soustractionImages.sce',-1)
    retourSoustraction = soustractionImages(imgCompare,imgTravail);

    temp = find(retourSoustraction,255)
    
     if(size(temp)==0)then
        sortie =1;
     end
     
end    
retour = imgTravail;
endfunction


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
