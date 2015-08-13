function [intersection,A_trough,threshold ]=nullclines_intercept(k_aa,k_apf,k_ad,k_anf,k_rrc,k_rd,k2,n2)
%%
A = [0:0.01:1];
r_vals_A_nullcline = (k_aa+k_apf*(A.^n2./(k2^n2+A.^n2)))./(k_anf*A)-k_ad/k_anf;
r_vals_R_nullcline = k_rrc/k_rd*A;
intersection = NaN;
A_trough = NaN;
threshold = NaN;

% find the trough of a nullclines
[ymax,imax,ymin,imin] = extrema(r_vals_A_nullcline);
A_nullcline_max = [A(imax); ymax];
A_nullcline_min = [A(imin); ymin];
A_trough = A_nullcline_min(:,1)'; % A_trough = [A_trough_a , A_trough_r];
% find the intersection of nullclines
[intsect_a, intsect_r] = intersections( A,r_vals_A_nullcline,A,r_vals_R_nullcline ); % find intersection (x,y)
intersection = [ intsect_a , intsect_r ];
%calculate threshold
threshold = A_trough-intersection;
%%
%{
figure; 
A_nullcline = plot(A,r_vals_A_nullcline);
set(A_nullcline,'Color','g');
set(A_nullcline,'LineWidth',3);
hold on;
R_nullcline = plot(A,r_vals_R_nullcline);
set(R_nullcline,'Color','r');
set(R_nullcline,'LineWidth',3);
axis([0 0.5 0 10]);
plot(A_trough(1),A_trough(2),'k*'); % minum of A nullcline
hold on;
plot(intsect_a,intsect_r,'bo'); % intersection of A and R nullcline
%}

end