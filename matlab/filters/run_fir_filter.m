%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Run FIR Filter
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

%% Sigma-Delta Modulator

[bitstream,~,~,~] = first_order_modulator(inputSignal);

%% CIC Filter

R = 16;

cicOutput = cic_filter(bitstream,R);

%% FIR Filter

firOutput = fir_filter(cicOutput);

%% Plot

figure

subplot(3,1,1)

stairs(bitstream)

title('Sigma-Delta Bitstream')

grid on

subplot(3,1,2)

plot(cicOutput,'LineWidth',1.5)

title('CIC Filter Output')

grid on

subplot(3,1,3)

plot(firOutput,'LineWidth',1.5)

title('FIR Filter Output')

grid on