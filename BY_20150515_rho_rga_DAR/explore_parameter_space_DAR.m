% 
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
a_maxval=3;
noiseAmp = 0.1;
plot_fig=1;
%%
p1 = trough_parameters(1:4);%reaction parameters
p2 = [5 10];%[2 5 10 20 40];%l
p3 = [5 20];%[5 10 20 30 40]; %m0
p4 = [2];%[0.5,1,1.5,2,2.5]; %Da

count = 1;
for i1=1:size(p1,1)         
kq=trough_parameters(i1,3); koff=trough_parameters(i1,4); 
kqq=trough_parameters(i1,5); ks=trough_parameters(i1,6);
tic;
for i2=1:length(p2)           
for i3=1:length(p3)           
for i4=1:length(p4) 
l=p2(i2); m0=p3(i3); Da=p4(i4); %the variables to vary
[ intsect,A_trough,threshold ] = plot_nullclines( a_maxval,kq,kqq,b,koff,ks,0 );
%plot_trajectories(L,kq,kqq,b,koff,ks,intsect,noiseAmp);
[sol] = pulse_1d_runpde_tryparameters(Da,Dr,L,l,m0,K,kq,kqq,b,koff,ks,intsect,noiseAmp,plot_fig);
%peak(i1,i2,i3,i4) = detect_pattern( sol );
fprintf('%.2f %% done \r',100*count/(length(p1)*length(p2)*length(p3)*length(p4)));
count = count+1;
end
end
end
toc;
end

%%
% plot whether a pattern forms in the end
figure;
num=1;
for i1=1:length(p1)         
    for i2=1:length(p2)
        subplot(length(p1),length(p2),num);
        plot_D_koff(peak(i1,i2,:,:),p3,p4);
        title(['reaction_parameters=',num2str(p1(i1)),'l=',num2str(p2(i2))]);
        num=num+1;
    end
end
%%
[lamda_max]=dispersion_relation_rho_rga_DAR(a0,r0,Da,Dr,m0,l,kq,kqq,koff,ks);



