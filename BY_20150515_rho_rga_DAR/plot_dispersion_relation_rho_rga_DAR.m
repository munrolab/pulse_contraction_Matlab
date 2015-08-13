function []=plot_dispersion_relation_rho_rga_DAR()
% calculate lamda for each k value(k=1:10)
%%
D = 2; %[0.1 0.2 0.3 0.5 0.8 1 2 5 10];
koff = 0.01; %[0.001 0.003 0.005 0.010 0.015 0.020 0.040];
c0 = 5; %[0.2 0.5 0.7 2 3 5 7 10 15];
l = 2; %[1,2,5,10]; % viscosity/friction
m0 = 50;
K = c0;
n = 1;
k=1;
fprintf('\r %.4f / %.4f - %.4f = %.4f \r max of lamda is %.6f\r',...
m0*c0*df_c0, 1./k.^2+l^2, koff+k.^2*D, m0*c0*df_c0./(1./k.^2+l^2)-koff-k.^2*D, max(m0*c0*df_c0./(1./k.^2+l^2)-koff-k.^2*D) );

k=[0:0.01:5];
df_c0=n*c0^(n-1)*K^n/(K^n+c0^n)^2;
lamda = m0*c0*df_c0./(1./k.^2+l^2)-koff-k.^2*D;
%plot(k,lamda,'.'); hold on; plot(k,0,'.r');
k_lamda=[k',lamda'];
%k_lamda_positive=k_lamda([k_lamda(:,2)>0],:);

%%
c0=1:20;
plot(c0,n.*c0.^n.*K^n./(K^n+c0.^n).^2); % to maximize lamda, c0=5

end
