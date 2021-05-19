function[] = posicionfalsa(F,a,b,tol,imax)
%%% POSICION FALSA %%%%%%%%%%%%
% POR: FRANCO SALCEDO%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
##clear all
##clc
##F =@ (x) 8-4.5*(x-sin(x));
##ezplot(F,[0,4]) 
##a = 2; b = 3; imax = 20; tol = 0.001; 
##F = @(x) ((9.8*68.1)./x ).* (1-exp(-(x/68.1)*10)) -40;
##ezplot(F,[10,20])
##a = 12; b = 16; imax = 20; tol = 0.005;
##F = @(x) x.^10 -1;
##a = 0; b = 1.3; imax = 20; tol = 0.005;

Fa = F(a);
Fb = F(b);
 figure;
gr= ezplot(F,[a,b]);
  grid on;
  hold on;
  set(gr, "linewidth",4); 
ant=a;

if Fa*Fb > 0
  disp('Error:La función tiene el mismo signo en los puntos a y b. ') 
    else
    disp ( 'iteration   a          b     (xNS)Solution  f(xNS)    Ea ') 
    for i = 1:imax
        plot([a,b],[F(a),F(b)],'k--');
        Fa = F(a);
        Fb = F(b);
        xNS= b - (Fb*(a-b))/ (Fa -Fb);
        toli = (b - a)/2;
        FxNS = F(xNS);
        fprintf('%3i %11.6f %11.6f %11.7f %11.7f %11.7f\n', i, a, b, xNS, FxNS, abs(((xNS-ant)/xNS))*100)
        if FxNS == 0 
          fprintf ('Una solución exacta =%11.6f fue encontrada\n' ,FxNS)
          break
        end
        if toli < tol 
          break
        end
        if i == imax 
          fprintf ('Solución no fue obtenida en %i iteraciones\n' ,imax)
          break
        end
         if F(a)*FxNS < 0 
          b = xNS;
        else 
          a = xNS;
        end 
        ant=xNS;
    end 
  #imprime la raiz
 
   plot(xNS, FxNS,'ro',"linewidth",2,'markerfacecolor', 'r');
    title('METODO POSICION FALSA');
    text(xNS+0.05,0,func2str(F), 'Color','blue','FontSize',10);
  #".", "linewidth", 0.5
end

end