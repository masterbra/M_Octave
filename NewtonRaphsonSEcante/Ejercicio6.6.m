function y=f(x)
    y=-12-21*x+18*x^2-2.4*x^3;
end

x=-2:0.1:7;
for i=1:91
    h(i)=f(x(i));
end
plot(x,h)