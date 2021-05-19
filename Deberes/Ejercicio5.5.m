function y=f(x)
  y= sin(x)-x.^2;
endfunction

x=0.5:0.1:1;
plot(x,f(x))
