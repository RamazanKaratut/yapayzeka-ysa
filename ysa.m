load("ysaworkspace.mat");

net = newff(minmax(Egitim), [5 2 3 4 1],{'tansig' 'tansig' 'logsig' 'logsig' 'purelin'}, 'traingdx');
net = init(net);
net.trainParam.epochs = 1000;
net.trainParam.show = 5;
net.trainParam.goal = 1e-5;
net.trainParam.lr = 0.3;
net.trainParam.mc = 0.7;
net.trainParam.min_grad = 1e-10;

%Egitim
net = train(net, Egitim, EgitimC);

%Test
Tahmin = net(Test);
Tahmin(isnan(Tahmin)) = 0; 


mse_gercek = TestC'; 
mse_Tahmin = Tahmin';

% MSE Hesaplama
mse = mean((mse_Tahmin - mse_gercek).^2);

tahmin_ortalama = mean(mse_gercek);

% R^2 Hesaplama
pay = sum((mse_gercek - mse_Tahmin).^2);       
payda = sum((mse_gercek - tahmin_ortalama).^2); 

rkare = 1 - (pay / payda);

x = 0;
for i=1:length(mse_gercek)
    x(i,1) = i;
end    
plot(x, Tahmin, 'b', x, TestC, 'r');
xlabel("x");
ylabel("y");
title("Değerler");