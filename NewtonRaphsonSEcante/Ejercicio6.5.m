function y=f(x)
    y=-1+5.5*x-4*x^2+0.5*x^3;
end

x=0:0.1:7;
for i=1:71
    y(i)=f(x(i));
    d1(i)=-0.0144*x(i)+f(4.52)+0.0144*4.52;
    d2(i)=0.0974*x(i)+f(4.54)-0.0974*4.54;
end

plot(x,y)

hold on
plot(x,d1)
plot(x,d2)
hold off