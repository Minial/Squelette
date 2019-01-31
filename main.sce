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
exec('C:\Users\sebas\Documents\Git_Scilab\Squelette\seuillage.sce',-1)
retourImg1 = seuillage("C:\Users\sebas\Documents\Git_Scilab\Squelette\image.jpg",128);
///figure(0);
//imshow(retourImg1);
subplot(221)
imshow(retourImg1)

retourImg2 = seuillage("C:\Users\sebas\Documents\Git_Scilab\Squelette\singe.PNG",160);
subplot(222)
imshow(retourImg2);

//Addition et Soustration d'image
exec('C:\Users\sebas\Documents\Git_Scilab\Squelette\additionImages.sce',-1)
retourAddition = additionImages(retourImg1,retourImg2);
subplot(223)
imshow(retourAddition);
exec('C:\Users\sebas\Documents\Git_Scilab\Squelette\soustractionImages.sce',-1)
retourSoustraction = soustractionImages(retourImg1,retourImg2);
subplot(224)
imshow(retourSoustraction);

//Erosion et Dilatation
exec('C:\Users\sebas\Documents\Git_Scilab\Squelette\Erosion.sce',-1)
retourErosion = Erosion(retourImg1);
figure(1);
subplot(221)
imshow(retourErosion);

//Amincissement et Epaississement
exec('C:\Users\sebas\Documents\Git_Scilab\Squelette\amincissement.sce',-1)
matA=[1,1,1;1,1,1;2,2,2]
retourAmincissement = amincissement(retourImg1,matA)
subplot(223)
imshow(retourAmincissement);

exec('C:\Users\sebas\Documents\Git_Scilab\Squelette\epaississement.sce',-1)
matE=[1,1,1;1,0,1;2,2,2]
retourEpaississement = epaississement(retourImg1,matE)
subplot(224)
imshow(retourEpaississement);

//Amincissement Homotopique
figure(2)
subplot(221)
imshow(imgCarre);
exec('C:\Users\sebas\Documents\Git_Scilab\Squelette\squeletteAmincissement.sce',-1)
retourSqueletteA = squeletteAmincissement(imgCarre)
subplot(222)
imshow(retourSqueletteA);

