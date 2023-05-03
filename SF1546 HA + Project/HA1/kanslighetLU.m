function []=kanslighetLU()
load('eiffel1.mat','A','xnod','ynod','bars')
[L,U]=lu(A);
tic
for n = 1:261
    b=zeros(2*261,1); b(n*2)=-1;
    [L,U]=lu(A);
    y = L\b;
    x = U\y;
end
toc
end
