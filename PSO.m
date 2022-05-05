%使用粒子群算法进行曲线拟合
c1=0.8;
c2=0.8;
maxgen=50;
popsize=10;
popmax=0.001;popmin=-0.001;
vmax=0.0001;vmin=-0.0001;
par_num=12;%space维数
wmax=1.2;wmin=0.8;

%初始化粒子速度和种群
for i=1:popsize
    x(i,:)=popmin+abs(rands(1,par_num))*(popmax-popmin);
    v(i,:)=vmin+abs(rands(1,par_num))*(vmax-vmin);
    values(i)=fittingfunction(x(i,:));
end
%初始化全局变量和局部变量
[bestfitness,bestindex]=min(values);
pbest=values;pbestx=x;
gbest=bestfitness;gbestx=x(bestindex,:);

%进行迭代
for i=1:maxgen
    w=wmin+(wmax-wmin)*i/maxgen;
    for j=1:popsize
        %速度和位置的更新
        x(j,:)=w*x(j,:)+c1*rand*(pbestx(j,:)-x(j,:))+c2*rand*(gbestx-x(j,:));
        v(j,:)=x(j,:)+v(j,:);
        %判断是否超出界限
        x(j,find(x(j,:)>=popmax))=popmax;
        x(j,find(x(j,:)<=popmin))=popmin;
        v(j,find(v(j,:)>=vmax))=vmax;
        v(j,find(v(j,:)<=vmin))=vmin;
        %自适应变异
        if(rand>0.8)
            k=ceil(rand*par_num);
            x(j,k)=popmin+rand*(popmax-popmin);
        end
        values(j)=fittingfunction(x(j,:));
        if(values(j)<pbest(j))
            pbest(j)=values(j);
            pbestx(j,:)=x(j,:);
        end
        if(values(j)<gbest)
            gbest=values(j);
            gbestx=x(j,:);
        end
    end
    yy(i)=gbest;
end

%显示最优值
plot(yy)
gbestx