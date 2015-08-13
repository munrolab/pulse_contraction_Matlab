function  dadt  = rhs_dadt( a,r,kq,kqq,b,koff )
%
dadt = kq*(1+kqq*a^b/(1+a^b))-(koff+r)*a;
end

