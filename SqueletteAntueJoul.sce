
exec('./OuvertureC.sce',-1)
exec('./ErosionC.sce',-1)
function [NonVide] = VerificationImage(Img)
    [x,y]=size(Img)
    NonVide=%F
    for i=2:x-1
        for j=2:y-1
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
        ImgS_=additionImages(ImgS_,soustractionImages(ImgE,OuvertureC(ImgE)))
        ImgE=ErosionC(ImgE)
    end
    ImgS=ImgS_
endfunction
