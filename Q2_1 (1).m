load top50.mat;
type = [1 3 2 2 3 2 1 1 1 2 2 2 2 3 3 3 3 1 1 1 1 1 1 3 3 3 3 3 3 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 1 1 1 1 1 1];
%我们保证在五年的240周内有？周能满足生产需求
%首先取前十位的供应商
% A类原料5/3；B类原料50/33；C类原料25/18

A1 = zeros(240);
A = A1(1,:);% 获取240大小的全0行向量

for i =1:18
    B = [];
    for j = 1:240
        if type(i)<=1
            B = [B,top50(i,j)*5/3];
        elseif type(i)>=3
            B = [B,top50(i,j)*25/18];
        else
            B = [B,top50(i,j)*50/33];
        end   
    end
    A = A+B;
end
%接下来需要改变i的变化范围（即取多少周）

%比较每一周是否满足条件，记录下满足条件的周数
sum = 0;
for k = 1:240 
    if A(k)>=28200
        A(k)
        sum = sum+1;
    end
end

if sum>=120 %不一定是这个值，228已经是很苛刻的条件了
    ans = 1
else
    ans = 0
end
%最终发现超过40周满足条件的供应商数量选择性价比较低

%% 画个图看看好了
%根据上一小节得到的不同供应商数目下满足条件的周数
offer = [10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27];
week = [21 21 21 22 22 23 23 23 26 27 28 31 38 39 40 41 43 45];
plot(offer,week);
xlabel('供应商数量');
ylabel('满足条件的周数');

%% 转运数量
load top18.mat;%已经处理好的决定了那些周订购哪些周不订购的表
sequence = [3 2 6 8 1 4 7 5]; %运货商先后排序

total = [];
for i = 1:24
    space = [6000 6000 6000 6000 6000 6000 6000 6000]; %八个运货商
    
    k=1;
    for j = 1:18
        if space(k)-top18(j,i)>=0
            space(k) = space(k)-top18(j,i);
            total(j,i) = sequence(k);
        elseif top18(j,i)>6000
            integer = fix(top18(j,i)/6000);
            remainder = rem(top18(j,i),6000);
            for p = k+1:k+integer
                space(p) = 0;
                space(k+integer+1) = 6000-remainder;
                total(j,i) = sequence(k+1);
            end %在这个地方人工干预一下，计算总共需要几个供应商，填入最终表格
        else
            k=k+1;
        end
    end
end

%后期填表的时候发现有的数字会被覆盖掉，因为在一列当中出现两个比较大的数时无法




