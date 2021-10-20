%% ����Ԥ����
load offer.mat;%������
load order.mat;%������

Dvalue = offer-order; %������֮��
rate = abs(Dvalue./order); %�����
rate(isnan(rate)==1) = 0; %�滻����NaNΪ0
rate(rate==inf) = 0; %�滻����InfΪ0
sum = sum(rate,2);
%ͨ��excel��sum��240�õ����յ�ƽ�������

%% ת�����������
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

%% ABC����ԭ����ÿ�ܹ����Ա�
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
title('A���C��ԭ����ÿ�ܹ�������');
xlabel('����');
ylabel('A/C��ԭ���Ϲ�Ӧ��ռ�ٷֱ�');