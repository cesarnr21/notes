%% 1. CTFS Representation of a periodic signal:
% 1(a)
% 1(b)
fs = 10000;

t = -4:1/fs:8;
%N = [1,3,7,11,51];

x = (4-t);
xt = [x x x];
t1 = -4:1/30000.2:8;

ax = 2;
for k = 1:1
   next = (4/(k*pi()))*cos(((k*pi()*t)/2)-(pi()/2));
   ax = ax + next;
end

ax2 = 2;
for k = 1:3
   next = (4/(k*pi()))*cos(((k*pi()*t)/2)-(pi()/2));
   ax2 = ax2 + next;
end

ax3 = 2;
for k = 1:7
   next = (4/(k*pi()))*cos(((k*pi()*t)/2)-(pi()/2));
   ax3 = ax3 + next;
end

ax4 = 2;
for k = 1:11
   next = (4/(k*pi()))*cos(((k*pi()*t)/2)-(pi()/2));
   ax4 = ax4 + next;
end

ax5 = 2;
for k = 1:51
   next = (4/(k*pi()))*cos(((k*pi()*t)/2)-(pi()/2));
   ax5 = ax5 + next;
end


figure
plot(t1,xt)
title('Original Function')

figure
plot(t,ax)
title('Fourier Series Approximated Function for N=1')

figure
plot(t,ax2)
title('Fourier Series Approximated Function for N=3')

figure
plot(t,ax3)
title('Fourier Series Approximated Function for N=7')

figure
plot(t,ax4)
title('Fourier Series Approximated Function for N=11')

figure
plot(t,ax5)
title('Fourier Series Approximated Function for N=51')
%%
% 1(c)
T = 4;
fo = 1/T;
w = 2*pi()*fo;
k=[1:12]; % frq axis is k*w0 6pi
ak = (2./(pi()*k)).*exp(-1i*pi()/2);
ak = [2 ak];
k = [0 k];
p = abs(ak).^2;
figure
stem(k,p)
title('k vs p');
figure
stem(w.*k,p)
title('w.*k vs p');
%% 2. Modification of the CTFS Coefficients:
% 2(a)

akSumx = 0;
for k=1:51
akx = (2./(pi()*k)).*exp(-1i*pi()/2);
aky = akx*exp(-1i*k*pi()/2);
next = abs(aky)*cos(k*w*t+angle(aky));
akSumx = akSumx + next;
end
figure
plot(t,2+2*akSumx);
title('x(t)');

% 2(b)
akSumz = 0;
for k=1:51
akz = (2./(pi()*-k)).*exp(-1i*pi()/2);
next = abs(akz)*cos(k*w*t+angle(akz));
akSumz = akSumz + next;
end
figure
plot(t,2+2*akSumz);
title('z(t)');
%% 3. CTFS and Matlab’s fft of a Given Periodic Signal
% 3(a)
load('pract5_data.mat');
figure
plot(xt1)
title('xt1');
% 3(b)
samp = 2028;
N = 128;
fo = 1/128;
w = 2*pi()*fo;
fs = 48000;
T = (samp/fs)/(samp/N);
% 3(c)
% 0.0246 per signal
second = [xt1 xt1 xt1 xt1, xt1 xt1 xt1 xt1, xt1 xt1 xt1 xt1, xt1 xt1 xt1 xt1, xt1 xt1 xt1 xt1, xt1 xt1 xt1 xt1];
soundsc(second,48000);
figure
plot(second);

% 3(d)
k = 0:63;
s = fft(xt1,N)/N;
stem(k,abs(s(1:64)));