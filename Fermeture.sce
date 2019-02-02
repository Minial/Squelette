
exec('./Dilatation.sce',-1)
exec('./Ouverture.sce',-1)
function [ImgO] = Fermeture(Img)
    ImgO=Erosion(Dilatation(Img))
endfunction
