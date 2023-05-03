function [t,y]= kulan2()
h=0.05;
v0=0.9;
m=1;
H=1.8;
a=pi/5;
R=H*tan(a);
g=9.81;
u0=[R; 0; 0; v0/R];
uny=u0;
t=0;
T=125;
n=T/h;
zmat=u0(1)/tan(a);
tmat=0;


[tid,u1]=ode45(@fkula,[t,T],u0');


zode =  u1(:,1)/tan(a);
Lode = u1(:,1).^2.*u1(:,4);

v=(u1(:,3).^2 + (u1(:,1).*u1(:,4)).^2 + (u1(:,3)./tan(a)).^2).^0.5;
Eode = ((v.^2)./2) + (g.*zode);

Lvec=R.^2*v0/R;
Tvec=t;
Evec = ((v0)^2)./2 + g.*u0(1)./tan(a);

for j=1:n
    k1= fkula(t,uny);
    k2= fkula(t+h/2,uny+(h/2)*k1);
    k3= fkula(t+h/2,uny+(h/2)*k2);
    k4= fkula(t+h,uny+h*k3);
    uny=uny+(h/6)*(k1+2*k2+2*k3+k4);
    t= t+h;
    
    
    zvec=uny(1)/tan(a);
    zmat=[zmat; zvec];
    tmat=[tmat; t];
    v2=((uny(3).^2) + (uny(1).*uny(4)).^2 + ((uny(3)./tan(a))).^2).^(0.5);
    Lvec = [Lvec; uny(1).^2.*uny(4)];
    Evec = [Evec; ((v2).^2)./2 + g.*uny(1)./tan(a)];
    Tvec = [Tvec; t];
end

%plot(Tvec,Lvec);
h=0.01;
v0=0.9;
m=1;
H=1.8;
a=pi/5;
R=H*tan(a);
g=9.81;
u0=[R; 0; 0; v0/R];
uny=u0;
t=0;
T=125;
n=T/h;
Lvec2=R.^2*v0/R;
Tvec2=t;
Evec2 = (((v0)^2)/2) + g.*u0(1)./tan(a);
for j=1:n
    k1= fkula(t,uny);
    k2= fkula(t+h/2,uny+(h/2)*k1);
    k3= fkula(t+h/2,uny+(h/2)*k2);
    k4= fkula(t+h,uny+h*k3);
    uny=uny+(h/6)*(k1+2*k2+2*k3+k4);
    t= t+h;
    
    
    
    v2=((uny(3).^2 + (uny(1).*uny(4)).^2 + (uny(3)./tan(a)).^2).^0.5);
    Lvec2 = [Lvec2; uny(1).^2.*uny(4)];
    Evec2 = [Evec2;((v2).^2)./2 + g.*uny(1)./tan(a)];
    Tvec2=[Tvec2; t];
end


plot(tid,Lode,Tvec,Lvec,Tvec2,Lvec2)
legend('Lode','Lvec1rk41','Lvecrk42')
xlabel('tid');
ylabel('Normal kraft (Newton)')
figure
plot(tid,Eode,Tvec,Evec,Tvec2,Evec2);
legend('Eode','Evecrk41','Evecrk42')
xlabel('tid');
ylabel('Total energi (joule)')

end



