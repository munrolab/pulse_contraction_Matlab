function  dxdt  = ode_reactiononly( t,x,kq,kqq,b,koff,ks )
%
a = x(1);
r = x(2);
dxdt(1,1) = kq.*(1.+kqq.*a.^b./(1.+a.^b))-(koff+r).*a;
dxdt(2,1) = ks.*a-r;

end

