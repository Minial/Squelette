//Fonction erosion matrice de point binaire
function [ImgE]= Erosion(Img)
    [TailleX,TailleY]=size(Img)
    //TailleY=size(Img(1))
    ImgE=Img
    
    for i= 2:TailleX-1
        for j = 2:TailleY-1
            for k = i-1:i+1
                for l = j-1:j+1
                    if(Img(k,l)==0)
                        ImgE(i,j)=0
                    end
                end
            end
        end        
    end
    
endfunction



//TEST
Img_=[0,0,0,0,0;0,1,1,1,0;0,1,1,1,0;0,1,1,1,0;0,0,0,0,0]

ImgS=Erosion(Img_)
figure(0)
imshow(ImgS)
figure(1)
imshow(Img_)
