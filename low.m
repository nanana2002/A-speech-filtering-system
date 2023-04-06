% 低通滤波器的性能指标：fp=1000Hz，fc=1200Hz，As=100dB，Ap=1dB；
function low(Fp,Fs,As,Ap,Ft)
% Fp=1000;Fs=1200;Ft=8000;As=100;Ap=1;
wp=2*pi*Fp/Ft;ws=2*pi*Fs/Ft;
[n,wn]=ellipord(wp,ws,Ap,As,'s');
[b,a]=ellip(n,Ap,As,wn,'s');
[B,A]=bilinear(b,a,1);
[h,w]=freqz(B,A);

plot(w*Ft/pi/2,abs(h));
title('低通滤波器');
xlabel('频率');
ylabel('幅度');
end