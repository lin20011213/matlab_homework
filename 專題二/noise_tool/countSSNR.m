function [y1,y2,y3]=countSSNR(name,proportion)
[signal,fs]=audioread(name);  

[output_horn,fs1]=audio_SNR(name,'horn.wav',10,proportion);
output1=WienerScalart96(output_horn,fs,0.8);
T=length(output1);
a1=SSNRI(signal,output_horn,output1);


[output_mouse,fs2]=audio_SNR(name,'mouse.wav',10,proportion);
output2=WienerScalart96(output_mouse,fs,0.8);
T=length(output2);
a2=SSNRI(signal,output_mouse,output2);
 

[output_whitenoise,fs3]=audio_SNR(name,'whitenoise.wav',10,proportion);
output3=WienerScalart96(output_whitenoise,fs,0.8);
T=length(output3);
a3=SSNRI(signal,output_whitenoise,output3);

y1=a1;
y2=a2;
y3=a3;
end