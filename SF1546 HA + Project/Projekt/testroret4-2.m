function[a]=testroret4(g,n) %uppgift 1.3, 1.4 1.5
a=15;
k=50;
tau=10^-6;
gissning=g;

kmax = k*1.05; %  +5% osäkerhet i k
kmin = k*0.95; %  -5% osäkerhet i k
a1max=a;
a2max=gissning;
a1min=a;
a2min=gissning;

while abs(a-gissning)>tau;
    D1=testroret3(gissning,k,n)-100;
    D2=testroret3(a,k,n)-100;
    nytt_varde=gissning-D1*(gissning-a)/(D1-D2); %sekant
    a=gissning;
    gissning=nytt_varde;
end
gissning
while abs(a1max-a2max)>tau;
    D1=(testroret3(a2max,kmax,n)*1.05)-100; %  +5 osäkerhet i temp
    D2=(testroret3(a1max,kmax,n)*1.05)-100;
    nytt_varde=a2max-D1*(a2max-a1max)/(D1-D2);
    a1max=a2max;
    a2max=nytt_varde;
end

while abs(a1min-a2min)>tau;
    D1=(testroret3(a2min,kmin,n)*0.95)-100; %  -5 osäkerhet i temp
    D2=(testroret3(a1min,kmin,n)*0.95)-100;
    nytt_varde=a2min-D1*(a2min-a1min)/(D1-D2);
    a1min=a2min;
    a2min=nytt_varde;
end


fel=(a2max-a2min) %kan delas på 2 för att få +- 
fel2=(a1max-a1min)


