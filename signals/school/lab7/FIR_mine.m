%% Cesar Nunez Rodriguez
%% Signals Lab 6
%% Part 1: Finite Impulse Response Filter
x1 = [ones(1,20) zeros(1,30)];
h = x1./20;
y1 = FIR_mine(h,x1);
n1 = 0:49;
figure
stem(n1,y1)
title('20-pt Averager')
xlabel('n')
ylabel('y')
