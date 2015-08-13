clear
kq = 1;  %1;
kqq = 100; %100;
b = 2;    %2;
koff = 15; %15;
ks = 65;  %65;
a_maxval=3;
noiseAmp = 0.1;
plot_fig=1;
[ intsect,A_trough,threshold ] = plot_nullclines( a_maxval,kq,kqq,b,koff,ks,plot_fig );
out=plot_trajectories(5,kq,kqq,b,koff,ks,intsect,noiseAmp);
%%
figure; hold on;
for i=1:20
if max(out(i).y(1,:))>1
    out(i).pulse=1;
    plot(out(i).x,out(i).y(1,:),'b');
else
    out(i).pulse=0;
    plot(out(i).x,out(i).y(1,:),'r');
end


end
xlim([0 5]);
xlabel('time','FontSize',15);
ylabel('concentration of a','FontSize',15);

