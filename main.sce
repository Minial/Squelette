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
figure(1);
exec('.\Erosion.sce',-1)
retourErosion = Erosion(retourImg1);
subplot(321)
imshow(retourErosion);
//Dilatation
exec('.\Dilatation.sce',-1)
retourDilatation = Dilatation(retourImg1);
subplot(322)
imshow(retourDilatation);
//ouverture
exec('.\Ouverture.sce',-1)
retourOuverture = Ouverture(retourImg1);
subplot(323)
imshow(retourOuverture);
//fermeture
exec('.\Fermeture.sce',-1)
retourFermeture = Fermeture(retourImg1);
subplot(324)
imshow(retourFermeture);

//Amincissement et Epaississement
exec('.\amincissement.sce',-1)
matA=[1,1,1;1,1,1;2,2,2]
retourAmincissement = amincissement(retourImg1,matA)
subplot(325)
imshow(retourAmincissement);

exec('.\epaississement.sce',-1)
matE=[1,1,1;1,0,1;2,2,2]
retourEpaississement = epaississement(retourImg1,matE)
subplot(326)
imshow(retourEpaississement);

//Amincissement Homotopique
figure(2)
subplot(221)
imshow(imgCarre);
exec('.\squeletteAmincissement.sce',-1)
retourSqueletteA = squeletteAmincissement(imgCarre)
subplot(222)
imshow(retourSqueletteA);

//Squelette AntueJoul
subplot(223)
imshow(imgCarre);
exec('.\SqueletteAntueJoul.sce',-1)
Squelette = SqueletteAntuejoul(imgCarre);
subplot(224)
imshow(Squelette)
