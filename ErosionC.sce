//Fonction erosion matrice de point binaire
function [ImgE]= ErosionC(Img)
    [TailleX,TailleY]=size(Img)
    //TailleY=size(Img(1))
    ImgE=Img
    
    for i= 2:TailleX-1
        for j = 2:TailleY-1
            if(Img(i+1,j)==0)
                ImgE(i,j)=0
            end
            if(Img(i-1,j)==0)
                ImgE(i,j)=0
            end
            if(Img(i,j+1)==0)
                ImgE(i,j)=0
            end
            if(Img(i,j-1)==0)
                ImgE(i,j)=0
            end
        end        
    end
    
endfunction
