

function [ImgO] = OuvertureH(Img)
    exec('.\DilatationH.sce',-1)
    exec('.\OuvertureH.sce',-1)
    ImgO=DilatationH(ErosionH(Img))
endfunction
