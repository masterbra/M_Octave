%nm125_3.m: reduce the roundoff error using Taylor series
f3=@(x)(exp(x)-1)/x; % LHS of Eq.(1.2.22)
#f4=@(x)((x/4+1)*x/3)+x/2+1; % RHS of Eq.(1.2.22)
f4=@(x)((x/4+1)*x^2/6)+x/2+1;
#f4=@(x) 1+ x/2+ x^2/6+x^3/24;
x=0;
tmp=1;
for k1=1:12
  tmp=tmp*0.1; x1=x+tmp;
  fprintf('At x=%14.12f, ', x1)
  fprintf('f3(x)=%18.12e; f4(x)=%18.12e\n', f3(x1),f4(x1));
end