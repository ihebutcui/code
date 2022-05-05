clear all
%设置初始值为
x0=[1,1,1,1,1,1,1,1,1,1,1,1];
%设计变量的下界和上界
lb=[-0.001,-0.001,-0.001,-0.001,-0.001,-0.001,-0.001,-0.001,-0.001,-0.001,-0.001,-0.001];
ub=[0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001,0.001];
%lb=[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1];
%ub=[1,1,1,1,1,1,1,1,1,1,1,1];
%没有线性不等式约束条件
%A=[-1*6^4,1*6^4,0;-3*6^4,0,1*6^4];
%b=[1.5;0];
A=[]; 
b=[];%初始的值设置的是1.5；3
%设置线性等式约束
%aeq=[-1*6^4,1*6^4,0;-3*6^4,0,1*6^4];beq=[1.5;0];
aeq=[];beq=[];
%使用多维约束优化命令fmincon（调用目标函数和非线性约束函数)
[z,fn]=fmincon(@fittingfunction,x0,A,b,aeq,beq,lb,ub);
disp  '********输出最优解**********'
fn