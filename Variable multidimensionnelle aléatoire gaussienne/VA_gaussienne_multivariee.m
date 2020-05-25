clear; clc; close all;

%Variables
sigma_y=[2 1;1 2];
mu=[0.2;0.2];
[U,D]=eig(sigma_y);
sqrt_sigma_y=U*D.^(0.5)*inv(U);
N=1000;

%Calculs des VA x et y
x=randn(2,N);

for index=[1:N]
    y(:,index)=sqrt_sigma_y*x(:,index)+mu;
end

%Affichages des VA
figure,
histogram2(y(1,:),y(2,:),25,'FaceColor','flat');
colorbar
title('Affichage de y');

figure,
histogram2(x(1,:),x(2,:),25,'FaceColor','flat');
colorbar
title('Affichage de x');

%Manipulation 5
R=corrcoef(transpose(y));