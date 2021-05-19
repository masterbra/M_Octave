function y=f(x)
    y=tanh(x^2-9);
end

function y=df(x)
    y=2*x/(cosh(x^2-9))^2;
end

for i=1:41
    y(i)=f(x(i));
end
plot(x,y)
hold on

for i=1:41
    d1(i)=df(3.2)*x(i)+f(3.2)-df(3.2)*3.2;
end
plot(x,d1)
for i=1:41
    d2(i)=df(2.73682)*x(i)+f(2.73682)-df(2.73682)*2.73682;
end
plot(x,d2)
for i=1:41
    d3(i)=df(3.6702)*x(i)+f(3.6702)-df(3.6702)*3.6702;
end
plot(x,d3)