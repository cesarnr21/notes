%% Cesar Nunez Rodriguez
%% Signals Lab 3

%2a
Fs = 8000;
Ts=1/Fs; %sampling period
t=[0:Ts:2];

f = 1000;
A=100;
w = 2*pi*f;
y=0;
x1 = A*cos(w*t+y);

figure(1)
plot (t, x1)
xlim([0 0.02])
title('Plot of x1')
xlabel('time (sec)')
ylabel('Amplitude')

%2b
Fs = 8000;
Ts=1/Fs; %sampling period
t=[0:Ts:2];

f = 500;
A=100;
w = 2*pi*f;
y=pi/3;
x2 = A*cos(w*t+y);

figure(2)
plot (t, x2)
xlim([0 0.02])
title('Plot of x2')
xlabel('time (sec)')
ylabel('Amplitude')

%2c
xx = [x1 zeros(1, 2000) x2]; 

figure(3)
spectrogram(xx,256,250,512,Fs, 'yaxis')
title('Spectrogram of xx')

