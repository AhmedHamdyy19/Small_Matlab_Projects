% The purpose of this code is to demonstrate how a signal can be 
% represented as a sum of harmonics of different frequencies, which is an 
% important concept in signal processing and Fourier analysis.

clear, clc
[y, FS] = audioread("SpeechDFT-16-8-mono-5secs.wav"); 
t = [0:1/FS:(length(y)-1)/FS]';
soundsc(y,FS)                   
subplot(3,1,1)
plot(t,y)
title('signal y(t)')
xlim([0 5])

yf = fftshift(fft(y));
df = 1/(length(t)/FS);
f = -FS/2:df:FS/2-df;

subplot(3,1,2)
plot(f,abs(yf))
title("Signal Spectrum")
xlim([0 4000])

ycos = zeros(length(y),1);
idx = find(abs(f-1000) < 0.1);

%Instead of finding the ifft, we will plot how the signal changes when
%harmonics are added. The resulting signal is plotted at various stages, 
%with the number of harmonics added increasing over time
k = 0;
for i = ceil((length(yf)/2+1)) : idx
    ycos = ycos + 2*abs(yf(i)) * cos(2*pi*f(i)*t + angle(yf(i)));
    if mod(i,100) == 0
        k = k + 20;
        subplot(3,1,3)
        plot(t, ycos./max(ycos))
        title(sprintf("Sum of harmonics up to %d Hz", k)); 
        xlim([0 5])
        drawnow;
    end
end
