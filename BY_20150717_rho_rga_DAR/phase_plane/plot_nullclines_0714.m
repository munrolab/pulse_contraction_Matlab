function [ ] = plot_nullclines_0714( k_aa,k_apf,k_ad,k_anf,k_rrc,k_rd,k2,n2, XYlims )
% plot nullclines in phase space and solve steady state
%%
A = [0:0.01:10];
r_vals_A_nullcline = (k_aa+k_apf*(A.^n2./(k2^n2+A.^n2)))./(k_anf*A)-k_ad/k_anf;
r_vals_R_nullcline = k_rrc/k_rd*A;
A_nullcline = plot(A,r_vals_A_nullcline);
set(A_nullcline,'Color','b');
set(A_nullcline,'LineWidth',2);
hold on;
R_nullcline = plot(A,r_vals_R_nullcline);
set(R_nullcline,'Color','r');
set(R_nullcline,'LineWidth',2);
axis(XYlims);
end
