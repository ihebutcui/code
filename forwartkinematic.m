function g=forwartkinematic(lione,litwo,lithree,lifour,lifive,lisix)
%采用牛顿迭代法进行求解平台的正解问题
%初始化平台的参数，确实平台的搜索范围空间
lmin=569.00;
lmax=800.00;
setamax=70;
zmin=450;
zmax=1000;
alf=10;
blt=10;
gam=10;
%上平台和下平台的参数变量，p代表的是上平台在L坐标系中的坐标，B代表的是在W坐标系中的坐标
b=[ 296.65  31.47  -31.47  -296.65  -265.18  265.18;
   -134.93 324.47  324.47  -134.93  -189.44 -189.44 ;
         0      0       0        0        0       0];
p=[ 112.47    92.47   -92.47   -112.47   -20       20; 
     41.84    76.48    76.48     41.84  -118.32  -118.32 ;
       0     0       0       0        0       0];
R=[ cos(blt/180*pi)*cos(gam/180*pi) -cos(blt/180*pi)*sin(gam/180*pi) sin(blt/180*pi);
    cos(gam/180*pi)*sin(blt/180*pi)*sin(alf/180*pi)+cos(alf/180*pi)*sin(gam/180*pi) cos(alf/180*pi)*cos(gam/180*pi)-sin(alf/180*pi)*sin(blt/180*pi)*sin(gam/180*pi) -sin(alf/180*pi)*cos(blt/180*pi);
    sin(alf/180*pi)*sin(gam/180*pi)-cos(alf/180*pi)*cos(gam/180*pi)*sin(blt/180*pi) cos(gam/180*pi)*sin(alf/180*pi)+cos(alf/180*pi)*sin(blt/180*pi)*sin(gam/180*pi) cos(alf/180*pi)*cos(blt/180*pi)];


%验证一下输出结果
qint=[0 0 500 0 0 0];
alf=qint(4);blt=qint(5);gam=qint(6);
lint=zeros(3,6);
for y=1:6
    Rzz=[ cos(qint(5)/180*pi)*cos(qint(6)/180*pi) -cos(qint(5)/180*pi)*sin(qint(6)/180*pi) sin(qint(5)/180*pi);
    cos(qint(6)/180*pi)*sin(qint(5)/180*pi)*sin(qint(4)/180*pi)+cos(qint(4)/180*pi)*sin(qint(6)/180*pi) cos(qint(4)/180*pi)*cos(qint(6)/180*pi)-sin(qint(4)/180*pi)*sin(qint(5)/180*pi)*sin(qint(6)/180*pi) -sin(qint(4)/180*pi)*cos(qint(5)/180*pi);
    sin(qint(4)/180*pi)*sin(qint(6)/180*pi)-cos(qint(4)/180*pi)*cos(qint(6)/180*pi)*sin(qint(5)/180*pi) cos(qint(6)/180*pi)*sin(qint(4)/180*pi)+cos(qint(4)/180*pi)*sin(qint(5)/180*pi)*sin(qint(6)/180*pi) cos(qint(4)/180*pi)*cos(qint(5)/180*pi)];
    temp=Rzz*p;
    lint(:,y)=qint(1:3)'+temp(:,y)-b(:,y);
    lengthint(y)=(lint(1,y)^2+lint(2,y)^2+lint(3,y)^2)^0.5;
end   
   
   
%初始化q0
alf=10;
blt=10;
gam=10;
q0=[0 0 550 alf blt gam]';
R=[ cos(blt/180*pi)*cos(gam/180*pi) cos(blt/180*pi)*sin(gam/180*pi) -sin(blt/180*pi);
    cos(gam/180*pi)*sin(blt/180*pi)*sin(alf/180*pi)-cos(alf/180*pi)*sin(gam/180*pi) cos(alf/180*pi)*cos(gam/180*pi)+sin(alf/180*pi)*sin(blt/180*pi)*sin(gam/180*pi) sin(alf/180*pi)*cos(blt/180*pi);
    sin(alf/180*pi)*sin(gam/180*pi)+cos(alf/180*pi)*cos(gam/180*pi)*sin(blt/180*pi) -cos(gam/180*pi)*sin(alf/180*pi)+cos(alf/180*pi)*sin(blt/180*pi)*sin(gam/180*pi) cos(alf/180*pi)*cos(blt/180*pi)];
%初始化q0
l0=zeros(3,6);
for x=1:6
    tempx=R'*p;
    l0(:,x)=q0(1:3)+tempx(:,x)-b(:,x);
    length0(x)=sqrt(l0(1,x)^2+l0(2,x)^2+l0(3,x)^2);
end
%length0

i=0;
q=q0;
%lm=[lmin lmin lmin lmin lmin lmin];
%lm=lengthint;
lm=[lione litwo lithree lifour lifive lisix];
%fq=lm-length0;
l=zeros(3,6);
n=zeros(3,6);
s=zeros(3,6);
fk=[];
while(i<1000)
    i=i+1;
    Rz=[ cos(q(5)/180*pi)*cos(q(6)/180*pi) cos(q(5)/180*pi)*sin(q(6)/180*pi) -sin(q(5)/180*pi);
    cos(q(6)/180*pi)*sin(q(5)/180*pi)*sin(q(4)/180*pi)-cos(q(4)/180*pi)*sin(q(6)/180*pi) cos(q(4)/180*pi)*cos(q(6)/180*pi)+sin(q(4)/180*pi)*sin(q(5)/180*pi)*sin(q(6)/180*pi) sin(q(4)/180*pi)*cos(q(5)/180*pi);
    sin(q(4)/180*pi)*sin(q(6)/180*pi)+cos(q(4)/180*pi)*cos(q(6)/180*pi)*sin(q(5)/180*pi) -cos(q(6)/180*pi)*sin(q(4)/180*pi)+cos(q(4)/180*pi)*sin(q(5)/180*pi)*sin(q(6)/180*pi) cos(q(4)/180*pi)*cos(q(5)/180*pi)];
    for k=1:6
        temp=Rz'*p;
        l(:,k)=q(1:3)+temp(:,k)-b(:,k);
        length(k)=sqrt(l(1,k)^2+l(2,k)^2+l(3,k)^2);
        n(:,k)=l(:,k)/length(k);
        s(:,k)=cross(Rz*p(:,k),n(:,k));
    end
    %length
    j=[n;s]';
    jtemp=[1,0,0,0,0,0;0,1,0,0,0,0;0,0,1,0,0,0;
        0,0,0,cos(q(6)/180*pi)*cos(q(5)/180*pi),-sin(q(6)/180*pi),0;
        0,0,0,sin(q(6)/180*pi)*cos(q(5)/180*pi),cos(q(6)/180*pi),0;
        0,0,0,-sin(q(5)/180*pi),0,1];
    jmodi=j*jtemp;
    fq=lm-length;
    fk=[fk,(fq(1)^2+fq(2)^2+fq(3)^2)^0.5];
    if(det(jmodi)==0)
        break;
    end
    q=q+inv(jmodi)*fq';
end
g=q';
plot(fk);grid on;
end