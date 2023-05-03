function [a_ut,n_ut]=testroret2 %1.2
tau=10^(-5);
n=25;
fel=1;
%metod  abs ( T(h/2)-T(h) ) / abs ( T(h/4)-T(h/2) )
while abs(fel)>tau    
   [h,temp1]=testroret1(n);
   [h,temp2]=testroret1(2*n);
   [h,temp3]=testroret1(4*n);
   Tett=temp1(end);
   Ttvo=temp2(end);
   Ttre=temp3(end);
   fel=Ttvo-Tett;
   accuracy = abs((Ttvo-Tett))/abs((Ttre-Ttvo)); %detta borde bli ungefär 4 
   n=n*2;
   
end
a_ut=accuracy;
n_ut=(n/2);   
      
