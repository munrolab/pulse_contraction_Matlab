% explore_parameter_space
D = [0.1 0.2 0.3 0.5 0.8 1 2 5 10];
koff = [0.001 0.003 0.005 0.010 0.015 0.020 0.040];
c0 = [0.2 0.5 0.7 2 3 5 7 10 15];
l = [1,2,5,10]; % viscosity/friction
m0 = [1,5,10,20];
plot_fig=0;
%%
for i_c0=1:length(c0)

count=1;
for i_m0=1:length(m0)         %m0
for i_l=1:length(l)           %l
for i_D=1:length(D)           %D
for i_koff=1:length(koff)     %koff
sol = active_1d_runpde_tryparameters( D(i_D),koff(i_koff),c0(i_c0),l(i_l),m0(i_m0),plot_fig );
peak(i_m0,i_l,i_D,i_koff) = detect_pattern( sol );
fprintf('%.2f %% done \r',100*count/(length(m0)*length(l)*length(D)*length(koff)));
count = count+1;
end
end
end
end
c0_peaks{i_c0}=peak;
end

%%
% plot whether a pattern forms in the end
for i_c0=1:length(c0)
peak=c0_peaks{i_c0};
figure;
num=1;
for i_m0=1:length(m0)         
    for i_l=1:length(l)
        subplot(length(m0),length(l),num);
        plot_D_koff(squeeze(peak(i_m0,i_l,:,:)),koff,D);
        title(['m0=',num2str(m0(i_m0)),';l=',num2str(l(i_l))]);
        num=num+1;
    end
end
c0(i_c0)
end

%%
figure; hold on;

for i_c0=1:length(c0)
peak=c0_peaks{i_c0};
sum_peaks=[];
count=1;
for i_m0=1:length(m0)         %m0
for i_l=1:length(l)          %l
for i_D=1:length(D)           %D
for i_koff=5 %1:length(koff)
sum_peaks(count,1:5)=[m0(i_m0),l(i_l),D(i_D),koff(i_koff),peak(i_m0,i_l,i_D,i_koff)];
count = count+1;
end
end
end
end
sum_peaks(:,6)=sum_peaks(:,1)./(sum_peaks(:,3).*(1+sum_peaks(:,2).^2));
for i=1:size(sum_peaks,1)
x_val = sum_peaks(i,6);
y_val = c0(i_c0);
if sum_peaks(i,5)>100
    plot(x_val,y_val,'r.','MarkerSize',10);
end
if sum_peaks(i,5)<100
    plot(x_val,y_val,'k.','MarkerSize',10);
end
end
end

%%
% plot sample pattern formation
D = 2; %[0.1 0.2 0.3 0.5 0.8 1 2 5 10];
koff = 0.01; %[0.001 0.003 0.005 0.010 0.015 0.020 0.040];
c0 = 2; %[0.2 0.5 0.7 2 3 5 7 10 15];
l = 5; %[1,2,5,10]; % viscosity/friction
m0 = 20; %[1,5,10,20];
plot_fig=1;
sol = active_1d_runpde_tryparameters( D,koff,c0,l,m0,plot_fig );

%%
c0 = 1; %[0.2 0.5 0.7 2 3 5 7 10 15];
D = 2; %[0.1 0.2 0.3 0.5 0.8 1 2 5 10];
koff = 0.01; %[0.001 0.003 0.005 0.010 0.015 0.020 0.040];
l = 2; %[1,2,5,10]; % viscosity/friction
m0 = 15; %[1,5,10,20];
[lamda_max]=dispersion_relation_rho_DA(c0,m0,l,koff,D);


