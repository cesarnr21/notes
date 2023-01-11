%% Cesar Nunez Rodriguez
%% Signals Lab 6
%% Part 1: Periodic Amplitude Modulate (AM) Sinusoid
Wm = 2*pi;
Wc = 20*Wm;
Ws = 40*Wc;
m = 0.25;
t = 0:1/Wc:0.5*Wm;

xt = (1 + m*cos(Wm*t)).*cos(Wc.*t);

figure(1)
plot(t,xt)
title('AM Signal x(t) vs t')
ylabel('x(t)')
xlabel('time(s)')

k = [-30:1:30];
To = 1;
t = [0:1/100:1];
s = 1 + 0.25.*cos(40*pi*t);
x = s.*cos(40*pi*t);
ak = CTFS(x,t,To,k);

figure(2)
stem(2*pi*k, ak.^2)
title('ak^2 vs w')
xlabel('w')
ylabel('ak^2')

%% Part 2: ECG Signal
data = load('ECG_p6.mat');
To = 2/3;
t = linspace(0,2,720);
ECG_signal = vertcat(data.ECG, data.ECG, data.ECG);

figure(3)
plot(t, ECG_signal)
title('ECG Signal vs time')
xlabel('Time (s)')

k = -30:30;
ak = CTFS(ECG_signal, t, To, k);

figure(4)
stem([-30:1:30], abs(ak).^2)
title('ECG ak^2 vs Frequency')
ylabel('ak^2')
xlabel('Frequency (hz)')

function ak = CTFS(x, t, To, k)
    K = length(k);
    m = length(x);
    j = sqrt(-1);
    
    for i = 1:K
        ak(i) = 0;
        for n = 1:m
            ak(i) = ak(i) + (1/To)*x(n)*exp(-j*(2*pi/To)*k(i)*t(n))/m;
        end
    end
end