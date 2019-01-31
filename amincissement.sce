function retour= amincissement(Img, mat)
    [x,y]=size(Img)
    retour=Img;
    faire = 1;
    
    for i= 2:x-1
        for j = 2:y-1
            matX=1;
            matY=1;
            faire = 1;
            for k = i-1:i+1
                for l = j-1:j+1
                    if(Img(k,l)== mat(matX,matY))then
                        
                     elseif(mat(matX,matY)==2) then
                          
                     else
                            faire = 0;
                            
                     end
                    matY = matY + 1;
                end
                matY=1;
                matX = matX +1;
             end
             
             if(faire == 1)then
                 retour(i,j)=0;
             end   
          end
     end           
endfunction
