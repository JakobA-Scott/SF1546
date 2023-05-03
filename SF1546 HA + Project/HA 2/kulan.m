function [t,y]= kulan()
v0=0.9;
m=1;
H=1.8;
a=pi/5;
R=H*tan(a);

u0=[R; 0; 0; v0/R];
yvec = u0';
uny=u0;
tvec=0
t=0;
T=5;
h=0.05;
n=T/h;
xmat=R; %ska vi ha 0 eller R här
ymat=0;
zmat=u0(1)/tan(a);
tmat=0;

[tid,u1]=ode45(@fkula,[t,T],u0');
xode =  u1(:,1).*cos(u1(:,2));
yode =  u1(:,1).*sin(u1(:,2));

for j=1:n
    k1= fkula(t,uny);
    k2= fkula(t+h/2,uny+(h/2)*k1);
    k3= fkula(t+h/2,uny+(h/2)*k2);
    k4= fkula(t+h,uny+h*k3);
    uny=uny+(h/6)*(k1+2*k2+2*k3+k4);
    t= t+h;
    
    xvec=uny(1)*cos(uny(2));
    yvec=uny(1)*sin(uny(2));
    zvec=uny(1)/tan(a);
    xmat = [xmat; xvec] ;
    ymat=[ymat; yvec];
    zmat=[zmat; zvec];
    tmat=[tmat; t];
end


plot(xmat,ymat,'r',xode,yode,'g')
figure
plotkula(xmat,ymat,zmat,1);hold on;


end
