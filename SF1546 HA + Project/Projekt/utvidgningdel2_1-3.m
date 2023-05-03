function [u_slut]=utvidgningdel2_1(n,L) %uppgift 2.2
format long
Ta=350;
Tb=20;
r1=1;
r2=L; %skiktets tjocklek
k_noll=50;
k_ett=3;
a=15;
h=(r2-r1)/(n+1); %steglängden
s=1/50;

k=@(r) k_noll + (k_ett-k_noll)*(1/2 + 1/pi*atan((r-2)/s)); 
kprim=@(r) ((k_ett-k_noll)/(pi*s))*(1/(1+(((r-2)/s)^2))); %derivatan av k


d1=[]; %tre tomma listor att fylla med värden
d2=[];
d3=[];

u=[350];
r=r1+h;
b=zeros(n+1,1);
b(1)=-Ta*(r/h^2 - 1/(2*h) - (r.*kprim(r)/(k(r)*2*h)));

for ii= 1:n+1 %mittendiagonal
    a1=(-4*(r))/(2*h^2);
    d1=[d1;a1];
    r=r+h;
end

r=r1+h;

for jj=1:n %överdiagonal
    a2=(2*(r) + (1+((r)*kprim(r))/k(r))*h)/(2*h^2);
    d2=[d2;a2];
    r=r+h;
    
end

r=(1+2*h);
for kk = 1:n %underdiagonal
    a3=(2*(r) - (1+((r)*kprim(r))/k(r))*h)/(2*h^2);
    d3=[d3; a3];
    r=r+h;
end


A=diag(d1) + diag(d2, +1) + diag(d3, -1); %matrisen 

A(n+1,n+1)=0;
A(n+1,end-1)= -4/(2*h);
A(n+1,end)=((3/(2*h)) + (a/k(L)));
A(n+1,end-2)=1/(2*h);
b(end)=(a*Tb)/(k(L));

A=sparse(A);
temp=A\b;
u=[u;temp];
hvec=[1:h:L]';
u_slut=u(end); %sluttemperaturen