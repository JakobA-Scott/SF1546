function [output1] = simpson(n)
y=@(x) (8/((2+x^2)*(6-3*cos(pi*x)))).^2;
h=(2.8-0) / n;
k=y(0) + y(2.8);
for t = 1:2: n-1 %udda termer
    k=k + 4*y(0 + t*h);
end
for i=2:2:n-2 %jämna termer
    k=k + 2*y(0 + i*h);
end
I=pi*(h/3)*k;
V=I;
output1=V
end

