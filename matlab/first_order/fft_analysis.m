%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FFT Analysis of First-Order Sigma-Delta Modulator
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
clc;
close all;

%% Run Modulator

run_first_order

%% FFT

Nfft = length(bitstream);

Y = fft(bitstream);

Y = abs(Y)/Nfft;

Y = Y(1:Nfft/2);

f = (0:Nfft/2-1)*(Fs/Nfft);

%% Plot

figure

plot(f/1000,20*log10(Y),'LineWidth',1.5)

grid on

xlabel('Frequency (kHz)')

ylabel('Magnitude (dB)')

title('FFT of Sigma-Delta Bitstream')

xlim([0 20])
%% Calculate SNR

snr = calculate_snr(bitstream,Fs,Fin);

fprintf('SNR = %.2f dB\n',snr);