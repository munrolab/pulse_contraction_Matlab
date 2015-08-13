function [out] = plot_trajectories(L,kq,kqq,b,koff,ks,intsect,Amp)
% ic for pedpe: intsect(1)-0.01*cos(2*pi*x/L)
% add noise to steadystate as initial condition
% plot a trajectory
%%
% add perturbation in Rho from steady state
x = linspace(0,L,20);
noise = [Amp.*cos(2*pi*x/L) 0];
hold on;
for i=1:length(x)/2
init_values = intsect + [noise(i),0];
timespan=[0:0.01:30];
options=odeset('Refine',10,'MaxStep',0.01);
out1(i)=ode45(@ode_reactiononly,timespan,init_values,options,kq,kqq,b,koff,ks);
plot(out1(i).y(1,:),out1(i).y(2,:),'k');
plot(out1(i).y(1,1),out1(i).y(2,1),'o','MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',5);
end
%%
% add perturbation in Rga from steady state
x = linspace(0,L,20);
noise = [20*Amp.*cos(2*pi*x/L) 0];
hold on;
for i=1:length(x)/2
init_values = intsect + [0,noise(i)];
timespan=[0:0.01:30];
options=odeset('Refine',10,'MaxStep',0.01);
out2(i)=ode45(@ode_reactiononly,timespan,init_values,options,kq,kqq,b,koff,ks);
plot(out2(i).y(1,:),out2(i).y(2,:),'k');
plot(out2(i).y(1,1),out2(i).y(2,1),'o','MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',5);
end
%%
out=[out1,out2];
end
