clear; clc;
s = tf('s');

K_planta = 15;
z = 3;
a = 5;
b = -1.6;
G = (K_planta * (s + z)) / ((s + a) * (s^2 + b));

sd = -4.03 + 5.34j;
z2 = 5.26;

C0 = ((s+3)*(s+z2))/s;
K = 1/abs(evalfr(C0*G,sd));
C = K*C0;

figure(1)
rlocus(C0*G)
hold on
plot(real(sd), imag(sd), 'rx', 'MarkerSize', 12, 'LineWidth', 2)
plot(real(sd), -imag(sd), 'rx', 'MarkerSize', 12, 'LineWidth', 2)
title(sprintf('Lugar das Raízes - z2 = %.2f', z2))
grid on
hold off 

T = feedback(C*G,1);
figure(3)
step(T)
grid on
title('Resposta ao Degrau em Malha Fechada')

disp(stepinfo(T))