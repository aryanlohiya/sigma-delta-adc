%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Complete Sigma-Delta ADC Decimation Chain
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
clc;
close all;

%% Simulation Parameters

Fs = 1e6;
Fin = 1e3;
N = 1000;
Amplitude = 0.5;
R = 16;

%% Input Signal

t = (0:N-1)/Fs;

inputSignal = Amplitude*sin(2*pi*Fin*t);

%% Sigma-Delta Modulator

[bitstream,~,~,~] = first_order_modulator(inputSignal);

%% CIC Filter

cicOutput = cic_filter(bitstream,R);

%% FIR Filter

firOutput = fir_filter(cicOutput);

%% Plot Results

figure

subplot(4,1,1)

plot(t,inputSignal,'LineWidth',1.5)

title('Analog Input')

grid on

subplot(4,1,2)

stairs(bitstream)

title('1-bit Sigma-Delta Bitstream')

grid on

subplot(4,1,3)

plot(cicOutput,'LineWidth',1.5)

title('CIC Filter Output')

grid on

subplot(4,1,4)

plot(firOutput,'LineWidth',1.5)

title('Final Decimated Output')

grid on