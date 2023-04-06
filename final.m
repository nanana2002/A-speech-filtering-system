% 画出音频信号的时域波形图
[y1,fs] = audioread('record.mp3');
figure(1);
plot( y1 );
title( '原语音信号时域波形图' );
xlabel( '单位' );ylabel( '幅度' );
% 语音信号频谱分析
N= length(y1);
f1= (0:N-1)*fs/N;
y2 = fft (y1,N);
plot( f1, abs(y2) );
axis([-1000 5000 0 3000]);
title( '原语音信号频域波形图' );
xlabel('单位');ylabel('幅度');
% 滤波前后语音信号的波形及频谱
% 低通
[x,fs]=audioread('record.mp3');
x=x(:,1);Y=fft(x);
y=filter(B,A,x);Y1=fft(y);
n=0:length(x)-1;t=(0:length(x)-1)/fs;
figure(7);
subplot(3,1,1);plot(t,y);grid on;
title('低通滤波器滤波后时域波形图');
xlabel('时间');
ylabel('幅度');
subplot(3,1,2);plot(n,abs(Y));grid on;
title('滤波前语音信号频谱');
xlabel('频率');
ylabel('•幅度');
axis([0 1000000 0 8]);
subplot(3,1,3);plot(n,abs(Y1));grid on;
title('Â滤波后语音信号频谱');
xlabel('频率');
ylabel('•幅度');
axis([0 1000000 0 8]);
sound(y1,fs);



