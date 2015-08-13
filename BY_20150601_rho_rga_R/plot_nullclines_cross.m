function [ intsect,A_trough,threshold ] = plot_nullclines_cross( a_maxval,kq,kqq,b,koff,ks,plot_fig )
% plot nullclines in phase space and solve steady state
%%
a_nc = [0:0.01:a_maxval];
r_vals_A_nullcline = kq./a_nc.*(1+kqq.*a_nc.^b./(1.+a_nc.^b))-koff;
r_vals_R_nullcline = ks.*a_nc;
intsect = NaN;
A_trough = NaN;
threshold = NaN;

% find the trough of a nullclines
[ymax,imax,ymin,imin] = extrema(r_vals_A_nullcline);
A_nullcline_max = [a_nc(imax); ymax];
A_nullcline_min = [a_nc(imin); ymin];
A_trough = A_nullcline_min(:,1)'; % A_trough = [A_trough_a , A_trough_r];
% find the intersection of nullclines
[intsect_a, intsect_r] = intersections( a_nc,r_vals_A_nullcline,a_nc,r_vals_R_nullcline ); % find intersection (x,y)
intsect = [ intsect_a , intsect_r ];
%calculate threshold
threshold = A_trough-intsect;


% calculate dadt and drdt

a_vals = linspace(0,a_maxval,20);
r_vals = linspace(0,2*ymax(2),40);
[A,R]=meshgrid(a_vals,r_vals);
dim=size(A);
for i=1:dim(1)
    for j=1:dim(2)
        da(i,j)=rhs_dadt(A(i,j),R(i,j),kq,kqq,b,koff);
        dr(i,j)=rhs_drdt(A(i,j),R(i,j),ks);
    end
end

if plot_fig==1
A_nullcline = plot(a_nc,r_vals_A_nullcline);
set(A_nullcline,'Color','g');
set(A_nullcline,'LineWidth',3);
hold on;
R_nullcline = plot(a_nc,r_vals_R_nullcline);
set(R_nullcline,'Color','r');
set(R_nullcline,'LineWidth',3);
axis([0 0.5 0 10]);
plot(A_trough(1),A_trough(2),'k*'); % minum of A nullcline
%axis([0 a_maxval 0 2*ymax(2)]); % 2*ymax(2) is maximum value of r
plot(intsect_a,intsect_r,'bo'); % intersection of A and R nullcline
%quiver(A,R,da,dr);

end
 

% find steady state
%init_values=[1,10];
%timespan=[0:0.01:30];
%options=odeset('Refine',10,'MaxStep',0.01);
%out=ode45(@ode_reactiononly,timespan,init_values,options,kq,kqq,b,koff,ks);
%plot(out.y(1,:),out.y(2,:),'k');
%plot(out.y(1,1),out.y(2,1),'o','MarkerEdgeColor','k','MarkerFaceColor',[.49 1 .63],'MarkerSize',5);
%ss_a = out.y(1,end); ss_r = out.y(2,end);



end
