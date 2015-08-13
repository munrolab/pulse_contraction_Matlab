
p1 = [100];%kqq   100
p2 = [1];%kq  1
p3 = [15]; %koff 15 
p4 = [65]; %ks 65
N3=length(p3);
N4=length(p4);

for i1=1:length(p1)
for i2=1:length(p2)   
figure; count = 1;
for i3=1:length(p3)           
for i4=1:length(p4) 
kqq=p1(i1); kq=p2(i2); koff=p3(i3); kra=p4(i4); %the variables to vary
subplot(N3,N4,count); 
plot_nullclines( a_maxval,kq,kqq,b,koff,ks );
title(['kqq=',num2str(p1(i1)),';kq=',num2str(p2(i2)),';koff=',num2str(p3(i3)),';ks=',num2str(p4(i4))]);
count = count+1;
end
end
end
end
%%
k_aa=1.3; 
k_apf=50; %100
k_h=1.2; %1
m=1.8;
k_rrc=55; %65
k_ad=15;
k_anf=0.3; %1
k_rd=1;

p1 = [ 1 5 10 15]; %k_ad
p2 = [1.3 1.5 1.7 2];% k_aa
N1=length(p1);
N2=length(p2);
figure; count = 1;
for i1=1:length(p1)
for i2=1:length(p2)   
k_ad=p1(i1); k_aa=p2(i2);
subplot(N1,N2,count); 
plot_nullclines_0714( k_aa,k_apf,k_ad,k_anf,k_rrc,k_rd,k_h,m,[0 5 0 50] );
title(['k_ad=',num2str(p1(i1)),';k_aa=',num2str(p2(i2))]);
count = count+1;
end
end

%%
%dispersion relation
k=1;
a0=0.1; r0=5;

Da=1; Dr=0.1; l=5; m0 = 10; n=2;
k_aa=1.3; 
k_apf=50; %100


k_rrc=55; %65
k_ad=15;
k_anf=0.2; %1
k_rd=1;

K=a0;
n=2;
k_h=1.2; %1
m=1.8;
%%
clear;
a0=0.1; r0=5;
i=1; j=1; k=1;
Pda =[1, 0.1, 10, 5, a0, 2];
% 1-Da; 2-Dr; 3-m0; 4-l; 5-k1; 6-n1
Da=Pda(i,1); Dr=Pda(i,2); m0=Pda(i,3); l=Pda(i,4); k1=Pda(i,5); n1=Pda(i,6);
Pr=[1.3,   50,    15,  0.2,  55,      1,      1.2,  1.8 ];
% 1-k_aa; 2-k_apf; 3-k_ad; 4-k_anf; 5-k_rrc; 6-k_rd; 7-k2; 8-n2
%Pr=[1 100 15 1 65 1 1 2];
k_aa=Pr(j,1); k_apf=Pr(j,2); k_ad=Pr(j,3); k_anf=Pr(j,4); k_rrc=Pr(j,5); k_rd=Pr(j,6); k2=Pr(j,7); n2=Pr(j,8);

f=n1*a0^(n1-1)*k1^n1/(a0^n1+k1^n1)^2;
g=n2*a0^(n2-1)*k2^n2/(a0^n2+k2^n2)^2;
C=k^2*m0*f/(1+l^2*k^2);
tau=C*a0+k_apf*g-k_anf*r0-k^2*(Da+Dr)-k_ad-k_rd;
delta=(-k^2*Da+C*a0+k_anf*g-k_ad-k_anf*r0)*(-k^2*Dr-k_rd)+(C*r0+k_rrc)*k_anf*a0;
[tau delta]



