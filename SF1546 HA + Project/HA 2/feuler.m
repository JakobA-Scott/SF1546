function [t,y]= feuler(u0,T,n)
m=0.6;
micro=0.2;
g=9.81;
L=1.5;
h=T/n;
t=0;


f=@(t,u0) [u0(2);-(micro/m)*u0(2)-(g/L)*sin(u0(1))];

yvec=u0';
tvec=t;
uny=u0;

for j=1:n
    uny=uny + h*f(t,uny);
    t= t+h;
    yvec=[yvec; uny'];
    tvec=[tvec; t];
end
plot(tvec,yvec(:,1),'--o',tvec,yvec(:,2),'--or'); axis equal
y=yvec
