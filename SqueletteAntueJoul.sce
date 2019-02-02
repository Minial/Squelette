
exec('./Ouverture.sce',-1)
exec('./Fermeture.sce',-1)
function [NonVide] = VerificationImage(Img)
    [x,y]=size(Img)
    NonVide=%F
    for i=1:x
        for j=1:y
            if (Img(i,j)==1)
                NonVide=%T
            end
        end
    end
endfunction

function [ImgS] = SqueletteAntuejoul(Img)
    [x,y]=size(Img)
    ImgS_=zeros(x,y)
    ImgE=Img
    while VerificationImage(ImgE)==%T
        ImgS_=additionImages(ImgS_,soustractionImages(ImgE,Ouverture(ImgE)))
        ImgE=Erosion(ImgE)
    end
    ImgS=ImgS_
endfunction
