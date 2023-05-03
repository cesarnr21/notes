%% Cesar Nunez Rodriguez
%% Signals Lab 7
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

%% Part 2: A Simple Infinite Impulse Response Filter
a = 1;
x2 = [ones(1,20) zeros(1,30)];
y2 = IIR_simple(a,x2);
n2 = 0:49;
figure
stem(n2,y2)
title('Accumulator')
xlabel('n')
ylabel('y')

%% Part 3: Discrete Time Channel Equalization
x3 = [ones(1,2) zeros(1,9)];
h1 = [1, -0.9];
n3 = [0:10];
v = FIR_mine(h1,x3);
figure
stem(n3,v)
title('channel')
h2 = [1 0.9 0.81 0.729 0.6561];
y3_1 = FIR_mine(h2,v);
figure
stem(n3,y3_1)
title('cascade')
y3_2 = IIR_simple(0.9,v);
figure
stem(n3,y3_2)
title('replace')

%% Part 4: Image Deblurring
load cameraman.mat
show_img(xx);
title('original')
load cameraman1.mat
show_img(yy);
title('blurred')
h4 = [1 -0.81];
for i=1:256
    zz(i,:) = FIR_mine(h4,yy(i,:));
    %yy(i,0) = 0.0;
end
show_img(zz);
title('unblurred')
function y = FIR_mine(h,x)
    % inputs: h = impulse response array of size M, x = input array of N values
    % output: y = output array of size N
    M = length(h);
    N = length(x); % N>M assumed
    for n=0:M-2 % initial outputs
        y(n+1) = 0.;
        for k=0:n
            y(n+1) = y(n+1) + h(k+1) * x(n-k+1);
        end
    end
    for n=M-1: N-1 % steady state
        y(n+1) = 0.;
        for k=0:M-1
            y(n+1) = y(n+1) + h(k+1) * x(n-k+1); % fill in
        end
    end
end

function y = IIR_simple(a,x)
    % inputs: a = feedback coefficient, x = input array of N values
    N = length(x);
    y(1) = x(1); % initial output
    for n = 2:N % steady state
        y(n)=x(n)+a*y(n-1);% fill in
    end
end