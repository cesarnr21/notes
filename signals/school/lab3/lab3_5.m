%% Cesar Nunez Rodriguez
%% Signals Lab 3
%% Part 3

%I am working with Vivaldi's Spring

%the array must contain a number of values divisible by 4
play([45 49 33 49 33 49 47 45 52 51 45 49 33 49 52 51]);

function play_scale = play(notes)
    keys = notes;
    dur = 0.25 * ones(1,length(keys));
    Fs = 11025;
    harmonic_nums = 1:length(keys);
    harmonic_vals = ones(1,length(keys));
    xx = zeros(1,sum(dur)*Fs + 100);
    n1 = 1;
    for kk = 1:length(keys)
        keynum = keys(kk);
        tone = note(keynum,Fs,harmonic_nums(kk),harmonic_vals(kk), dur);
        n2 = n1 + length(tone) - 1;
        xx(n1:n2) = xx(n1:n2) + tone;
        n1 = n2+1;
    end
    figure()
    spectrogram(xx,256,250,512,Fs, 'yaxis')
    title('Spectrogram of xx')
    soundsc(xx,Fs)
end

function tone = note(keynum,fs,harmonic_nums,harmonic_vals, dur)
    time = [0:1/fs:dur];
    fund_freq = 440*2^((keynum-49)/12);
    tone = harmonic_vals*cos(2*pi*fund_freq.*time);
end

