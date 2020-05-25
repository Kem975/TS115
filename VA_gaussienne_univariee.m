clear; clc; close all;

%Variables
N = 10001;
et = 25;
sigma = sqrt(9);
mu=2;

%Calcul des fonctions
v_a = mu + sigma*randn(N,1);
x = -20:0.004:20;
f_x = exp((-1/2)*((x-mu)/sigma).^2)*1/(sqrt(2*pi)*sigma);

%Manipulation 1
figure,
plot(x,N*f_x);
hold on
histogram(v_a,et) %La fonction histogram a plus bel affichage que la fonction hist, donc plus pratique pour relancer le script plusieurs fois
hold off

%Manipulation 2
[iteration, axis] = hist(v_a, et,x); %La fonction hist a l'avantage de retourner ses valeurs par rapport à la fonction histogram
entropy(iteration,axis)
