%for N=0:9
%    title = strcat(num2str(N),'.3gp');
%    [y,~] = audioread(title);
%    [startWord, endWord] = retrieveWord(y, 50, 2, 44100, 2, 4);
%    for i=1:20
%        coeff_ref2(1:39,20*N+i) = COMPUTE_COEFF(y(startWord(i,1):endWord(i,1)));
%    end
%end



%N = 9;
%for i=1:20
%    coeff_ref1(1:26,20*N+i) = COMPUTE_COEFF(y(startWord(i,1):endWord(i,1)));
%end
    
%subplot(2,1,1);plot(y);subplot(2,1,2);plot(z);

%number_ref1 = zeros(1,200);
%for N=0:9
%    number_ref1(1,N*20+1:(N+1)*20)= N;
%end

%number_ref2 = zeros(10,200);
%for N=0:9
%    number_ref2(N+1,N*20+1:(N+1)*20) = 1;
%end

% Training set
%training_input = zeros(26,100);
%training_output = zeros(10,100);
%for N=0:9
%    training(:,(10*N+1):10*(N+1)) = coeff_ref1(:,(20*N+1):(20*N+11));
%    training_output(:,(10*N+1):10*(N+1)) = number_ref2(:,(20*N+1):(20*N+11));
%end
    
%PCA

nets = zeros(10,1);

N=0
x = coeff_ref2;
t = number_ref2(N+1,:);
trainFcn = 'trainlm';  % Levenberg-Marquardt backpropagation.
hiddenLayerSize = 4;
net0 = fitnet(hiddenLayerSize,trainFcn);
net0.divideParam.trainRatio = 80/100;
net0.divideParam.valRatio = 10/100;
net0.divideParam.testRatio = 10/100;
[net0,tr] = train(net0,x,t);

    
N=1
x = coeff_ref2;
t = number_ref2(N+1,:);
trainFcn = 'trainlm';  % Levenberg-Marquardt backpropagation.
hiddenLayerSize = 4;
net1 = fitnet(hiddenLayerSize,trainFcn);
net1.divideParam.trainRatio = 80/100;
net1.divideParam.valRatio = 10/100;
net1.divideParam.testRatio = 10/100;
[net1,tr] = train(net1,x,t);

N=2
x = coeff_ref2;
t = number_ref2(N+1,:);
trainFcn = 'trainlm';  % Levenberg-Marquardt backpropagation.
hiddenLayerSize = 4;
net2 = fitnet(hiddenLayerSize,trainFcn);
net2.divideParam.trainRatio = 80/100;
net2.divideParam.valRatio = 10/100;
net2.divideParam.testRatio = 10/100;
[net2,tr] = train(net2,x,t);

N=3
x = coeff_ref2;
t = number_ref2(N+1,:);
trainFcn = 'trainlm';  % Levenberg-Marquardt backpropagation.
hiddenLayerSize = 4;
net3 = fitnet(hiddenLayerSize,trainFcn);
net3.divideParam.trainRatio = 80/100;
net3.divideParam.valRatio = 10/100;
net3.divideParam.testRatio = 10/100;
[net3,tr] = train(net3,x,t);

N=4
x = coeff_ref2;
t = number_ref2(N+1,:);
trainFcn = 'trainlm';  % Levenberg-Marquardt backpropagation.
hiddenLayerSize = 4;
net4 = fitnet(hiddenLayerSize,trainFcn);
net4.divideParam.trainRatio = 80/100;
net4.divideParam.valRatio = 10/100;
net4.divideParam.testRatio = 10/100;
[net4,tr] = train(net4,x,t);

N=5
x = coeff_ref2;
t = number_ref2(N+1,:);
trainFcn = 'trainlm';  % Levenberg-Marquardt backpropagation.
hiddenLayerSize = 4;
net5 = fitnet(hiddenLayerSize,trainFcn);
net5.divideParam.trainRatio = 80/100;
net5.divideParam.valRatio = 10/100;
net5.divideParam.testRatio = 10/100;
[net5,tr] = train(net5,x,t);

N=6
x = coeff_ref2;
t = number_ref2(N+1,:);
trainFcn = 'trainlm';  % Levenberg-Marquardt backpropagation.
hiddenLayerSize = 4;
net6 = fitnet(hiddenLayerSize,trainFcn);
net6.divideParam.trainRatio = 80/100;
net6.divideParam.valRatio = 10/100;
net6.divideParam.testRatio = 10/100;
[net6,tr] = train(net6,x,t);

N=7
x = coeff_ref2;
t = number_ref2(N+1,:);
trainFcn = 'trainlm';  % Levenberg-Marquardt backpropagation.
hiddenLayerSize = 4;
net7 = fitnet(hiddenLayerSize,trainFcn);
net7.divideParam.trainRatio = 80/100;
net7.divideParam.valRatio = 10/100;
net7.divideParam.testRatio = 10/100;
[net7,tr] = train(net7,x,t);

N=8
x = coeff_ref2;
t = number_ref2(N+1,:);
trainFcn = 'trainlm';  % Levenberg-Marquardt backpropagation.
hiddenLayerSize = 4;
net8 = fitnet(hiddenLayerSize,trainFcn);
net8.divideParam.trainRatio = 80/100;
net8.divideParam.valRatio = 10/100;
net8.divideParam.testRatio = 10/100;
[net8,tr] = train(net8,x,t);

N=9
x = coeff_ref2;
t = number_ref2(N+1,:);
trainFcn = 'trainlm';  % Levenberg-Marquardt backpropagation.
hiddenLayerSize = 4;
net9 = fitnet(hiddenLayerSize,trainFcn);
net9.divideParam.trainRatio = 80/100;
net9.divideParam.valRatio = 10/100;
net9.divideParam.testRatio = 10/100;
[net9,tr] = train(net9,x,t);



numbers = zeros(10,200);
numbers(1,:) = net0(coeff_ref2);
numbers(2,:) = net1(coeff_ref2);
numbers(3,:) = net2(coeff_ref2);
numbers(4,:) = net3(coeff_ref2);
numbers(5,:) = net4(coeff_ref2);
numbers(6,:) = net5(coeff_ref2);
numbers(7,:) = net6(coeff_ref2);
numbers(8,:) = net7(coeff_ref2);
numbers(9,:) = net8(coeff_ref2);
numbers(10,:) = net9(coeff_ref2);





numbers_final = zeros(200,1);
for i=1:200
    [~,numbers_final(i,1)] = max(numbers(:,i));
    numbers_final(i,1) = numbers_final(i,1) -1;
end
    




clear y fs startWord endWord i z;

