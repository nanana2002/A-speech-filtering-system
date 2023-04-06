% 高通滤波器的性能指标：fp=4500Hz，fc=5000Hz，As=100dB，Ap=1dB；
function high(Fp,Fs,As,Ap,Ft)
% Fp=4500;Fs=5000;
% As=100;Ap=1;
wp=2*pi*Fp/Ft;
ws=2*pi*Fs/Ft;
[n,wn]=ellipord(wp,ws,Ap,As,'s');
[b,a]=ellip(n,Ap,As,wn,'high','s');
[B,A]=bilinear(b,a,1);
[h,w]=freqz(B,A);
figure(4);
plot(w*Ft/pi/2,abs(h));
title('高通滤波器');
xlabel('频率');
ylabel('幅度');
end