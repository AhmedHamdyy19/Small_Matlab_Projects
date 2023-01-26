sound = audioread('soundFile');
info = audioinfo('soundFile');
%soundsc(sound,info.SampleRate)
rev = fliplr(sound');
%soundsc(rev,info.SampleRate*1.25)
