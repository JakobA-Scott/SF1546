function xrot = newton(x0,tau)
%x=[2.00,2.75,3.86,4.90,6.01,6.84]
f= @(x) x^2 -9*x - 12*sin(3*x+1) + 20 ;
fprim= @(x) 2*x -9 - 36*cos(3*x+1);
xnew = f(x0);
x = x0;
diffv = abs(f(x));
while diffv > tau
    xnew = x - f(x)/fprim(x);
    diffv = abs(f(x));
    disp([(xnew), abs(f(x))]);
    x = xnew;
    
end
format long, xrot=xnew;
end