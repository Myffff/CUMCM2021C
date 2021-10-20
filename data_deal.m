%% 数据预处理
load offer.mat;%供货量
load order.mat;%需求量

Dvalue = offer-order; %供、需之差
rate = abs(Dvalue./order); %误差率
rate(isnan(rate)==1) = 0; %替换所有NaN为0
rate(rate==inf) = 0; %替换所有Inf为0
sum = sum(rate,2);
%通过excel将sum除240得到最终的平均误差率

%% 转运损耗率曲线
load transfer.mat;

T1 = transfer(1,:);T2 = transfer(2,:);T3 = transfer(3,:);T4 = transfer(4,:);
T5 = transfer(5,:);T6 = transfer(6,:);T7 = transfer(7,:);T8 = transfer(8,:);

subplot(2,4,1); scatter(1:240,T1,'.'); title('T1');xlabel('week');ylabel('rate/%');
subplot(2,4,2); scatter(1:240,T2,'.'); title('T2');xlabel('week');ylabel('rate/%');
subplot(2,4,3); scatter(1:240,T3,'.'); title('T3');xlabel('week');ylabel('rate/%');
subplot(2,4,4); scatter(1:240,T4,'.'); title('T4');xlabel('week');ylabel('rate/%');
subplot(2,4,5); scatter(1:240,T5,'.'); title('T5');xlabel('week');ylabel('rate/%');
subplot(2,4,6); scatter(1:240,T6,'.'); title('T6');xlabel('week');ylabel('rate/%');
subplot(2,4,7); scatter(1:240,T7,'.'); title('T7');xlabel('week');ylabel('rate/%');
subplot(2,4,8); scatter(1:240,T8,'.'); title('T8');xlabel('week');ylabel('rate/%');

%% ABC三类原材料每周供给对比
load abc.mat;

sumOfabc = abcDiffer(1,:)+abcDiffer(2,:)+abcDiffer(3,:);
aPercent = abcDiffer(1,:)./sumOfabc;
bPercent = abcDiffer(2,:)./sumOfabc;
cPercent = abcDiffer(3,:)./sumOfabc;

plot(1:240,aPercent*100);
hold on;
% bar(1:240,bPercent*100);
% hold on;
plot(1:240,cPercent*100);
title('A类和C类原材料每周供给比例');
xlabel('周数');
ylabel('A/C类原材料供应所占百分比');