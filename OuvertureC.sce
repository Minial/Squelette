function [ImgO] = OuvertureC(Img)
    exec('.\DilatationC.sce',-1)
    exec('.\OuvertureC.sce',-1)
    ImgO=DilatationC(ErosionC(Img))
endfunction
