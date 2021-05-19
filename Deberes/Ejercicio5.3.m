function y=f(x)
y=-25+(82*(x))-(90*(x.^2))+(44*(x.^3))-(8*(x.^4))+(0.7*(x.^5));
endfunction

x=0.5:0.1:1;
plot(x,f(x))