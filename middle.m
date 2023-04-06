%  带通滤波器的性能指标：fp1=1200Hz，fp2=3000hZ
function middle(Fp1,Fp2,Fs1,Fs2,As,Ap,Ft)
% Fp1=1200;Fp2=3000;Fs1=1000;Fs2=3200;
% As=100;
% Ap=1;
wp=[2*pi*Fp1/Ft,2*pi*Fp2/Ft];
ws=[2*pi*Fs1/Ft,2*pi*Fs2/Ft];
[n,wn]=ellipord(wp,ws,Ap,As,'s');
[b,a]=ellip(n,Ap,As,wn,'s');
[B,A]=bilinear(b,a,1);
[h,w]=freqz(B,A);
figure(6);
plot(w*Ft/pi/2,abs(h));
title('带通滤波器');
xlabel('频率');
ylabel('幅度');
end