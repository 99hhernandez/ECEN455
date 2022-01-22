% Assigning variables
f0 = 1;
T = 2;
phi = -pi/3;
fs = 100;
t = 0 : 1/fs : T;

X = exp(2*pi*1i*f0*t + 1i*phi) + 2*cos(2*pi*f0*t);

% Plot magnitude of X vs t
magX = abs(X);
figure     % separate plot to separate window
plot(t,magX)
grid on
xlabel("Time (sec)")
ylabel("Magnitude of X")
title("Magnitude of X vs. t")

% PLot phase of X (in radians) vs t
theta = angle(X);   % phase angle of X
phaseX = deg2rad(theta);    % convert phase angle to radians
figure
plot(t,phaseX)
grid on
xlabel("Time (sec)")
ylabel("Phase of X (rad)")
title("Phase of X vs. t")

% Plot real and imaginary part of X vs t
realX = real(X);
imagX = imag(X);
figure
plot(t,realX)
grid on
xlabel("Time (sec)")
ylabel("Complex Value")
title("Complex Signal X vs. t")
% Add imaginary plot with real plot
hold on
plot(t,imagX,"r")
legend("Real","Imaginary")
hold off
