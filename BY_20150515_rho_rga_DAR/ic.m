function [ ic ] = ic(x,Da,Dr,L,l,m0,K,kq,kqq,b,koff,ks,intsect,Amp) 
    ic = [intsect(1)*(1+Amp*cos(2*pi*x/L));intsect(2)*(1+Amp*cos(2*pi*x/L)); 0];
end

