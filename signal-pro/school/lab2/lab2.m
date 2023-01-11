%% Cesar Nunez Rodriguez
%% Signals Lab 2

%% Part 1A
Fs = 100;
Ts=1/Fs; %sampling period
t=[0:Ts:10];

f = 5;
A=1;
w = 2*pi*f;
y=0;
p=0;
x1 = A*cos(w*t+y);

figure(1)
plot (t, x1)
xlim([0 0.5])
title('Plot of x1')
xlabel('time (sec)')
ylabel('Amplitude')

figure(2)
spectrogram(x1,256,250,512,Fs, 'yaxis')
title('Spectrogram of x1')


%Part 1B
Fs = 100;
Ts=1/Fs; %sampling period
t=[0:Ts:10];

f = 90;
A=2;
w = 2*pi*f;
y=pi/3;
p=0;
x2 = A*cos(w*t+y);

figure(3)
plot (t, x2)
xlim([0 0.5])
title('Plot of x2')
xlabel('time (sec)')
ylabel('Amplitude')

figure(4)
spectrogram(x2,256,250,512,Fs, 'yaxis')
title('Spectrogram of x2')


%Part 1C
Fs = 1000;
Ts=1/Fs; %sampling period
t=[0:Ts:10];

f = 90;
A=1;
w = 2*pi*f;
y=pi/3;
p=0;
x3 = A*cos(w*t+y);

figure(5)
plot (t, x3)
xlim([0 0.5])
title('Plot of x3')
xlabel('time (sec)')
ylabel('Amplitude')

figure(6)
spectrogram(x3,256,250,512,Fs, 'yaxis')
title('Spectrogram of x3')

%% Part 2A

load 'lighthouse.mat'
show_img(xx)
title('Original picture xx')

xx3 = xx(1:3:end,1:3:end);
figure
imshow(xx3)
title('Compressed picture xx3')

%Part 2B i
xxs=zeros(size(xx));
xxs(1:3:size(xx,1),1:3:size(xx,2))=xx3;%fill in
show_img(xxs)
title('Simple Up-Sampled picture xxs')

%Part 2B ii
[Nr,Nc] = size(xx3);
ip = ceil((0.9:1:3*Nr)/3);
jp = ceil((0.9:1:3*Nc)/3);
xxh = xx3(ip,jp);
show_img(xxh)
title('Effective Up-Sampled picture xxh')
