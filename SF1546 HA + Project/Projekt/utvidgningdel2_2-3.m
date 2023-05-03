function []=utvidgningdel2_2(n,L) %uppgift 2.2
tau=10^-2; %felet
fel=2;
gissning=3.0;

while abs(L-gissning)>tau; %sekantmetoden används
    D1=utvidgningdel2_1(n,gissning)-100; %värden hämtas från extensionpart1
    D2=utvidgningdel2_1(n,L)-100;
    nytt_varde =gissning-D1*(gissning-L)/(D1-D2);
    L=gissning;
    gissning = nytt_varde;
end
kritiska_skiktet = gissning - 2.0 %skiktets kritiska tjocklek anges

while abs(fel) > tau
    U1=utvidgningdel2_1(n,L);
    U2=utvidgningdel2_1(n*2,L);
    U3=utvidgningdel2_1(n*4,L);
    U1ny = U1(end);
    U2ny = U2(end);
    U3ny=U3(end);
    fel=U1ny-U2ny;
    acc=abs(U2ny-U1ny)/abs(U3ny-U2ny);
    n=n*2;
end

noggranhet = sqrt(acc) %noggranheten anges
