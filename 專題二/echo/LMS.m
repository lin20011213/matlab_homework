%%實驗四
%% LMS
clear;
fs=10000;[input]=randn(1,8e4);  %讀入提供的wav檔以及其取樣頻率
%[input,fs]=audioread('1.wav');
mic=[1 2 2];               %麥克風位置(公尺)
nn=1;                         %反射次數 (請設置1~5)
src=[2 3 1];                %喇叭位置(公尺)
rm=[5 5 4];                %房間大小(公尺)
a=1;  
N=291; % Filter length
mu= 0.0006; % step-size parameter 
h=rir(fs, mic, nn, a, rm, src);      %產生房間的h
d=filter(h,1,input);
w0=zeros(N,1);
p=1;
n = length(input);
Amse_lms = zeros(n,1);


% Call full_LMS funtion
[e,w] = full_lms(input,d,N,w0,mu) ; % Calculate error and hhat
plot(h)
figure;
plot(w(end,:))
figure;



%% Calculate MSE

Amse_lms(:,1) = Amse_lms(:,1)+ e(:,1).^2;   % Amse_lms = msesim(lms,input',d',1);
L_ave = 80;                         
b_ave = [1,zeros(1,L_ave-1),-1];    
a_ave = [1,-1]*L_ave;

mse_lms = filter(b_ave,a_ave,Amse_lms); % a(1)*y(n) = b(1)*x(n) + b(2)*x(n-1) + ... + b(nb+1)*x(n-nb) - a(2)*y(n-1) - ... - a(na+1)*y(n-na)
mse_lms = 10*log10(mse_lms);   

plot(mse_lms);






