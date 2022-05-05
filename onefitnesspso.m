%使用单目标函数进行拟合迭代寻优
function gb=onefitnesspso(le)
dim=6;%粒子寻找的维数
vmax=1;vmin=-1;
popxmax=5;popxmin=-10;
popymax=0;popymin=-6;
popzmax=700;popzmin=0;
popamax=20;popamin=10;
wmax=1.2;wmin=0.1;
popsize=300;
maxgen=200;
c1=0.8;c2=0.8;

%粒子的初始化
for i=1:popsize
    x(i,1:3)=abs(rands(1,dim/2))*(popxmax-popxmin)+popxmin;
    %x(i,2)=abs(rands(1,1))*(popymax-popymin)+popymin;
    %x(i,3)=abs(rands(1,1))*(popzmax-popzmin)+popzmin;
    x(i,4:6)=abs(rands(1,dim/2))*(popamax-popamin)+popamin;
    v(i,:)=rands(1,dim);
    fi(i)=abs(fitnessfinal(x(i,:),le));
end

%粒子的全局和局部最优化
[fit,index]=min(fi);
pbest=x;%个体最优
gbest=x(index,:);%全局最优
pbestfitness=fi;%个体最优
gbestfitness=fit;%全局最优

%迭代开始
for i=1:maxgen
    w=wmax-(wmax-wmin)*i/maxgen;
    %更新位置和速度
    for j=1:popsize
        v(j,:)=w*v(j,:)+c1*rand*(pbest(j,:)-x(j,:))+c2*rand*(gbest-x(j,:));
        v(j,find(v(j,:)>vmax))=vmax;
        v(j,find(v(j,:)<vmin))=vmin;
        x(j,:)=v(j,:)+x(j,:);
        x(j,find(x(j,1)>popxmax))=popxmax;
        x(j,find(x(j,1)<popxmin))=popxmin;
        x(j,find(x(j,2)>popymax))=popymax;
        x(j,find(x(j,2)<popymin))=popymin;
        x(j,find(x(j,3)>popzmax))=popzmax;
        x(j,find(x(j,3)<popzmin))=popzmin;
        %x(j,find(x(j,3)<popxmin+2))=popxmin+2;
        x(j,find(x(j,4:6)>popamax))=popamax;
        x(j,find(x(j,4:6)<popamin))=popamin;
       %自适应bianyi
        if(rand<0.5)
           k=ceil(rand*3);
           L=k+3;
           if(k==1)
               x(j,k)=rand*(popxmax-popxmin)+popxmin;
               x(j,L)=rand*(popamax-popamin)+popamin;
           end
           if(k==2)
               x(j,k)=abs(rands(1,1))*(popymax-popymin)+popymin;
               x(j,L)=rand*(popamax-popamin)+popamin;
           end
           if(k==3)
               x(i,k)=abs(rands(1,1))*(popzmax-popzmin)+popzmin;
               x(j,L)=rand*(popamax-popamin)+popamin;
           end
        end
        %更新个体和全局变量
        if(abs(fitnessfinal(x(j,:),le))<pbestfitness(j))
           pbest(j,:)=x(j,:);
           pbestfitness(j)=abs(fitnessfinal(x(j,:),le));
        end
        if(abs(fitnessfinal(x(j,:),le))<gbestfitness)
            gbest=x(j,:);
            gbestfitness=abs(fitnessfinal(x(j,:),le));
        end
    end
    zz(i)=gbestfitness;
end

%disp('结果显示')
%plot(zz)
gb=gbest;
end