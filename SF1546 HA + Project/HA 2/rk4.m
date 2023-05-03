function [t,y]= rk4(u0,T,n)
m=0.6;
micro=0.2;
g=9.81;
L=1.5;
h=T/n
t=0


f=@(t,u0) [u0(2);-(micro/m)*u0(2)-(g/L)*sin(u0(1))];

yvec=u0';
tvec=t;
uny=u0;

for j=1:n
    k1= f(t,uny);
    k2= f(t+h/2,uny+(h/2)*k1);
    k3= f(t+h/2,uny+(h/2)*k2);
    k4= f(t+h,uny+h*k3);
    uny=uny+(h/6)*(k1+2*k2+2*k3+k4);
    t= t+h;
    yvec=[yvec; uny'];
    tvec=[tvec; t];
end
plot(tvec,yvec(:,1),'--o',tvec,yvec(:,2),'--or'); 
format long
y=yvec
