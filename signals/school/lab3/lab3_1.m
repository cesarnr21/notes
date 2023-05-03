%% Cesar Nunez Rodriguez
%% Signals Lab 3
%% Part 1

xx1 = sumcos([20], [1], 500, 0.25);
xx2 = sumcos([40], [-j/2], 500, 0.25);
xx3 = sumcos([20 40 60], [1 -1 .25*exp(j*pi/4)], 500, 0.25);

fs=500;
dur= 0.25;
t = [0:1/fs:dur];

figure(1)
plot (t, xx1)
title('Plot of xx1')
xlabel('time (sec)')
ylabel('Amplitude')

figure(2)
plot (t, xx2)
title('Plot of xx2')
xlabel('time (sec)')
ylabel('Amplitude')

figure(3)
plot (t, xx3)
title('Plot of xx3')
xlabel('time (sec)')
ylabel('Amplitude')

figure(1)
plot (t, xx1)
hold on
plot (t, xx2)
plot (t, xx3)
title('Plot of all COS sums')
xlabel('time (sec)')
ylabel('Amplitude')

    
function xx = sumcos(thisF, thisX, thisFs,thisDur)
    f = thisF;
    X = thisX;
    fs = thisFs;
    dur = thisDur;
    t = [0:1/fs:dur];
    xx = zeros(size(t));
    for k = 1:length(f)
        xx = xx + abs(X(k))*cos(2*pi*f(k)*t + angle(X(k)));
    end
end
