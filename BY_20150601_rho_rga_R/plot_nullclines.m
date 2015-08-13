function [ ] = plot_nullclines( a_maxval,kq,kqq,b,koff,ks )
% plot nullclines in phase space and solve steady state
%%
a_nc = [0:0.01:a_maxval];
r_vals_A_nullcline = kq./a_nc.*(1+kqq.*a_nc.^b./(1+a_nc.^b))-koff;
r_vals_R_nullcline = ks.*a_nc;
A_nullcline = plot(a_nc,r_vals_A_nullcline);
set(A_nullcline,'Color','g');
set(A_nullcline,'LineWidth',3);
hold on;
R_nullcline = plot(a_nc,r_vals_R_nullcline);
set(R_nullcline,'Color','r');
set(R_nullcline,'LineWidth',3);
%axis([0 5 0 50]);
end
