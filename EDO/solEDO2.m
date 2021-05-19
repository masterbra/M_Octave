function [yreal]= solEDO2(dy,yINIT)
  #solEDO2(5.*y.*(1-y))
  #dy=@(x,y) -2.*x.^3 + 12.*x.^2 -20.*x+ 8.5
  #solEDO(dy)
##syms	v(t) c g m
##ys=dsolve(diff(v,t)== (g -(c/m)*v) )
#d=5.*y.*(1-y)

#[yreal]= solEDO2(-1.2*y + 7*exp(-0.3*x),3)
syms	y(x) 
#ys=dsolve(diff(y,t)==5.*y.*(1-y))	
#ys=dsolve(diff(y,x)==d)	
#syms y(x)
DE = diff(y,x)== dy;
yss= dsolve (DE, y(0) == yINIT)
yreal=function_handle(rhs(yss))
endfunction