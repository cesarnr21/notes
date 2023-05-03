%% 1. convolution sum for finite duration DT signals
% 1(a)
% Using in built function
% Example x[n]=p20[n] and h[n]=p10[n] given as
% x[n] = u[n] — u[n-20]
% h[n] = u[n] — u[n-10]

% 1(b)
% (i)
h=ones(1,10);
x=ones(1,20);
n=0:10+20-2;
y=conv(x,h);
subplot(211)
stem(n,y,'*'),xlabel('n'),ylabel('y(n)')
title('1-st Convolution Result')
% (ii)
subplot(212)
h1=[ones(1,10) zeros(1,19)];
x1=[ones(1,20) zeros(1,9)];
y1=zeros(size(n));
for n1=1:length(n)
for k=1:n1
y1(n1)=y1(n1)+x1(k).*h1(n1-k+1);
end
end
stem(n,y1),xlabel('n'),ylabel('y(n)')
title('2-nd Convolution Result')

% 1(c)
% p+q-1?
   
%% 2. convolution operation on a real recording
% 2(a)
load('C:\Users\14439\Desktop\FALL2020\ECE3225!30 Signals\Lab4\ECG_p4.mat')
fs = 200;
t = 0:(1/fs):9.5;
figure
plot(t,ECG)
title('Noisy ECG');
figure
spectrogram(ECG,256,250,512,fs,'yaxis')
title('Noisy ECG Spectrogram');

% 2(b)
ni = [-3 -2 -1 0 1 2 3];
hi = [0.25*0.25 0.25*0.5 0.25*.75 1*0.25 0.25*.75 0.25*0.5 0.25*0.25];
figure
stem(ni,hi),xlabel('n'),ylabel('h(n)')
title('Impulse Response of FIR System')

% 2(c)
yf=conv(hi,ECG);
fs = 200;
t = 0:(1/fs):9.53;
figure
plot(t,yf.')
title('Time Domain of FIR Output with Noisy ECG');
% 2(d)
figure
spectrogram(yf,256,250,512,fs,'yaxis')
title('Spectrogram of FIR Output with Noisy ECG');