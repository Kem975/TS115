clear all; close all; clc

load('X_pluv.mat');
X_Bdx = X_pluv(:,1);
X_Nnt = X_pluv(:,2);
X_Stg = X_pluv(:,3);

%it est le nombre d'itération d'une valeur et axe et sensé retourner la valeur correspondante 

[it_X1, axe1] = hist3(X_pluv(:,1:2),[20,1]); %Histogramme X1 sachant X2
[it_X2, axe2] = hist3(X_pluv(:,1:2),[1,20]); %Histogramme X2 sachant X1
[it_X1X2, axe12] = hist3(X_pluv(:,1:2),[20,20]); %Histogramme X1 et X2

%initalisation pour les calculs de proba de chaque valeur
proba_X1 = zeros(20,1);
proba_X2 = zeros(20,1);
proba_X1X2 = zeros(20,20);


sum=0;
for i=1:1:20
    proba_X1(i) = it_X1(i)/1200;
    proba_X2(i) = it_X2(i)/1200;
    for j=1:1:20
        proba_X1X2(i,j) = it_X1X2(i,j)/1200;
    end
end


sum = 0
for i=1:1:20
    for j=1:1:20
        proba_X1X2(i,j)
        sum = sum + proba_X1X2(i,j)*log((proba_X1X2(i,j))/(proba_X1(i)*proba_X2(j)));
    end
end
sum

axe1{1,1};

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



Y1 = cov(X_Bdx, X_Nnt);
Y2 = cov(X_Bdx, X_Stg);
Y3 = cov(X_Nnt, X_Stg);

a = corrcoef(X_Bdx, X_Nnt);

