function xrot = fixpunkt(x0,tau)
%x=[2.00,2.75,3.86,4.90,6.01,6.84]
f= @(x) (1/20)*x^2 + (11/20)*x - (3/5)*sin(3*x+1) + 1 ;
xnew=f(x0);
x=x0;
diffv = abs(xnew - x);


while diffv > tau
    xnew=f(xnew);
    diffv = abs(xnew - x);
    disp([(xnew), (abs(xnew - x))]);
    x=xnew;
    
end
format long, xrot = xnew; 
end
