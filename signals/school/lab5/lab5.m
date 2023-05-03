%% Cesar Nunez Rodriguez
%% Signals Lab 5
%% Part 1: CTFS Representation of a Periodic Signal
fs = 10000;
t = -4:1/fs:8;
x = (4-t);
xt = [x x x];
t1 = -4:1/30000.2:8;

figure(1)
plot(t1,xt)
title('Original Function')

ax = 2;
for k = 1:1
   next = (4/(k*pi()))*cos(((k*pi()*t)/2)-(pi()/2));
   ax = ax + next;
end

figure(2)
plot(t,ax)
title('Fourier Series Function for N=1')

ax2 = 2;
for k = 1:3
   next = (4/(k*pi()))*cos(((k*pi()*t)/2)-(pi()/2));
   ax2 = ax2 + next;
end

figure(3)
plot(t,ax2)
title('Fourier Series Function for N=3')

ax3 = 2;
for k = 1:7
   next = (4/(k*pi()))*cos(((k*pi()*t)/2)-(pi()/2));
   ax3 = ax3 + next;
end

figure(4)
plot(t,ax3)
title('Fourier Series Function for N=7')

ax4 = 2;
for k = 1:11
   next = (4/(k*pi()))*cos(((k*pi()*t)/2)-(pi()/2));
   ax4 = ax4 + next;
end

figure(5)
plot(t,ax4)
title('Fourier Series Function for N=11')

ax5 = 2;
for k = 1:51
   next = (4/(k*pi()))*cos(((k*pi()*t)/2)-(pi()/2));
   ax5 = ax5 + next;
end

figure(6)
plot(t,ax5)
title('Fourier Series Function for N=51')

%c
T = 4;
fo = 1/T;
w = 2*pi()*fo;
k=[1:12];
ak = (2./(pi()*k)).*exp(-1i*pi()/2);
ak = [2 ak];
k = [0 k];
p = abs(ak).^2;
figure(7)
stem(k,p)
title('k vs p');

figure(8)
stem(w.*k,p)
title('w.*k vs p');

%% 2. Modification of the CTFS Coefficients:
%a
aksum = 0;
for k=1:51
    akx = (2./(pi()*k)).*exp(-1i*pi()/2);
    aky = akx*exp(-1i*k*pi()/2);
    next = abs(aky)*cos(k*w*t+angle(aky));
    aksum = aksum + next;
end
figure(9)
plot(t,2+2*aksum);
title('y(t)');

%b
aksum2 = 0;
for k=1:51
    akz = (2./(pi()*-k)).*exp(-1i*pi()/2);
    next = abs(akz)*cos(k*w*t+angle(akz));
    aksum2 = aksum2 + next;
end
figure(10)
plot(t,2+2*aksum2);
title('z(t)');

%% 3. CTFS and Matlab’s fft of a Given Periodic Signal
%a and b
load('pract5_data.mat');
figure(11)
plot(xt1)
title('xt1');

%b
samp = 2028;
N = 128;
fo = 1/128;
w = 2*pi()*fo;
fs = 48000;
T = (samp/fs)/(samp/N);

%c
% 0.0246 per signal
second = [xt1 xt1 xt1 xt1, xt1 xt1 xt1 xt1, xt1 xt1 xt1 xt1, xt1 xt1 xt1 xt1, xt1 xt1 xt1 xt1, xt1 xt1 xt1 xt1];
soundsc(second,48000);
figure(12)
plot(second);

%d
k = 0:63;
s = fft(xt1,N)/N;
figure(13)
stem(k,abs(s(1:64)));
title('Plot of Ak vs w');
