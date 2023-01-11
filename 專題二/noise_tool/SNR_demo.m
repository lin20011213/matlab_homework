function [y1,y2,y3]=SNR_demo(name,fs1,fs2,fs3)
%fs1=11025;
[y1,fs1]=audio_SNR(name,'horn.wav',10,5);
time=(1:length(y1))/fs1;
y1=y1(:,1);
figure;
spectrogram(y1,1024,1000,[],fs1,'yaxis');
titlename=[name,' with horn']
title(titlename);
figure;
plot(time,y1);title(titlename);
ylabel("震幅");
xlabel('Time(s)')

%fs2=11025;
[y2,fs2]=audio_SNR(name,'mouse.wav',10,5);
time=(1:length(y2))/fs2;
y2=y2(:,1);
figure;
spectrogram(y2,1024,1000,[],fs2,'yaxis');
titlename=[name,' with mouse']
title(titlename);
figure;
plot(time,y2);title(titlename);
ylabel("震幅");
xlabel('Time(s)')

%fs3=11                         mnnnvc  025;
[y3,fs3]=audio_SNR(name,'whitenoise.wav',10,5);
time=(1:length(y3))/fs3;
y3=y3(:,1);
figure;
spectrogram(y3,1024,1000,[],fs3,'yaxis');
titlename=[name,' with whitenoise']
title(titlename);
figure;
plot(time,y3);title(titlename);
ylabel("震幅");
xlabel('Time(s)')
fs=11025
end
function [y1,y2,y3]=SNR_demo_solo(name,fs1,other_name)
%fs1=11025;
[y1,fs1]=audio_SNR(name,other_name,10,5);
time=(1:length(y1))/fs1;
y1=y1(:,1);
figure;
spectrogram(y1,1024,1000,[],fs1,'yaxis');
titlename=[name,' with horn']
title(titlename);
figure;
plot(time,y1);title(titlename);
ylabel("震幅");
xlabel('Time(s)')
end