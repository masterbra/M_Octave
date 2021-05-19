function[] = serie(x,vv,es,maxit)
% inicialización
#serie(0.5,1.648721, 0.0005,10)
clc;
format long
iter = 0;
sol = 0;
ea=0;
% cálculo iteractivo
fprintf('iter    valor_aprox(%%)       error relativo(%%)       error aprox\n');
#disp('iter   valor_aprox(%)        error relativo(%)      error aprox');
disp('---------------------------------------------------------------');
while (1)
  solold = sol;
  sol = sol + x ^ iter / factorial(iter);
  iter = iter + 1;
  if sol~=0
    et=abs((vv-sol)/vv)*100;
    ea=abs((sol - solold)/sol)*100;
  end
  fprintf('%1.0f %20.14f %20.10f %20.10f\n',iter, sol,et,ea);
  if (ea<=es || iter>=maxit),break,end
endwhile

end
