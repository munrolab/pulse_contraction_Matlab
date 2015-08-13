function [  ] = plot_D_koff( peak,koff,D )
% plot D-koff plane: x-pattern, o-no pattern
% peak is a two dimentional matrix: 
% row represent different values of D
% column represent different values of koff

        hold on;
        [grd_k,grd_D]=meshgrid(koff,D);
        subindexer=0; subindexer=peak>100;
        plot(grd_D(subindexer),grd_k(subindexer),'r.','MarkerSize',10);
        subindexer=0; subindexer=peak<=100;
        plot(grd_D(subindexer),grd_k(subindexer),'k.','MarkerSize',10);
        xlabel('D'); ylabel('koff');
        axis([min(D)-0.1, max(D)+0.1,min(koff)-0.001,max(koff)+0.001]);
        

end

