function[sol] = maclaurin(x,ter)
clc;
#format long
sol=0;
for i=0:ter-1
  s=x^i/factorial(i)
  sol = sol + s;
end

end
