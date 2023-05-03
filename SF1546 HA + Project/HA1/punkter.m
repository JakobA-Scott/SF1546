function xrot =punkter(x0,ra,rb,a,b,tau)

x1=x0(1);
y1=x0(2);
x2=x0(3);
y2=x0(4);
xa=a(1);
ya=a(2);
xb=b(1);
yb=b(2);

f=[(x1-xa).^2+(y1-ya).^2-(ra).^2
    (x2-xb).^2+(y2-yb).^2-(rb).^2
    (x1-x2).*(x1-xa)+(y1-y2).*(y1-ya)
    (x1-x2).*(x2-xb)+(y1-y2).*(y2-yb)];

J=[2.*(x1-xa),2.*(y1-ya),0,0
    0,0,2.*(x2-xb),2.*(y2-yb)
    2.*x1-xa-x2,2.*y1-ya-y2, xa-x1,ya-y1
    x2-xb,y2-yb,-2.*x2+xb+x1,-2.*y2+yb+y1];  
h=1;
while (norm(h)>tau)
    
   f=[(x1-xa).^2+(y1-ya).^2-(ra).^2
    (x2-xb).^2+(y2-yb).^2-(rb).^2
    (x1-x2).*(x1-xa)+(y1-y2).*(y1-ya)
    (x1-x2).*(x2-xb)+(y1-y2).*(y2-yb)];

    J=[2.*(x1-xa),2.*(y1-ya),0,0
        0,0,2.*(x2-xb),2.*(y2-yb)
        2.*x1-xa-x2,2.*y1-ya-y2, xa-x1,ya-y1
        x2-xb,y2-yb,-2.*x2+xb+x1,-2.*y2+yb+y1];  

    h=-J\f;
    
    x1=x1+h(1);
    y1=y1+h(2);
    x2=x2+h(3);
    y2=y2+h(4);
   
end
xrot = [x1 y1 x2 y2];

angle = 0:pi/50:2*pi;
xunit = ra * cos(angle) + xa;
yunit = ra * sin(angle) + ya;
plot(xunit, yunit); hold on;
xunit1 = rb * cos(angle) + xb;
yunit1 = rb * sin(angle) + yb;
plot(xunit1, yunit1); hold on;
plot([x1 x2],[y1 y2],'k'); grid on; axis equal;
hold on
end