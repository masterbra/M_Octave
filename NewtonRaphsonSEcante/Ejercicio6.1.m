x=-1:0.2:5;
for i=1:31
    y(i)=f(x(i));
end
plot(x,y)

function y=f(x)
    y=2*x^3-11.7*x^2+17.7*x-5;
end