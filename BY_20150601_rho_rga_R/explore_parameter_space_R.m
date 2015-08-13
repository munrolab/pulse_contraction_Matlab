% pulse_1d_runpde_explore_parameter_space
%%
L = 100;        %domain size
Da = 1;          % "a" is Rho
Dr = 0.1;        % "r" is Rga3
l = 5;          %ratio of viscosity to friction
m0 = 10;
K = 1;  
      
kq = 1;  %1;
kqq = 100; %100;
b = 2;    %2;
koff = 15; %15;
ks = 65;  %65;
a_maxval=5;
noiseAmp = 0.1;
plot_fig=1;
%%
% plot xo - 4 parameters
p1 = [1 10 50];%kqq
p2 = [1 10 50];%kq
p3 = [1 10 50]; %koff
p4 = [1 10 50]; %ks


for i1=1:length(p1)
count = 1;
figure;
for i2=1:length(p2)           
for i3=1:length(p3)           
for i4=1:length(p4) 
kqq=p1(i1); kq=p2(i2); koff=p3(i3); ks=p4(i4); %the variables to vary
%tic
subplot(3,3,count);
plot_nullclines( a_maxval,kq,kqq,b,koff,ks );

%[ intsect,A_trough,threshold ] = plot_nullclines( a_maxval,kq,kqq,b,koff,ks,plot_fig );
%plot_trajectories(L,kq,kqq,b,koff,ks,intsect,noiseAmp);
%[sol] = pulse_1d_runpde_tryparameters(Da,Dr,L,l,m0,K,kq,kqq,b,koff,ks,intsect,noiseAmp,plot_fig);
%peak(i1,i2,i3,i4) = detect_pattern( sol );
%toc
%fprintf('%.2f %% done \r',100*count/(length(p1)*length(p2)*length(p3)*length(p4)));
count = count+1;
end
end
end
end

%%
% plot nuclines - two parameters
p2 = [0.5 1 1.5 2];%kq
p3 = [1 5 10 15 20]; %koff
p4 = [50 60 70 80 90 100]; %kqq
for i2=1:length(p2)
num=1;
kq = p2(i2);
figure; hold on;
for i3=1:length(p3)         
    for i4=1:length(p4)
        koff = p3(i3); kqq = p4(i4);
        subplot(length(p3),length(p4),num);
        [ intsect,A_trough,threshold ] = plot_nullclines( a_maxval,kq,kqq,b,koff,ks,1 );
        if A_trough>0&A_trough<6
            fprintf('%.2f %.2f %.2f %.2f %.2f \r',A_trough,p2(i2),p3(i3),p4(i4));
        end
        title(['p1=',num2str(p3(i3)),';p2=',num2str(p4(i4))]);
        num=num+1;
    end
end
end
%%
% values of parameter to generate a A_nullcline with 0<trough_r<6
% colums: trough_a trough_r kq koff kqq
trough_parameters=[
0.15 2.00 0.50 5.00 50.00 
0.13 2.68 0.50 5.00 60.00 
0.12 3.31 0.50 5.00 70.00 
0.11 3.89 0.50 5.00 80.00 
0.11 4.44 0.50 5.00 90.00 
0.10 4.95 0.50 5.00 100.00 
0.15 4.00 1.00 10.00 50.00 
0.13 5.36 1.00 10.00 60.00 
0.13 0.36 1.00 15.00 60.00 
0.12 1.61 1.00 15.00 70.00 
0.11 2.79 1.00 15.00 80.00 
0.11 3.87 1.00 15.00 90.00 
0.10 4.90 1.00 15.00 100.00 
0.15 1.00 1.50 20.00 50.00 
0.13 3.04 1.50 20.00 60.00 
0.12 4.92 1.50 20.00 70.00 ];
%%
num = 1; 
figure; hold on;
for i=1:16
kq=trough_parameters(i,3); koff=trough_parameters(i,4); kqq=trough_parameters(i,5);
subplot(4,4,num);
[ intsect,A_trough,threshold ] = plot_nullclines( a_maxval,kq,kqq,b,koff,ks,1 );
title(['kq=',num2str(kq),';koff=',num2str(koff),';kqq=',num2str(kqq)]);
num=num+1;
end

%%
