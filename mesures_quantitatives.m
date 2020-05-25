clear all; close all; clc

load('X_pluv.mat');
X_Bdx = X_pluv(:,1);
X_Nnt = X_pluv(:,2);
X_Stg = X_pluv(:,3);

Y1 = cov(X_Bdx, X_Nnt);
Y2 = cov(X_Bdx, X_Stg);
Y3 = cov(X_Nnt, X_Stg);

a = corrcoef(X_Bdx, X_Nnt)
b = corrcoef(Y2)
b = corrcoef(Y3)
