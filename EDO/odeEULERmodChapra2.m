function [x, y] = odeEULERmodChapra2(ODE,sol,a,b,h,yINI)
% odeEULER solución a una EDO de primer orden con PVI (Problema de Valor Inicial) 
% variables de entrada: 
% ODE función (x,y) --> dy/dx. 
% a valor inicial de x 
% b valor final de x. 
% h tamaño de paso
% yINI valor y(x0) = y(0) 
% variables salida: 
% x Vector con las coordenadas en x de la solución. 
% y Vector con las coordenadas en y de la solución.
x(1) = a; y(1) = yINI;
N = (b - a)/h; %número de segmentos
vt(1)=sol(x(1));

disp('  i     x(i)      y(i)EulerPmedio       y(i)Verd         Er%% ');
disp('----------------------------------------------------------');
for i=1:N 
  x(i+1) = x(i) + h;
  ym(i+1) = y(i) + ODE(x(i),y(i))*h/2; 
  y(i+1) = y(i) + ODE(x(i)+h/2,ym(i+1))*h;
  vt(i+1)=sol(x(i+1));
  disp(sprintf(' %i     %6.5f     %6.5f         %6.5f        %6.5f ',i,x(i+1),y(i+1), vt(i+1) , ( vt(i+1)-y(i+1) )/vt(i+1)*100  ));
end 
%12.6f
#xp=a:0.1:b;
#yp=yv(xp,0);
plot(x,y,'--r',x,vt);
legend("Aprox","Verdadera",'location','northwest');
title('METODO EULER MODIFICADO (Punto Medio) ');
xlabel ('x');
ylabel ('y(x)')

grid on
endfunction

