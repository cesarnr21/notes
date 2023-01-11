%% Cesar Nunez Rodriguez
%% Signals Lab 1

%% Part 1A and 1B
% Female Villanova
[S,Fs]=audioread('villanova1.wma');

Ts=1/Fs; %sampling period
N=length(S); %length of the audio signal, number of samples
Te = N*Ts; %final time
time=[Ts:Ts:Te]; % calculate the time axis (sec) of the wma file
% plot the wma file vs time
figure(1)
plot (time, S)
title('Speech Signal of female "Villanova" ')
xlabel('time (sec)')
ylabel('Amplitude')
% plot spectrogram of the audio signal
figure(2)
spectrogram(S(:,1).^2,1024,1000,2048,Fs,'yaxis')
title('Spectrogram of female "Villanova" ')
% Listen to the audio signal using soundsc command: amplitude autoscaled
soundsc(S,Fs)

% Part 1C and 1D

% Female University
[S,Fs]=audioread('university1.wma');

Ts=1/Fs; %sampling period
N=length(S); %length of the audio signal, number of samples
Te = N*Ts; %final time
time=[Ts:Ts:Te]; % calculate the time axis (sec) of the wma file
% plot the wma file vs time
figure(3)
plot (time, S)
title('Speech Signal of female "Univeristy" ')
xlabel('time (sec)')
ylabel('Amplitude')
% plot spectrogram of the audio signal
figure(4)
spectrogram(S(:,1).^2,1024,1000,2048,Fs,'yaxis')
title('Spectrogram of female "University" ')
% Listen to the audio signal using soundsc command: amplitude autoscaled
soundsc(S,Fs)

% Male Villanova
[S,Fs]=audioread('villanova2.wma');

Ts=1/Fs; %sampling period
N=length(S); %length of the audio signal, number of samples
Te = N*Ts; %final time
time=[Ts:Ts:Te]; % calculate the time axis (sec) of the wma file
% plot the wma file vs time
figure(5)
plot (time, S)
title('Speech Signal of male "Villanova" ')
xlabel('time (sec)')
ylabel('Amplitude')
% plot spectrogram of the audio signal
figure(6)
spectrogram(S(:,1).^2,1024,1000,2048,Fs,'yaxis')
title('Spectrogram of male "Villanova" ')
% Listen to the audio signal using soundsc command: amplitude autoscaled
soundsc(S,Fs)

% Male University
[S,Fs]=audioread('university2.wma');

Ts=1/Fs; %sampling period
N=length(S); %length of the audio signal, number of samples
Te = N*Ts; %final time
time=[Ts:Ts:Te]; % calculate the time axis (sec) of the wma file
% plot the wma file vs time
figure(7)
plot (time, S)
title('Speech Signal of male "Univeristy" ')
xlabel('time (sec)')
ylabel('Amplitude')
% plot spectrogram of the audio signal
figure(8)
spectrogram(S(:,1).^2,1024,1000,2048,Fs,'yaxis')
title('Spectrogram of male "Univeristy" ')
% Listen to the audio signal using soundsc command: amplitude autoscaled
soundsc(S,Fs)
%%
% Self Villanova
[S,Fs]=audioread('villanova_self.m4a');

Ts=1/Fs; %sampling period
N=length(S); %length of the audio signal, number of samples
Te = N*Ts; %final time
time=[Ts:Ts:Te]; % calculate the time axis (sec) of the wma file
% plot the wma file vs time
figure(9)
plot (time, S)
title('Speech Signal of self "Villanova" ')
xlabel('time (sec)')
ylabel('Amplitude')
% plot spectrogram of the audio signal
figure(10)
spectrogram(S(:,1).^2,1024,1000,2048,Fs,'yaxis')
title('Spectrogram of self "Villanova" ')
% Listen to the audio signal using soundsc command: amplitude autoscaled
soundsc(S,Fs)
%%
% Self University
[S,Fs]=audioread('university_self.m4a');

Ts=1/Fs; %sampling period
N=length(S); %length of the audio signal, number of samples
Te = N*Ts; %final time
time=[Ts:Ts:Te]; % calculate the time axis (sec) of the wma file
% plot the wma file vs time
figure(11)
plot (time, S)
title('Speech Signal of self "Univeristy" ')
xlabel('time (sec)')
ylabel('Amplitude')
% plot spectrogram of the audio signal
figure(12)
spectrogram(S(:,1).^2,1024,1000,2048,Fs,'yaxis')
title('Spectrogram of self "Univeristy" ')
% Listen to the audio signal using soundsc command: amplitude autoscaled
soundsc(S,Fs)

%% 
%Part 2C
[S,Ws]=audioread('villanova_self.m4a');

W=ones(size(S));
W(1:2,:)=0;
WS=W.*S;
Ts=1/Ws; %sampling period
N=length(WS); %length of the audio signal, number of samples
Te = N*Ts; %final time
time=[Ts:Ts:Te]; % calculate the time axis (sec) of the wma file
% % % plot the wma file vs time
figure(13)
plot (time, WS)
title('Speech Signal of WS (Villanova)')
xlabel('time (sec)')
ylabel('Amplitude')
% Listen to the audio signal using soundsc command: amplitude autoscaled
soundsc(S,Ws)

%% Part 2C
[S,Es]=audioread('university_self.m4a');
E=randn(size(S));
Sn=S+0.002*E; %small weight
%Sn=S+0.1*E; %big weight
Ts=1/Es; %sampling period
N=length(S); %length of the audio signal, number of samples
Te = N*Ts; %final time
time=[Ts:Ts:Te]; % calculate the time axis (sec) of the wma file
% plot the wma file vs time
figure(14)
plot (time, Sn)
title('Speech Signal of E Signal (University)')
xlabel('time (sec)')
ylabel('Amplitude')
% plot spectrogram of the audio signal
figure(15)
spectrogram(Sn(:,1).^2,1024,1000,2048,Es,'yaxis')
title('Spectrogram of E Signal')
% Listen to the audio signal using soundsc command: amplitude autoscaled
soundsc(Sn,Es)