clear all; close all; clc

load('X_pluv.mat');
%Manipulation 6
X_Bdx = X_pluv(:,1);
X_Nnt = X_pluv(:,2);
X_Stg = X_pluv(:,3);

%Manipulation 7
Y1 = cov(X_Bdx, X_Nnt);
Y2 = cov(X_Bdx, X_Stg);
Y3 = cov(X_Nnt, X_Stg);

%it_X est le nombre d'itération d'une valeur et axe et sensé retourner la valeur correspondante 

[it_X1, axe1] = hist3(X_pluv(:,1:2),[20,1]); %Histogramme X1 sachant X2
[it_X2, axe2] = hist3(X_pluv(:,1:2),[1,20]); %Histogramme X2 sachant X1
[it_X1X2, axe12] = hist3(X_pluv(:,1:2),[20,20]); %Histogramme X1 et X2

%initalisation pour les calculs de proba de chaque valeur
proba_X1 = zeros(length(axe1));
proba_X2 = zeros(length(axe2));
proba_X1X2 = zeros(length(axe12));


%Calcul des probas
sum=0;
for i=1:1:20
    proba_X1(i) = it_X1(i)/1200; %Liste des probas de X1
    proba_X2(i) = it_X2(i)/1200; %Liste des probas de X2
    for j=1:1:20 
        proba_X1X2(i,j) = it_X1X2(i,j)/1200; %Matrice des probas de X1 et X2
    end
end

%Calcul de l'information mutuelle
sum = 0
for i=1:1:20
    for j=1:1:20
        if proba_X1X2(i,j) > 0 %Pour la convention 0*log(0) = 0
            sum = sum + proba_X1X2(i,j)*log((proba_X1X2(i,j))/(proba_X1(i)*proba_X2(j)));
        end
    end
end

information_mutuelle = sum %Info mutuelle entre X1 et X2

figure
subplot(3,1,1)
hist3(X_pluv(:,1:2),[20,1]);
title('Sachant X1');
subplot(3,1,2)
hist3(X_pluv(:,1:2),[1,20]);
title('Sachant X2');
subplot(3,1,3)
hist3(X_pluv(:,1:2),[20,20]);
title('Selon X1 et X2');




a = corrcoef(X_Bdx, X_Nnt)
b = corrcoef(Y2)
b = corrcoef(Y3)



