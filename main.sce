clear all; 
xdel(winsid());

//Images utiles
imgRectangle = [
0,0,0,0,0,0,0,0,0,0;
0,0,0,0,0,0,0,0,0,0;
0,0,1,1,1,1,1,1,0,0;
0,0,1,1,1,1,1,1,0,0;
0,0,1,1,1,1,1,1,0,0;
0,0,1,1,1,1,1,1,0,0;
0,0,0,0,0,0,0,0,0,0;
0,0,0,0,0,0,0,0,0,0];

imgCarre = [
0,0,0,0,0,0,0,0,0,0,0;
0,0,0,0,0,0,0,0,0,0,0;
0,0,1,1,1,1,1,1,1,0,0;
0,0,1,1,1,1,1,1,1,0,0;
0,0,1,1,1,1,1,1,1,0,0;
0,0,1,1,1,1,1,1,1,0,0;
0,0,1,1,1,1,1,1,1,0,0;
0,0,1,1,1,1,1,1,1,0,0;
0,0,1,1,1,1,1,1,1,0,0;
0,0,0,0,0,0,0,0,0,0,0;
0,0,0,0,0,0,0,0,0,0,0];


//Seuillage et Binarisation
exec('.\seuillage.sce',-1)
retourImg1 = seuillage(".\image.jpg",128);
///figure(0);
//imshow(retourImg1);
subplot(221)
imshow(retourImg1)

retourImg2 = seuillage(".\singe.PNG",160);
subplot(222)
imshow(retourImg2);

//Addition et Soustration d'image
exec('.\additionImages.sce',-1)
retourAddition = additionImages(retourImg1,retourImg2);
subplot(223)
imshow(retourAddition);
exec('.\soustractionImages.sce',-1)
retourSoustraction = soustractionImages(retourImg1,retourImg2);
subplot(224)
imshow(retourSoustraction);

//Erosion et Dilatation
exec('.\Erosion.sce',-1)
exec('.\Dilatation.sce',-1)
exec('.\Ouverture.sce',-1)
exec('.\Fermeture.sce',-1)
retourErosion = Erosion(retourImg1);
retourDilatation = Dilatation(retourImg1);
retourOuverture = Ouverture(retourImg1);
retourFermeture = Fermeture(retourImg1);
figure(1);
subplot(221)
imshow(retourErosion);
subplot(222)
imshow(retourDilatation);
subplot(223)
imshow(retourOuverture);
subplot(224)
imshow(retourFermeture);

//Squelette AntueJoul
exec('.\SqueletteAntueJoul.sce',-1)
Squelette = SqueletteAntuejoul(retourImg1);
figure(4)
subplot(221)
imshow(Squelette)

//Amincissement et Epaississement
exec('.\amincissement.sce',-1)
matA=[1,1,1;1,1,1;2,2,2]
retourAmincissement = amincissement(retourImg1,matA)
subplot(223)
imshow(retourAmincissement);

exec('.\epaississement.sce',-1)
matE=[1,1,1;1,0,1;2,2,2]
retourEpaississement = epaississement(retourImg1,matE)
subplot(224)
imshow(retourEpaississement);

//Amincissement Homotopique
figure(2)
subplot(221)
imshow(imgCarre);
exec('.\squeletteAmincissement.sce',-1)
retourSqueletteA = squeletteAmincissement(imgCarre)
subplot(222)
imshow(retourSqueletteA);

