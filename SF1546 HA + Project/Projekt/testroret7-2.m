function []=testroret7 %uppgift 2.2
n=100;
tau=10^(-2);
fel=2;
L=2.0;
gissning=3;
while abs(fel) > tau
    U1=testroret6(n,L);
    U2=testroret6(n*2,L);
    U3=testroret6(n*4,L);
    U1ny = U1(end);
    U2ny = U2(end);
    U3ny=U3(end);
    fel=U1ny-U2ny;
    acc=abs(U2ny-U1ny)/abs(U3ny-U2ny);
    n=n*2;
end


while abs(L-gissning)>tau;
    D1=testroret6(n,gissning)-100;
    D2=testroret6(n,L)-100;
    nytt_varde=gissning-D1*(gissning-L)/(D1-D2); %sekant
    L=gissning;
    gissning=nytt_varde;
end

n_ut=(n/2)
a_ut=acc
L_skikt=nytt_varde-2.0