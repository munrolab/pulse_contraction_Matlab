function [c, f, s] = pulse_1d_pde(x,t,u,dudx,Da,Dr,L,l,m0,K,kq,kqq,b,koff,ks,intsect,Amp)
    a = u(1);
    r = u(2);
    v = u(3);
    dadx = dudx(1);
    drdx = dudx(2);
    dvdx = dudx(3);
    n=1;
    m = m0*(a.^n)./(K^n+a.^n);
        
    c = [1;1;0];
    
    f = [Da*dadx - a*v; ...
         Dr*drdx - r*v; ...
         l^2*dvdx + m];
    
    s = [kq*(1+kqq*a^b/(1+a^b))-(koff+r)*a; ... %reaction terms. b is Hill_coefficient
         ks*a-r; ... 
         -v];
     
%    f = [Da*dadx - a*v; ...
%         Dr*drdx - r*v; ...
%         l^2*dvdx + m];
    
%    s = [kq*(1+kqq*a^b/(1+a^b))-(koff+r)*a; ... %reaction terms. b is Hill_coefficient
%         ks*a-r; ... 
%         -v];
    
end
