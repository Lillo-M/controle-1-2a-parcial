clear; clc;
A = [0 1 0; 0 0 1; 8 1.6 -5];
B = [0; 0; 1];
C = [45 15 0];
D = 0;

Mc = [B A*B A^2*B]
det(Mc)

p = [-4.03+5.34j ...
     -4.03-5.34j ...
     -15];

Ks = place(A,B,p)

Acl = A-B*Ks;

sys_cl = ss(Acl,B,C,D);

Gdc = dcgain(sys_cl)

ess = 1-Gdc

N = 1/Gdc

sys_N = ss(Acl,B*N,C,D);

Gdc_N = dcgain(sys_N);
ess_N = 1 - Gdc_N

figure
step(sys_N)
grid on
title('Resposta ao Degrau em Malha Fechada Com pré-compensador')

disp(stepinfo(sys_N))