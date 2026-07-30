%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Run CIC Filter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
clc;
close all;

Fs = 1e6;
Fin = 1e3;

N = 1000;

Amplitude = 0.5;

t = (0:N-1)/Fs;

inputSignal = Amplitude*sin(2*pi*Fin*t);

[bitstream,~,~,~] = first_order_modulator(inputSignal);

R = 16;

filteredOutput = cic_filter(bitstream,R);

figure

subplot(2,1,1)

stairs(bitstream)

title('Sigma-Delta Bitstream')

grid on

subplot(2,1,2)

plot(filteredOutput,'LineWidth',1.5)

title('CIC Filter Output')

grid on