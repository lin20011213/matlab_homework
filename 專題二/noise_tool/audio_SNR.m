%%����@
function [x,fs]=audio_SNR(music,noise,time,SNR2)

s=['fileName=' '''' music ''';']; 	%�����ɮ�
eval(s);
[y, fs]=audioread(fileName);          %�������
s=['fileName=' '''' noise ''';'];   %���T�ɮ�
eval(s);
[noise, fs2]=audioread(fileName);     %���noise
SNR=SNR2;                           %�T����
[col row]=size(noise);

if row==1
    noise(:,2)=noise(:,1);
end

T2=col;
T=fs*time;%��X���x�}�j�p
mod_num=mod(T,col);
copy_num=fix(T/col);
temp=repmat(noise,copy_num,1);
count=copy_num*col+1;
count_1=1;
for i=count:T                           %�������T�ɶ��A�t�X����ɶ�
    temp(i,:)=noise(count_1,:);
    count_1=count_1+1;
end
noise=temp;
out_signal=zeros(T,2); %�ظm��X�j�p
%% 
%% 

%-------�Цb���s��έק�A��SNR��{��--------
signal_left=(sum(y(1:T,1).^2));
signal_right=(sum(y(1:T,2).^2));
noice_left=(sum(noise(1:T,1).^2));
noice_right=(sum(noise(1:T,2).^2));

SNR_of=10*log(signal_left/noice_left);  %�p�⥪�n�D�쥻�����T����
SNR_or=10*log(signal_right/noice_right); %�p��k�n�D�쥻�����T����

%--------------------------------------------

noise(:,1)=sqrt(10^((SNR_of-SNR)/20))*noise(:,1);   %����noise�n���n�D���n���j�p
noise(:,2)=sqrt(10^((SNR_or-SNR)/20))*noise(:,2);   %����noise�n�k�n�D���n���j�p
out_signal(:,1)=y(1:T,1)+noise(:,1);         %�N�쥻���n���[�J���T
out_signal(:,2)=y(1:T,2)+noise(:,2);         %�N�쥻���n���[�J���T


out_signal(:,1)=out_signal(:,1)/max(out_signal(:,1)); %�N���n�D���W��
out_signal(:,2)=out_signal(:,2)/max(out_signal(:,2)); %�N�k�n�D���W��
% filename=['out_signal_' int2str(time) 's_' int2str(SNR2) 'db'];  %�ɮ׿�X
% wavwrite(out_signal,fs,filename)
SNR_of=SNR_of
SNR_or=SNR_or
x=out_signal;
fs=fs;
end