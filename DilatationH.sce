
//Fonction dilatation matrice de point binaire
function [ImgE]= DilatationH(Img)
    [TailleX,TailleY]=size(Img)
    //TailleY=size(Img(1))
    ImgE=Img
    
    for i= 2:TailleX-1
        for j = 2:TailleY-1
            for k = i-1:i
                for l = j-1:j+1
                    if(Img(i,j)==1)
                        ImgE(k,l)=1
                    end
                end
            end
            if(Img(i+1,j)==1)
                ImgE(i,j)=1
            end
        end        
    end
    
endfunction
