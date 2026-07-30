%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project : Sigma-Delta ADC Modeling and RTL Implementation
%
% File    : run_second_order.m
%
% Purpose :
% Main simulation script for Second-Order Sigma-Delta ADC.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
clc;
close all;

%% Simulation Parameters

Fs = 1e6;              % Sampling Frequency
Fin = 1e3;             % Input Frequency
N = 1000;              % Number of Samples
Amplitude = 0.5;       % Input Amplitude

%% Generate Time Vector

t = (0:N-1)/Fs;

%% Generate Analog Input

inputSignal = Amplitude*sin(2*pi*Fin*t);

%% Run Second-Order Modulator

[bitstream,int1History,int2History,feedbackHistory] = ...
    second_order_modulator(inputSignal);

%% Display Average Values

fprintf('\n');

fprintf('Average Bitstream Value : %.4f\n',mean(bitstream));

fprintf('Average Analog Input    : %.4f\n',mean(inputSignal));

%% Plot Results

plot_results_second_order( ...
    t,...
    inputSignal,...
    int1History,...
    int2History,...
    bitstream,...
    feedbackHistory);