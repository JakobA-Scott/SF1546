function [output2] = trapets(n)
y=@(x) (8/((2+x^2)*(6-3*cos(pi*x)))).^2;
h=(2.8-0) / n;
k=(y(0) + y(2.8))/2;
for t = 1: n-1
    k=k + y(0 + t*h);
end
I= pi*(h)*k;
V=I;
output2=V
end
