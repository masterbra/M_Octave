function [x,fx,xx]=newton2(f,df,x0,TolX,MaxIter)
% To solve f(x)=0 by using the Newton method.
% Input: f = Function to be given as a function handle or an M-file % df = df(x)/dx (If not given, numerical derivative is used.)
% x0 = Initial guess of the solution
% TolX = Upper limit of |x(k)-x(k-1)|
% MaxIter = Maximum # of iteration
% Output: x = Point which the algorithm has reached
% fx = f(x(last)): Residual error, xx = History of x
#f42=@(x)tan(pi-x)-x;
#x0=1.8; TolX=1e-5; MaxIter=50
##f45=@(x) exp(-x) -x;
##x0=0; TolX=1e-5; MaxIter=50
 figure;
 gr=ezplot(f);
  grid on;
  hold on;
 set(gr, "linewidth",4);

h=1e-4; h2=2*h; TolFun=eps;
if nargin==4 && isnumeric(df), MaxIter=TolX; TolX=x0; x0=df; end
xx(1)=x0; fx=feval(f,x0);
#calcula la derivada
syms x
df=function_handle(diff(f,x,1))
###########################
k=0;
dfdx=0;
disp('______________________________________________________________')
disp('  iter   x            f(x)        df(x)          |xn+1-xn|    ')
disp('______________________________________________________________')
fprintf('%2.0f  %12.6f  %12.6f  %12.6f\n', k, x0, fx, dfdx)
for k=1:MaxIter
  
  if ~isnumeric(df), dfdx=feval(df,xx(k)); % Derivative function
  else   dfdx=(feval(f,xx(k)+h)-feval(f,xx(k)-h))/h2; %Numerical derivative
  end
  dx=-fx/dfdx;
  xx(k+1)=xx(k)+dx; % Ecuacion 
  fx= feval(f,xx(k+1));
  
  if abs(fx)<TolFun|abs(dx)<TolX, break; end
  fprintf('%2.0f  %12.6f  %12.6f  %12.6f  %12.6f\n',k,xx(k),fx,dfdx,abs(xx(k+1)-xx(k)));
  plot([xx(k),xx(k+1)],[f(xx(k)),0],'k--');
end
plot(xx(k+1), fx,'ro',"linewidth",2,'markerfacecolor', 'r');
x=xx(k+1);
if k==MaxIter, fprintf('The best in %d iterations\n',MaxIter), end