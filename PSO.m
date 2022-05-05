%ʹ������Ⱥ�㷨�����������
c1=0.8;
c2=0.8;
maxgen=50;
popsize=10;
popmax=0.001;popmin=-0.001;
vmax=0.0001;vmin=-0.0001;
par_num=12;%spaceά��
wmax=1.2;wmin=0.8;

%��ʼ�������ٶȺ���Ⱥ
for i=1:popsize
    x(i,:)=popmin+abs(rands(1,par_num))*(popmax-popmin);
    v(i,:)=vmin+abs(rands(1,par_num))*(vmax-vmin);
    values(i)=fittingfunction(x(i,:));
end
%��ʼ��ȫ�ֱ����;ֲ�����
[bestfitness,bestindex]=min(values);
pbest=values;pbestx=x;
gbest=bestfitness;gbestx=x(bestindex,:);

%���е���
for i=1:maxgen
    w=wmin+(wmax-wmin)*i/maxgen;
    for j=1:popsize
        %�ٶȺ�λ�õĸ���
        x(j,:)=w*x(j,:)+c1*rand*(pbestx(j,:)-x(j,:))+c2*rand*(gbestx-x(j,:));
        v(j,:)=x(j,:)+v(j,:);
        %�ж��Ƿ񳬳�����
        x(j,find(x(j,:)>=popmax))=popmax;
        x(j,find(x(j,:)<=popmin))=popmin;
        v(j,find(v(j,:)>=vmax))=vmax;
        v(j,find(v(j,:)<=vmin))=vmin;
        %����Ӧ����
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

%��ʾ����ֵ
plot(yy)
gbestx