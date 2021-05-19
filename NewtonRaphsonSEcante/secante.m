function [k,x2,v1,error_a]= secante(f1,x0,x1)

fprintf("M?todo de SECANTE \n\n\n");

ezplot(f1,[-10,20]); grid on
#valor verdadero
vv=fzero(f1,x1)
epsi=input("Valor para epsilon: ");
Nuit=input("valor para n?mero maximo de iteraciones: ");
v=f1(x1);
#vp=feval(f2,x0);
error_a=0;
v1=abs(vv-x1);
disp("   k      x       Everdadero      Eaprox(%) ");
out=[0,x1,v1,error_a];
fprintf("%4i %8.9f %8.9f %8.9f\n",out);
for k=1:Nuit
    v=f1(x1);
    x2 =  x1  - v*(x0-x1) /(f1(x0) -v);
    #v=f1(x1);
    error_a= abs( (x2 -x1 )/ x2)*100;
    v1=abs((vv-x2));
    out=[k,x2,v1,error_a];
    fprintf("%4i %8.9f %8.9f %8.9f\n",out);
    if (abs(x2-x1)<epsi || abs(error_a)<epsi)
    break
    end
    x0=x1;x1=x2;
end

hold on
plot(x2,0,"o","MarkerEdgeColor","r", "MarkerFaceColor","r" )





