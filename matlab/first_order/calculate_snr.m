%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project : Sigma-Delta ADC Modeling and RTL Implementation
%
% File    : calculate_snr.m
%
% Purpose :
% Calculates the Signal-to-Noise Ratio (SNR) of the
% Sigma-Delta ADC bitstream using FFT.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function snr = calculate_snr(bitstream, Fs, Fin)

%% Number of Samples

N = length(bitstream);

%% FFT

Y = fft(bitstream);

P2 = abs(Y/N);

P1 = P2(1:N/2+1);

P1(2:end-1) = 2*P1(2:end-1);

%% Frequency Vector

f = Fs*(0:N/2)/N;

%% Find Signal Bin

[~, signalBin] = min(abs(f - Fin));

%% Signal Power

signalPower = P1(signalBin)^2;

%% Noise Power

noisePower = sum(P1.^2) - signalPower;

%% Calculate SNR

snr = 10*log10(signalPower/noisePower);

%% Display Result

fprintf('\n');
fprintf('Signal Frequency : %.0f Hz\n',f(signalBin));
fprintf('SNR              : %.2f dB\n',snr);

%% Plot FFT Spectrum

figure

plot(f/1000,20*log10(P1),'LineWidth',1.5)

grid on

xlabel('Frequency (kHz)')
ylabel('Magnitude (dB)')

title('FFT of Sigma-Delta Bitstream')

xlim([0 Fs/2000])
