%%實驗三
[input,fs]=audioread('1.wav');  %讀入提供的wav檔以及其取樣頻率
mic=[1 2 2];               %麥克風位置(公尺)
nn=5;                         %反射次數 (請設置1~5)
src=[2 3 1];                %喇叭位置(公尺)
rm=[5 5 4];                %房間大小(公尺)
a=-1;                          %反射係數 (請設置-1~1) 
N=291
mu=0.
h=rir(fs, mic, nn, a, rm, src);      %產生房間的h
d=filter(h,1,input);
sound(d,fs);                   %播放echo
%sound(input,fs);
figure();
plot(h);
