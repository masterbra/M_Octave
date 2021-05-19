function [] = ODEeuler(a,b,h,y0,EDO,EDOsol)
#Rutina que permite encontrar una aprox de la solucion de una EDO
#METODO DE EULER

#Entrada variables
#a,b, y0 ,h-->tamano de paso
#EDO es la Ecuacion Diferencial que se desea encontrar la solucion
#EDOsol, es la solucion y se la debe colocar si se desea

% Salida variables: 
% x vector de coordenadas x, de punto de solucion
% y vector de coordenadas y, de punto de solucion

#Desarrollo
if nargin < 6
  ban=1
else 
  ban=0
end
#clear
clc;
figure
#primera ecuacion
##a=0;b=2;h=0.2;y0=0.5;
##EDO=@(x,y) y-x^2+1;

#segunda ecuacion
##a = 0 ; b = 2.5 ; h =0.1 ; y0= 3;
##EDO=@(x,y) -1.2*y + 7*exp(-0.3*x);
# yp=@(x)(70/9).*exp(-0.3.*x)-(43/9).*exp(-1.2.*x);

#tercera ecuacion
#a = 0 ; b = 5 ; h =0.05 ; y0= 4;
#EDO=@(x,y) x-y;
#solu# yp=@(x) x-1 + 5*exp(-x);

# ejemplo en clase
# a = 1 ; b = 10 ; h =0.1 ; y0= 5;
#? EDO=@(x,y) y/x + 2*x;
#  yp=@(x,y) 2.*x.^2-(49/5) .* x; # medio mal esta


x(1)=a; y(1)=y0;
n=(b-a)/h; #numero de puntos a evaluar
disp('      i          x(i)             y(i)  ');
disp('-----------------------------------------');
disp(sprintf('      %i          %f        %f ',0,a,y0));
for i=1:n
  x(i+1) = x(i)+h;
  y(i+1) = y(i)+ EDO(x(i),y(i))*h;
  disp(sprintf('      %i          %f        %f ',i,x(i+1),y(i+1)));
endfor

#ploteamos
#solucion real cuando sepamos
if ban == 0
  xp= a:0.1:b;
  yp= EDOsol(xp);
  plot(x,y,'--r',xp,yp);
else
  plot(x,y,'--r');
end
#yp=ysol(xp);
#yp=70/9*exp(-0.3*xp)-43/9*exp(-1.2*xp);
xlabel('x');ylabel('y');
grid on

# ejercicios 31 -->del literal 2.3
# en el punto (0.3)
# a = 0 ; b = 3 ; h =0.1 ; y0= 0;
# EDO=@(x,y) 1+2*y;
# ODEeuler(a,b,h,y0,EDO) 
# sol=@(x) (1/2).*(exp(2.*x)-1);
# ODEeuler(a,b,h,y0,sol)
# h = 0.005


# ejercicios 31 -->del literal 2.3
# en el punto >3
# a = 3 ; b = 4 ; h =0.1 ; y0= 0;
# EDO=@(x,y) -2*y;
# ODEeuler(a,b,h,y0,EDO) 
# sol=@(x)3.*(exp(-2.*x))+6;
# ODEeuler(a,b,h,y0,sol)
# h = 0.005
# hay q hacer


