%% 實驗二
[signal,fs]=audioread('1.wav');  
%[signal1,fs]=audioread('horn.wav');
%sound(signal*10,fs);  %播放WAV出來聽 
[output,fs1]=audio_SNR('1.wav','horn.wav',10,1);
output1=WienerScalart96(output,fs,0.8);
%sound(output1,fs);
T=length(output1)
a=SSNRI(signal,output,output1)

