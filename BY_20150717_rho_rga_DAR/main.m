clear;
Pr=[1.3,   50,    15,  0.2, 55,      1.2,      1.2,  1.8 ];
%Pr=[1,   100,    15,  1,  80,      1,      1,  2 ];
% 1-k_aa; 2-k_apf; 3-k_ad; 4-k_anf; 5-k_rrc; 6-k_rd; 7-k2; 8-n2
%Pr=[1 100 15 1 65 1 1 2];
% reaction parameters --> a0,r0
XYlims=[0 5 0 50];
j=1; 
k_aa=Pr(j,1); k_apf=Pr(j,2); k_ad=Pr(j,3); k_anf=Pr(j,4); k_rrc=Pr(j,5); k_rd=Pr(j,6); k2=Pr(j,7); n2=Pr(j,8);
plot_nullclines_0714( k_aa,k_apf,k_ad,k_anf,k_rrc,k_rd,k2,n2, XYlims );
[intersection,A_trough,threshold ]=nullclines_intercept(k_aa,k_apf,k_ad,k_anf,k_rrc,k_rd,k2,n2);
a0=intersection(1); r0=intersection(2);

%%
% diffusion-advection parameters
Pda =[1, 0.1, 300, 5, a0, 2];
% 1-Da; 2-Dr; 3-m0; 4-l; 5-k1; 6-n1
i=1; 
Da=Pda(i,1); Dr=Pda(i,2); m0=Pda(i,3); l=Pda(i,4); k1=Pda(i,5); n1=Pda(i,6);
%%
%dispersion relation
k=1;
f=n1*a0^(n1-1)*k1^n1/(a0^n1+k1^n1)^2;
g=n2*a0^(n2-1)*k2^n2/(a0^n2+k2^n2)^2;
C=k^2*m0*f/(1+l^2*k^2);
tau=C*a0+k_apf*g-k_anf*r0-k^2*(Da+Dr)-k_ad-k_rd;
delta=(-k^2*Da+C*a0+k_anf*g-k_ad-k_anf*r0)*(-k^2*Dr-k_rd)+(C*r0+k_rrc)*k_anf*a0;
[tau delta]

