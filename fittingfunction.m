function g=fittingfunction(x)
le=load('lengthlong.mat', 'length');
le=le.length;
T=100;
aone=le(1,1);atwo=le(1,2);athree=le(1,3);afour=le(1,4);afive=le(1,5);asix=le(1,6);
%kko=[-x(1) -x(2);-6*x(1) -7*x(2);-30*x(1) -42*x(2)]*([T^3 T^4]')+[(le(size(le,1),1)-aone)/(T^3) 0 0]';
%kkt=[-x(3) -x(4);-6*x(3) -7*x(4);-30*x(3) -42*x(4)]*([T^3 T^4]')+[(le(size(le,1),2)-atwo)/(T^3) 0 0]';
%kkth=[-x(5) -x(6);-6*x(5) -7*x(6);-30*x(5) -42*x(6)]*([T^3 T^4]')+[(le(size(le,1),3)-athree)/(T^3) 0 0]';
%kkf=[-x(7) -x(8);-6*x(7) -7*x(8);-30*x(7) -42*x(8)]*([T^3 T^4]')+[(le(size(le,1),4)-afour)/(T^3) 0 0]';
%kkfi=[-x(9) -x(10);-6*x(9) -7*x(10);-30*x(9) -42*x(10)]*([T^3 T^4]')+[(le(size(le,1),5)-afive)/(T^3) 0 0]';
%kks=[-x(11) -x(12);-6*x(11) -7*x(12);-30*x(11) -42*x(12)]*([T^3 T^4]')+[(le(size(le,1),6)-asix)/(T^3) 0 0]';
%aftxone=inv([1 T T^2;3 4*T 5*T^2;6 12*T 20*T^2])*kko;
%aftxone=inv([T^3 T^4 T^5;5 6*T 7*T^2;20 30*T 42*T^2])*([le(size(le,1),1)-le(1,1)-x(1)*T^3-x(2)*T^4;-3*x(1)-4*x(2)*T;-6*x(1)-12*x(2)*T])/(T^2);
%aftxone=kko*(inv([1 3 6;T 4*T 12*T;T^2 5*T^2 20*T^2]));
%aftxtwo=inv([1 T T^2;3 4*T 5*T^2;6 12*T 20*T^2])*kkt;
%aftxthree=inv([1 T T^2;3 4*T 5*T^2;6 12*T 20*T^2])*kkth;
%aftxfour=inv([1 T T^2;3 4*T 5*T^2;6 12*T 20*T^2])*kkf;
%aftxfive=inv([1 T T^2;3 4*T 5*T^2;6 12*T 20*T^2])*kkfi;
%aftxsix=inv([1 T T^2;3 4*T 5*T^2;6 12*T 20*T^2])*kks;
%aftxone=inv([T^3 T^4 T^5;5 6*T 7*T^2;20 30*T 42*T^2])*([le(size(le,1),1)-le(1,1)-x(1)*T^3-x(2)*T^4;-3*x(1)-4*x(2)*T;-6*x(1)-12*x(2)*T])/(T^2);
aftxone=inv([T^3 T^4 T^5;5 6*T 7*T^2;20 30*T 42*T^2])*([le(size(le,1),1)-aone-x(1)*T^3-x(2)*T^4;-3*x(1)-4*x(2)*T;-6*x(1)-12*x(2)*T])/(T^2);
aftxtwo=inv([T^3 T^4 T^5;5 6*T 7*T^2;20 30*T 42*T^2])*([le(size(le,1),2)-atwo-x(3)*T^3-x(4)*T^4;-3*x(3)-4*x(4)*T;-6*x(3)-12*x(4)*T])/(T^2);
aftxthree=inv([T^3 T^4 T^5;5 6*T 7*T^2;20 30*T 42*T^2])*([le(size(le,1),3)-athree-x(5)*T^3-x(6)*T^4;-3*x(5)-4*x(6)*T;-6*x(5)-12*x(6)*T])/(T^2);
aftxfour=inv([T^3 T^4 T^5;5 6*T 7*T^2;20 30*T 42*T^2])*([le(size(le,1),4)-afour-x(7)*T^3-x(8)*T^4;-3*x(7)-4*x(8)*T;-6*x(7)-12*x(8)*T])/(T^2);
aftxfive=inv([T^3 T^4 T^5;5 6*T 7*T^2;20 30*T 42*T^2])*([le(size(le,1),5)-afive-x(9)*T^3-x(10)*T^4;-3*x(9)-4*x(10)*T;-6*x(9)-12*x(10)*T])/(T^2);
aftxsix=inv([T^3 T^4 T^5;5 6*T 7*T^2;20 30*T 42*T^2])*([le(size(le,1),6)-asix-x(11)*T^3-x(12)*T^4;-3*x(11)-4*x(12)*T;-6*x(11)-12*x(12)*T])/(T^2);
syms ti
lione=aone+x(1)*ti^3+x(2)*ti^4+aftxone(1)*ti^5+aftxone(2)*ti^6+aftxone(3)*ti^7;
litwo=atwo+x(3)*ti^3+x(4)*ti^4+aftxtwo(1)*ti^5+aftxtwo(2)*ti^6+aftxtwo(3)*ti^7;
lithree=athree+x(5)*ti^3+x(6)*ti^4+aftxthree(1)*ti^5+aftxthree(2)*ti^6+aftxthree(3)*ti^7;
lifour=afour+x(7)*ti^3+x(8)*ti^4+aftxfour(1)*ti^5+aftxfour(2)*ti^6+aftxfour(3)*ti^7;
lifive=afive+x(9)*ti^3+x(10)*ti^4+aftxfive(1)*ti^5+aftxfive(2)*ti^6+aftxfive(3)*ti^7;
lisix=asix+x(11)*ti^3+x(12)*ti^4+aftxsix(1)*ti^5+aftxsix(2)*ti^6+aftxsix(3)*ti^7;
%litwo=atwo+aftxtwo(1)*t^3+aftxtwo(2)*t^4+aftxtwo(3)*t^5+x(3)*t^6+x(4)*t^7;
%lithree=athree+aftxthree(1)*t^3+aftxthree(2)*t^4+aftxthree(3)*t^5+x(5)*t^6+x(6)*t^7;
%lifour=afour+aftxfour(1)*t^3+aftxfour(2)*t^4+aftxfour(3)*t^5+x(7)*t^6+x(8)*t^7;
%lifive=afive+aftxfive(1)*t^3+aftxfive(2)*t^4+aftxfive(3)*t^5+x(9)*t^6+x(10)*t^7;
%lisix=asix+aftxsix(1)*t^3+aftxsix(2)*t^4+aftxsix(3)*t^5+x(11)*t^6+x(12)*t^7;
lione=double(subs(lione,ti,0:(T/(size(le,1)-1)):T));
litwo=double(subs(litwo,ti,0:1:T));lithree=double(subs(lithree,ti,0:1:T));lifour=double(subs(lifour,ti,0:1:T));
lifive=double(subs(lifive,ti,0:1:T));lisix=double(subs(lisix,ti,0:1:T));
fk=0;%fitting
for i=1:size(le,1)
    fk=fk+(lione(i)-le(i,1))^2+(litwo(i)-le(i,2))^2+(lithree(i)-le(i,3))^2+(lifour(i)-le(i,4))^2+(lifive(i)-le(i,5))^2+(lisix(i)-le(i,6))^2;
    %fk=fk+(lione(i)-le(i,1))^2;
end
%limax=max([lione,litwo,lithree,lifour,lifive,lisix]);limin=min([lione,litwo,lithree,lifour,lifive,lisix]);
point=load('spacepoint.mat', 'points');
point=point.points;
fl=0;%offset
%for i=1:size(lione,2)
    %te=[lione(i),litwo(i),lithree(i),lifour(i),lifive(i),lisix(i)];
    %g(i,:)=onefitnesspso(te);
    %fl=fl+(g(i,1)-point(1,i))^2+(g(i,2)-point(2,i))^2+(g(i,3)-point(3,i))^2;
%end
g=fk+fl/1000;
end