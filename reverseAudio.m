[sound, Fs] = audioread('soundFile');
%soundsc(sound,Fs)
rev = fliplr(sound');
%soundsc(rev,Fs*1.25)
