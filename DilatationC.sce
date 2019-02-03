//Fonction erosion matrice de point binaire
function [ImgE]= DilatationC(Img)
    [TailleX,TailleY]=size(Img)
    //TailleY=size(Img(1))
    ImgE=Img
    
    for i= 2:TailleX-1
        for j = 2:TailleY-1
            if(Img(i+1,j)==1)
                ImgE(i,j)=1
            end
            if(Img(i-1,j)==1)
                ImgE(i,j)=1
            end
            if(Img(i,j+1)==1)
                ImgE(i,j)=1
            end
            if(Img(i,j-1)==1)
                ImgE(i,j)=1
            end
        end        
    end
    
endfunction
