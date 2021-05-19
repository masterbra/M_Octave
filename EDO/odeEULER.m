function [x, y] = odeEULER(ODE,a,b,h,yINI)
% odeEULER soluci�n a una EDO de primer orden con PVI (Problema de Valor Inicial) 
% variables de entrada: 
% ODE funci�n (x,y) --> dy/dx. 
% a valor inicial de x 
% b valor final de x. 
% h tama�o de paso
% yINI valor y(x0) = y(0) 
% variables salida: 
% x Vector con las coordenadas en x de la soluci�n. 
% y Vector con las coordenadas en y de la soluci�n.
#syms y(x)

x(1) = a; y(1) = yINI;
N = (b - a)/h; %n�mero de segmentos
disp('  i     x(i)      y(i)Euler           Eaprox ');
disp('----------------------------------------------------------');
for i=1:N 
  x(i+1) = x(i) + h;
  y(i+1) = y(i) + ODE(x(i),y(i))*h; 
  disp(sprintf(' %i     %6.5f     %6.5f         %6.5f        %6.5f ',i,x(i+1),y(i+1),  ( y(i+1)-y(i) )/y(i+1)*100  ));
end 

plot(x,y,'--r');

title('METODO EULER ');
xlabel ('x');
ylabel ('y(x)')

grid on
endfunction


