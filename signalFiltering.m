clear, clc
[y, FS] = audioread("NoisySpeech-16-22p5-mono-5secs.wav"); 
t = [0:1/FS:(length(y)-1)/FS]';
                  
yf = fftshift(fft(y));
df = 1/(length(t)/FS);
f = -FS/2:df:FS/2-df;

subplot(3,1,1)
plot(f,abs(yf))
title("Signal Spectrum")
xlim([0 4000])

ySquareFiltered = yf' .* (abs(f)<1000);
subplot(3,1,2)
plot(f,abs(ySquareFiltered))
title("Square-Filtered Signal")
xlim([0 4000])

sigma = 1000;
H = exp(-f.^2/(2*sigma^2));
yGaussFiltered = H .* yf';
subplot(3,1,3)
plot(f,abs(yGaussFiltered))
title("Gaussian-Filtered Signal")
xlim([0 4000])

sig1 = fliplr(real(ifft(fftshift(yGaussFiltered))));
sig2 = fliplr(real(ifft(fftshift(ySquareFiltered))));
soundsc(y,FS)
pause;
soundsc(fliplr(real(ifft(fftshift(yGaussFiltered)))), FS)
pause;
soundsc(sig1 - mean(sig1), FS)
pause
soundsc(sig2 - mean(sig2), FS)
