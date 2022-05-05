%上平台和下平台的参数变量，p代表的是上平台在L坐标系中的坐标，B代表的是在W坐标系中的坐标
b=[ 296.65  31.47  -31.47  -296.65  -265.18  265.18;
   -134.93 324.47  324.47  -134.93  -189.44 -189.44 ;
         0      0       0        0        0       0];
p=[ 112.47    92.47   -92.47   -112.47   -20       20; 
     41.84    76.48    76.48     41.84  -118.32  -118.32 ;
       0     0       0       0        0       0];
%qint=[0 0 2];q=[0 -2 1];qc=[0 0 4];it is from point(-10,-5,580) to
%point(0,0,600),meanwhile the angle is changed from(15,12,10) to (0,0,0).
%采用3-4-5多项式来计算末端平移曲线
t=0:0.01:1;
xt=10*(10*t.^3-15*t.^4+6*t.^5)-10;
yt=5*(10*t.^3-15*t.^4+6*t.^5)-5;
zt=20*(10*t.^3-15*t.^4+6*t.^5);
syms x y z
rxx=[1,0,0;0,cos(x),-sin(x);0,sin(x),cos(x)];
ryy=[cos(y),0,sin(y);0,1,0;-sin(y),0,cos(y)];
rzz=[cos(z) -sin(z) 0;sin(z) cos(z) 0;0 0 1];
rt=rzz*ryy*rxx;
%r0=subs(rt,[x y z],[0 0 0]);
rtt=subs(rt,[x,y,z],[15/180*pi 12/180*pi 10/180*pi]);
%rttz=subs(rt,[x y z],[50.3360/180*pi -25.5540/180*pi 64.7606/180*pi]);
%rttz=double(rttz);
rtt=double(rtt);
%rtttemp=inv(double(rtt))*rttz;
%其次计算的是每天的旋转量，根据四元素方法进行旋转矢量的计算
cosseta=double((rtt(1,1)+rtt(2,2)+rtt(3,3)-1)/2);
seta=rad2deg(acos(cosseta));
kx=double((rtt(3,2)-rtt(2,3))/(2*sin(seta/180*pi)));
ky=double((rtt(1,3)-rtt(3,1))/(2*sin(seta/180*pi)));
kz=double((rtt(2,1)-rtt(1,2))/(2*sin(seta/180*pi)));
angle=seta-seta*(10*t.^3-15*t.^4+6*t.^5);
%plot(t,angle);hold on;legend('yt','zt','angle');
figure(1)
tt=0:1:100;
plot(tt,xt,tt,yt,tt,zt);grid on;hold on;plot(tt,angle);hold on;grid on;xlabel('t(s)');ylabel('value');legend('x(mm)','y(mm)','z(mm)','angle(°)');axis([0 100 -10 30]);
%figure(2)
zt=zt+580;
%xt=zeros(1,size(yt,2));
%plot3(xt,yt,zt);hold on;grid on;plot3([0 0],[0 0],[0 600]);hold on;xlabel('x');ylabel('y');zlabel('z');
points=[xt;yt;zt];
%计算一下离散点的杆子长度
for i=1:size(yt,2)
    angleseta=angle(i)/180*pi;
    rotox=[kx*kx*(1-cos(angleseta))+cos(angleseta) ky*kx*(1-cos(angleseta))-kz*sin(angleseta) kz*kx*(1-cos(angleseta))+ky*sin(angleseta);
        kx*ky*(1-cos(angleseta))+kz*sin(angleseta) ky*ky*(1-cos(angleseta))+cos(angleseta) kz*ky*(1-cos(angleseta))-kx*sin(angleseta);
        kx*kz*(1-cos(angleseta))-ky*sin(angleseta) ky*kz*(1-cos(angleseta))+kx*sin(angleseta) kz*kz*(1-cos(angleseta))+cos(angleseta)];
    %rotox=rotox';
    for j=1:6
        kkj=rotox*p(:,j)+[xt(i) yt(i) zt(i)]'-b(:,j);
        length(i,j)=(kkj(1)^2+kkj(2)^2+kkj(3)^2)^0.5;
    end
end
%save('lengthlong','length')
%save('spacepoint','points')
%%figure(3)
%plot(length(:,1));hold on;plot(length(:,2));hold on;plot(length(:,3));hold on;plot(length(:,4));hold on;plot(length(:,5));hold on;plot(length(:,6));hold on;
%grid on;legend('l1','l2','l3','l4','l5','l6');xlabel('t(s)');ylabel('length(mm)');