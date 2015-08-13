function  [sol] = pulse_1d_runpde_tryparameters(Da,Dr,L,l,m0,K,kq,kqq,b,koff,ks,intsect,Amp,plot_fig)
%%
% initialization
T = 10000;       %total time to simulate 
samps = 200;     %number of timepoints to sample solution
xbins = 200;
x = linspace(0,L,xbins);
t = linspace(0,T,samps);

%%
% solve pde
sol = pdepe(0,@pulse_1d_pde,@ic,@bc,x,t,odeset('Reltol',0.001),Da,Dr,L,l,m0,K,kq,kqq,b,koff,ks,intsect,Amp);

%%
% plot the concentration of Rho and Rga as a function of space and time
if plot_fig==1
    % plot concentration of Rho(blue)and Rga(red)
    figure; 
    for i = 1:size(sol,1)
        plot3(t(i)*ones(size(x)),x,sol(i,:,1),'b'); %sol(i,:,1) is conc. of a(Rho) at a time point i
        plot3(t(i)*ones(size(x)),x,sol(i,:,2),'r');  %sol(i,:,1) is conc. of r(Rga) at a time point i
        hold on;
    end
    xlabel('time'); ylabel('space');zlabel('conc.');


end

%%make a movie plotting the concentration profile through time
% figure;
% movind = 1;
% for i = 1:size(c,1)
%     m = m0*(c(i,:).^n)./(K^n+c(i,:).^n);
%     Gr = (cosh((L+x(1)-x)/l)-cosh((x(1)-x)/l))/2/l^2/(cosh(L/l)-1);
%     v(1) = trapz(x,Gr.*m);
%     Gl = (cosh((L-x(end)+x)/l)-cosh((x(end)-x)/l))/2/l^2/(cosh(L/l)-1);
%     v(length(x)) = -trapz(x,Gl.*m);
%     for ind = 2:length(x)-1
%         Gr = (cosh((L+x(ind)-x)/l)-cosh((x(ind)-x)/l))/2/l^2/(cosh(L/l)-1);
%         Gl = (cosh((L-x(ind)+x)/l)-cosh((x(ind)-x)/l))/2/l^2/(cosh(L/l)-1);
%         v(ind) = trapz(x(ind:end),Gr(ind:end).*m(ind:end)) -  trapz(x(1:ind),Gl(1:ind).*m(1:ind));
%     end
%     
%     plot(x,c(i,:));
%     ylim([0 10*c0]);
%     
%     drawnow
%     mov(movind,:) = getframe;
%     movind = movind+1;
% end