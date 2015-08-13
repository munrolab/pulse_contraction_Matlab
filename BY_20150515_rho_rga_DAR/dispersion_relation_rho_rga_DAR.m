function [lamda_max]=dispersion_relation_rho_rga_DAR(a0,r0,Da,Dr,m0,l,kq,kqq,koff,ks)
% calculate lamda for each k value(k=1:10)
%%

kq = 1;  %1;
kqq = 60; %100;
b = 2;    %2;
koff = 15; %15;
ks = 65;  %65;
[ intsect,A_trough,threshold ] = plot_nullclines( 3,kq,kqq,b,koff,ks,0 );
a0=intsect(1);
r0=intsect(2);

K = a0;
n = 1;
Da = 1;          % "a" is Rho
Dr = 0.1;        % "r" is Rga3
l = 5;          %ratio of viscosity to friction
m0 = 10;

k=0:0.1:5;
num_k=length(k);
u=m0./(1./k.^2+l^2);
v=a0*n*a0^(n-1)*K^n/(K^n+a0^n)^2; % v = n/4 if K=a0
[(v*u*r0+ks*a0),(1+k.^2*Dr), v.*(u+kq*kqq/a0),(k.^2*Da+koff+r0)]
judge(2,1:num_k)=v.*(u+kq*kqq/a0)-(k.^2*Da+koff+r0);
judge(1,1:num_k)=(v*u*r0+ks*a0)/(1+k.^2*Dr);
judge(3,1:num_k)=1+k.^2*Dr;
judge
%%






















%c0,m0,l,koff,D 
% 5,50,2,0.01,2

K = c0;
n = 1;
% when k=1; calculate lamda; look at the effect of changing one parameter
k=1;
f_c0=c0*n*c0^(n-1)*K^n/(K^n+c0^n)^2;
lamda_parts=[m0*f_c0, 1/k^2+l^2, koff+k^2*D];
lamda=lamda_parts(1)/lamda_parts(2)-lamda_parts(3);
fprintf('\r %.4f / %.4f - %.4f = %.4f \r',lamda_parts(1),lamda_parts(2),lamda_parts(3),lamda);

% for different k values,find max value of lamda
k=[0:0.01:5];
f_c0=c0*n*c0^(n-1)*K^n/(K^n+c0^n)^2; % f_c0 always = n/4
lamda = m0*f_c0./(1./k.^2+l^2)-koff-k.^2*D;
lamda_max = max(lamda);
fprintf('max of lamda is %.6f\r', lamda_max );

%plot(k,lamda,'.'); hold on; plot(k,0,'.r');
%k_lamda=[k',lamda'];
%k_lamda_positive=k_lamda([k_lamda(:,2)>0],:);

%%
% when n=1; to maximize lamda, c0=5
%{
c0=1:20;
plot(c0,n.*c0.^n.*K^n./(K^n+c0.^n).^2); 
%}
end

