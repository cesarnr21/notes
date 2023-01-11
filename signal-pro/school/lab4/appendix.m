%% Cesar Nunez Rodriguez
%% Signals Lab 3

% Practicum III, Appendix 1, The convolution sum
%
% Example x[n]=p6[n-5] and h[n]=(0.9)^(n-5)p16[n-5] given as
% x[n] = u[n-5] – u[n-11]
% h[n] = (.9)^(n-5) (u[n-5] – u[n-21])
%,
% To illustrate one way of handling delayed signals in Matlab we load zeros into the data arrays 
% so that the first element of each array corresponds to time n=0. However, using the
% convolution delay property (to keep track of what time the array elements correspond to),
% there is really no need to prepend or append zeros to the input arrays in Matlab’s conv.m
% function.
%
% clear
% clf
% pause
%% Method 1
%{
clear 
clear functions
clf
%}
x=ones(1,6); % Generate 6 samples of x[n] for n=5,..,10
k=1:16; % Generate 16 samples of h[n] for n=5,..,20
h(k)=(.9).^(k-1);
% pause
y=conv(x,h); % Using the MATLAB conv command to convolve h and x and form the output y
% pause

y1(1:40)=zeros(1,40); % Plot 40 samples of y[n] for n=0,1,...,39
y1(11:31)=y;
n=0:1:39;
figure
subplot(211)
stem(n,y1,'*'),xlabel('n'),ylabel('y(n)'),
title('1st Convolution Result'),
% pause

%% Method 2
% Now let’s do it again without using the MATLAB conv command.
% We’ll do it ourselves.
clear
x=zeros(1,11); % Generate 11 samples of x[n] for n=0,..,10
x(6:11)=ones(1,6); %
h=zeros(1,21); % Generate 21 samples of h[n] for n=0,..,20
k=0:1:15; %
h(6:21)=(.9).^k; %
% pause
%
x(12:40)=zeros(1,29); % Directly convolve h and x --> output y
h(22:40)=zeros(1,19);
for n=1:40;
y(n)=0.;
for k=1:n;
y(n)=y(n)+x(k)*h(n+1-k);
end
end
% pause
%
clear n
n=0:1:39;
figure
subplot(212)
stem(n,y),xlabel('n'),ylabel('y(n)')
title('2-nd Convolution Result')






%%


before
x=ones(1,20); % Generate 6 samples of x[n] for n=5,..,10
k=1:10; % Generate 16 samples of h[n] for n=5,..,20
h(k)=(k-1);
% pause
y=conv(x,h); % Using the MATLAB conv command to convolve h and x and form the output y
% pause

y1(1:28)=zeros(1,28); % Plot 40 samples of y[n] for n=0,1,...,39
y1(10:19)=y;
n=0:1:27;
figure
subplot(211)
stem(n,y1,'*'),xlabel('n'),ylabel('y(n)'),
title('1st Convolution Result'),
% pause
%% Method 2

% Now let’s do it again without using the MATLAB conv command.
% We’ll do it ourselves.
clear
x=zeros(1,11); % Generate 11 samples of x[n] for n=0,..,10
x(6:11)=ones(1,6); %
h=zeros(1,21); % Generate 21 samples of h[n] for n=0,..,20
k=0:1:15; %
h(6:21)=(.9).^k; %
% pause
%
x(12:40)=zeros(1,29); % Directly convolve h and x --> output y
h(22:40)=zeros(1,19);
for n=1:40;
y(n)=0.;
for k=1:n;
y(n)=y(n)+x(k)*h(n+1-k);
end
end
% pause
%
clear n
n=0:1:39;
figure
subplot(212)
stem(n,y),xlabel('n'),ylabel('y(n)')
title('2-nd Convolution Result')

