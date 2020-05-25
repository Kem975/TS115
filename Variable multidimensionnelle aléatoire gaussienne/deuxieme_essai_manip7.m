clear;clc;close all;

load('X_pluv.mat');
X1 = X_pluv(:,1);
X2 = X_pluv(:,2);
X3 = X_pluv(:,3);

X_bdx_nt(:,1)=X1;
X_bdx_nt(:,2)=X2;


Px=hist3(X_bdx_nt)/1200;

Ix1=0;

for x=1:10
    pxx=sum(Px(x,:));
    for y=1:10
        py=sum(Px(:,y));
        if Px(x,y)>0
            Ix1=Ix1+Px(x,y)+log((Px(x,y)/(pxx*py)));
        end
    end
end


Y1=[X1 X2];
Y2=[X1 X3];
