function [] = kanslighet()
load('eiffel1.mat','A','xnod','ynod','bars')
offset=zeros(1,261);
for n = 1:261
    b=zeros(2*261,1); b(n*2)=-1;
    x=A\b;
    offset(1,n)=norm(x);
end
max(offset);
min(offset);
biggest=find(offset==max(offset))
smallest=find(offset==min(offset))
trussplot(xnod,ynod,bars); hold on; plot(xnod(biggest),ynod(biggest),'bo','markersize',12);
hold on; 
plot(xnod(smallest),ynod(smallest),'r*','markersize',12)

