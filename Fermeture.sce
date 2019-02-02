
function [ImgO] = Fermeture(Img)
    exec('.\Dilatation.sce',-1)
    exec('.\Ouverture.sce',-1)
    ImgO=Erosion(Dilatation(Img))
endfunction
