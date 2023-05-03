function [sistavardet]=testroret3(a,k,n) %ctrl c ctrl v från 1 utan plott
format long
Ta=350;
Tb=20;
r1=1;
r2=2;
h=(r2-r1)/(n+1);


d1=[];
d2=[];
d3=[];

u=[350];
r=r1;
b=zeros(n+1,1);
b(1)=-(((2*r+h)/(2*h^2))*Ta);
for ii= 1:n+1
    a1=(-4*(r+h))/(2*h^2);
    d1=[d1;a1];
    r=r+h;
end

r=r1;

for jj=1:n
    a2=((2*(r+h)+h)/(2*h^2));
    d2=[d2;a2];
    r=r+h;
    
end

r=(1+2*h);
for kk = 1:n
    a3=(2*r-h)/(2*h^2);
    d3=[d3; a3];
    r=r+h;
end


A=diag(d1) + diag(d2, +1) + diag(d3, -1);
A(n+1,n+1)=0;
A(n+1,end-1)= -4/(2*h);
A(n+1,end)=((3/(2*h)) + (a/k));
A(n+1,end-2)=1/(2*h);
b(end)=((a*Tb)/(k));
A=sparse(A);
temp=A\b;

u=[u;temp];
hvec=[1:h:2]';
sistavardet=u(end);
