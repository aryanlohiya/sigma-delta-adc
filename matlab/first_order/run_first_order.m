%% =========================================================================
% Project : Sigma-Delta ADC Modeling and RTL Implementation
%
% File    : run_first_order.m
%
% Purpose :
%   Entry point for first-order Sigma-Delta ADC behavioral simulation.
%
% Author  : Aryan Lohiya
% =========================================================================

clear;
clc;
close all;

%% Simulation Parameters

Fs = 1e6;              % Sampling frequency (Hz)
Fin = 1e3;             % Input signal frequency (Hz)
N = 1000;              % Number of samples
Amplitude = 0.5;       % Input signal amplitude

%% Generate Time Vector

t = (0:N-1)/Fs;

%% Generate Analog Input

inputSignal = Amplitude * sin(2*pi*Fin*t); %( Remove from comment to get
%analog signal)
%inputSignal = 0.30*ones(1,N); %put in comment before taking analog signal

%% Run First-Order Sigma-Delta Modulator

[bitstream, integratorHistory, errorHistory, feedbackHistory] = ...
    first_order_modulator(inputSignal);

%% Plot Results

samplesToPlot = 100;

plot_results( ...
    t, ...
    inputSignal, ...
    errorHistory, ...
    integratorHistory, ...
    bitstream, ...
    feedbackHistory, ...
    samplesToPlot);
%% Average Bitstream Value

averageOutput = mean(bitstream);

fprintf('\n');
fprintf('Average Bitstream Value : %.4f\n', averageOutput);
fprintf('Average Analog Input    : %.4f\n', mean(inputSignal));
%% Calculate SNR

snr = calculate_snr(bitstream, Fs, Fin);