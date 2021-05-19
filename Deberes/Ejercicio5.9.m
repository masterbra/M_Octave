function y=f(x)
  y=(x.^2).*(cos (sqrt(x)))-5
endfunction

x=0:0.1:5;
plot(x,f(x))