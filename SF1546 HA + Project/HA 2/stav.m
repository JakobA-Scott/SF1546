function [x_steglangd,T1]=stav(n,q0,q1)

T0=290;
Tl=400;
k=2;
L=3;
Q=@(x_steglangd) q0.*exp(-q1.*(x_steglangd-0.7.*L).^2)+200;


h = L/(n+1);
x_steglangd = 0:h:L;

B = (((h.^2)./k)).*(Q(x_steglangd(2:end-1)));
B = B';
ett_matris = ones(n-1,1).*-1;
k1=ett_matris;
k2=ones(n,1).*2;
k3=ett_matris;
A=diag(k2) + diag(k1, 1) + diag(k3, -1);

%Lägg till ränderna!

B(1) = Q(0).*((h.^2)/k)+ T0;
B(end) = Q(x_steglangd(end)).*((h.^2)/k) + Tl;

T =A\B;
T1= zeros(n+2,1);
T1(2:n+1)= T;
T1(1)= T0;
T1(n+2)= Tl;
T1;

    
    
    
plot(x_steglangd, T1);
end













    
