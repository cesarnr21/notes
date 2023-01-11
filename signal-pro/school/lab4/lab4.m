%% Cesar Nunez Rodriguez
%% Signals Lab 4
%% Part1

% Method 1

n=0:28;
x=ones(1,20);
k=1:10;
h(k)=1;

y=conv(x,h);
figure(1)
stem(n,y)
xlabel('n(sec)')
ylabel('y(n)')
title('1st Convolution Result'),

% Method 2

h1=[ones(1,10) zeros(1,19)];
x1=[ones(1,20) zeros(1,9)];
y1=zeros(size(n));
for n1=1:length(n)
    for k=1:n1
        y1(n1)=y1(n1)+x1(k).*h1(n1-k+1);
    end
end
figure(2)
stem(n,y1),xlabel('n'),ylabel('y(n)')
title('2-nd Convolution Result')

%c
%the lenght of y[n]=x[n]*h[n] is p+q-1
%% Part 2

data=load('ECG_p4.mat')

figure(3)
plot (data.ECG)
title('Plot of ECG Signal ')
xlabel('time (sec)')
ylabel('Amplitude')

fs= 200;
figure(4)
spectrogram(data.ECG,256,250,512,fs,'yaxis')
title('Spectrogram of ECG Signal')

ni = [-3 -2 -1 0 1 2 3];
hi = [0.25*0.25 0.25*0.5 0.25*.75 1*0.25 0.25*.75 0.25*0.5 0.25*0.25];
figure(5)
stem(ni,hi),xlabel('n'),ylabel('h(n)')
title('Impulse Response of FIR System')

yf=conv(hi,data.ECG);
fs = 200;
t = 0:(1/fs):9.53;
figure(6)
plot(t,yf.')
title('Time Domain of FIR Output with Noisy ECG Signal');

figure(7)
spectrogram(yf,256,250,512,fs,'yaxis')
title('Spectrogram of FIR Output with Noisy ECG Signal');