
function [ImgO] = Ouverture(Img)
    ImgO=Dilatation(Erosion(Img))
    exec('.\Dilatation.sce',-1)
    exec('.\Ouverture.sce',-1)
endfunction
