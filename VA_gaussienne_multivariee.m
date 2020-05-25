clear; clc; close all;

sigma_y=[2 1;1 2];
mu=[0.2;0.2];
[U,D]=eig(sigma_y);
sqrt_sigma_y=U*D.^(0.5)*inv(U);
N=1000;

x=randn(2,N);

for index=[1:N]
    y(:,index)=sqrt_sigma_y*x(:,index)+mu;
end

figure,
histogram2(y(1,:),y(2,:),25);

figure,
histogram2(x(1,:),x(2,:),25);

R=corrcoef(transpose(y));