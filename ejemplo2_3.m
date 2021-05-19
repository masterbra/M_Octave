x = linspace(0,pi,40); 
y = sin(x);
y2 = x;
y4 = x - x.^3/factorial(3);
y6 = x - x.^3/factorial(3) + x.^5/factorial(5);
plot(x,y, 'r',x,y2,'k--',x,y4,'k-.',x,y6,'r--') 
axis([0,4,-2,2])
legend('Exact' ,'Two terms' ,'Four terms' ,'Six terms') 
xlabel('x');ylabel('y')
grid on

syms x
#f =@(x) exp(x);
f =@(x) sin(x);
taylor(f, x, 0, 'order', 4)