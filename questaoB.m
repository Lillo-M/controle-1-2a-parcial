clear; clc;
s = tf('s');

K_planta = 15;
z = 3;
a = 5;
b = -1.6;
G = (K_planta * (s + z)) / ((s + a) * (s^2 + b));

alfpha = 0.208;
wc = 4.6;
T = 1 / (wc * sqrt(alfpha));
lead = (1 + T*s) / (1 + alfpha*T*s);

wz = wc / 10;
wp = wz / 10;
lag = (1 + s/wz) / (1 + s/wp);

M = abs(evalfr(lead*lag*G,1j*wc));

K = 1/M;

C = K * lead * lag;

margin(C * G)

Kp = dcgain(C*G);

erro = 1/(1+Kp);

K0 = dcgain(G);

erro0 = 1/(1+K0);

sys_cl = feedback(C * G, 1);

figure
step(sys_cl)
grid on
title('Resposta ao Degrau em Malha Fechada')

disp(stepinfo(sys_cl))