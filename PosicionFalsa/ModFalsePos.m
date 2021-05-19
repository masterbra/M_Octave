function sol= ModFalsePos(f,xl, xu, es, imax)
  iter = 0;
  figure;
  gr=ezplot(f,[xl,xu]);
  grid on;
  hold on;
  set(gr, "linewidth",4); 
  fl = f(xl);
  fu = f(xu);
 xrold = xl;
 iu =0;
 il=0;
 disp ( 'iteration   a          b     (xNS)Solution  f(xNS)    Ea ');
 
 while (1)
   plot([xl,xu],[f(xl),f(xu)],'k--');
    xr = xu - (fu * (xl - xu)) / (fl - fu);
    fr = f(xr);
    iter = iter + 1;
    if xr != 0
      ea = abs((xr - xrold) / xr) * 100;
    endif
    
    fprintf('%3i %11.6f %11.6f %11.7f %11.7f %11.7f\n', iter, xl, xu, xr, fr, es)
    
    test = fl * fr;

    if test < 0 
      xu = xr;
      fu = f(xu);
      iu =0;   
      il = il +1;
      if il >= 2 fl = fl / 2; endif
    elseif  test > 0 
      xl = xr;
      fl = f(xl);
      il = 0;
      iu = iu + 1 ;
      if iu >= 2  fu = fu / 2; endif
    else
      ea = 0;
    endif
        
    if (ea < es || iter >= imax),break,end
   
    xrold = xr;
  endwhile 
   #imprime la raiz
  plot(xr, fr,'ro',"linewidth",2,'markerfacecolor', 'r');
   title('METODO POSICION FALSA MEJORADA');
  text(xr+0.05,0,func2str(f), 'Color','blue','FontSize',10);
  #plot(x,y,'bo-','markerfacecolor', 'b',xad,ymc,'r--','linewidth', 2)
 sol = xr;
end