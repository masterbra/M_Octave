function y=f(x)
  y=((0.8-(0.3*(x)))./x);
endfunction

x=1.5:0.1:4;
plot(x,f(x))
