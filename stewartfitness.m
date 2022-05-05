function f=stewartfitness(q)
a=q(4);b=q(5)/180*pi;c=q(6)/180*pi;
rx=[1 0 0;0 cos(a/180*pi) -sin(a/180*pi);0 sin(a/180*pi) cos(a/180*pi)];
ry=[cos(b) 0 sin(b);0 1 0;-sin(b) 0 cos(b)];
rz=[cos(c) -sin(c) 0;sin(c) cos(c) 0;0 0 1];
rab=rz*ry*rx;
%平台的参数设置,其中b代表的是下平台的参数，p代表是上平台的参数
b=[ 296.65  31.47  -31.47  -296.65  -265.18  265.18;
   -134.93 324.47  324.47  -134.93  -189.44 -189.44 ;
         0      0       0        0        0       0];
p=[ 112.47    92.47   -92.47   -112.47   -20       20; 
     41.84    76.48    76.48     41.84  -118.32  -118.32 ;
       0     0       0       0        0       0];
%参数初始空间
%lmin=569.00;
%lmax=800.00;
%setamax=70;
%zmin=450;
%zmax=1000;
for i=1:6
    bp=rab*p(:,i)+q(1:3)'-b(:,i);
    sizebp=size(bp,1);
    sumlength=0;
    for j=1:sizebp
        sumlength=sumlength+bp(j)^2;
    end
    f(i)=sumlength^0.5;
end