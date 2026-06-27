% | Quem      | Ganho (K) | Zero (z) | Polo (a) | Polos (b) |
% |-----------x-----------x----------x----------x-----------|
% |  M e E    |    15     |    3     |    5     |  -1,6     |
% |-----------x-----------x----------x----------x-----------|
% |  Kaks     |    30     |    3     |    10    |  -1,6     |
% |---------------------------------------------------------|

clc, clear, close all;

ganho_k =   15;
zero    =    3;
polo_a  =    5;
polo_b  = -1.6;

% (a) Trace os diagramas de lugar das raízes e de Bode de módulo e 
% fase do sistema G(s). A partir dos diagramas discuta a 
% estabilidade do sistema, indicando os valores de ganho e fase críticos.

syms s

numerador   = ganho_k * (s + zero);
denominador =  (s + polo_a) * (s^2 + polo_b);

sistema_G = tf(sym2poly(collect(numerador)), sym2poly(collect(denominador)));

figure; rlocus(sistema_G);

fig = gcf;
exportgraphics(fig, 'rlocus_questao_1.png')

figure; bode(sistema_G);

fig = gcf;
exportgraphics(fig, 'bode_questao_1.png')