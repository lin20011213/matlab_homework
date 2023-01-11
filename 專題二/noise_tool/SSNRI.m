function SSNRI_equ=SSNRI(origin,noise,clear)
clear_length=length(clear);% 設定clear_length表clear(已經進行去雜音之音
end_point=floor(clear_length/180);%修正下方圈結束點,沒寫這行會導致結束
last_count=0;%設定計數存放目前音訊最後一個位置,跟專題一的概念
remix_SSNRI=0;%設定數存取混合雜音之音訊之SSNR值
clean_SSNRI=0;%設定参數存取消除雑音之音訊之SSNR值
d1=0;%設定我們sigma的分母的參數(clear的)
d2=0;%設定我們sigma的分母的參數(remix的)
n=0;%設定我們sigma的分子的參數
for m = 1:end_point%圈,從1開始跑跑到調整後的長度為止
d1=0;%復歸
d2=0;%復歸|
n=0;%複歸
for N=last_count+1:last_count+180%根據公式設定180為間距
n=origin(N).^2 +n;%sigma公式的分子
d1=(origin(N)-clear(N)).^2+d1;%sigma公式的分母(clear)
d2=(origin(N)-noise(N)).^2+d2;%sigma公式的分母(remix
end
last_count=last_count+180;%将count移動到下個音軌的位置
clean_SSNRI=clean_SSNRI+10*log10(n/d1);%根據sigma公式,將上方分子除
remix_SSNRI=remix_SSNRI+10*log10(n/d2);%根據sigma公式,將上方分子除
SSNRI_equ=(clean_SSNRI-remix_SSNRI)/end_point;
end
end