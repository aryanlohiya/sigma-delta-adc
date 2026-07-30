%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Compare First-Order and Second-Order Sigma-Delta ADCs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
clc;
close all;

%% Parameters

Fs = 1e6;
Fin = 1e3;
N = 1000;
Amplitude = 0.5;

t = (0:N-1)/Fs;

inputSignal = Amplitude*sin(2*pi*Fin*t);

%% Run First Order

[firstBitstream,~,~,~] = first_order_modulator(inputSignal);

%% Run Second Order

[secondBitstream,~,~,~] = second_order_modulator(inputSignal);

%% Plot Comparison

figure

subplot(3,1,1)

plot(t,inputSignal,'LineWidth',1.5)

title('Analog Input')

ylabel('Amplitude')

grid on

subplot(3,1,2)

stairs(t,firstBitstream,'LineWidth',1.2)

title('First-Order Bitstream')

ylabel('Bit')

ylim([-1.5 1.5])

grid on

subplot(3,1,3)

stairs(t,secondBitstream,'LineWidth',1.2)

title('Second-Order Bitstream')

xlabel('Time (s)')

ylabel('Bit')

ylim([-1.5 1.5])

grid on

%% Display

fprintf('\n');

fprintf('Average First-Order Bitstream  : %.4f\n',mean(firstBitstream));

fprintf('Average Second-Order Bitstream : %.4f\n',mean(secondBitstream));

fprintf('Average Analog Input           : %.4f\n',mean(inputSignal));