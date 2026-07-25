function [bitstream, integratorHistory, errorHistory, feedbackHistory] = ...
    first_order_modulator(inputSignal)
%% =========================================================================
% Project : Sigma-Delta ADC Modeling and RTL Implementation
%
% File    : first_order_modulator.m
%
% Purpose :
%   Implements a first-order Sigma-Delta modulator.
%
% Inputs
%   inputSignal : Analog input sequence
%
% Outputs
%   bitstream          : 1-bit output sequence
%   integratorHistory  : Integrator output at each sample
%   errorHistory       : Difference amplifier output
%   feedbackHistory    : DAC feedback signal
%
% =========================================================================

%% Number of Samples

N = length(inputSignal);

%% Allocate Memory

bitstream = zeros(1,N);
integratorHistory = zeros(1,N);
errorHistory = zeros(1,N);
feedbackHistory = zeros(1,N);

%% Initialize State Variables

integrator = 0;
feedback = 0;

%% Sigma-Delta Modulator Loop

for k = 1:N

    % Difference Amplifier
    error = inputSignal(k) - feedback;

    % Store Error
    errorHistory(k) = error;

    % Integrator
    integrator = integrator + error;
    integratorHistory(k) = integrator;

    % 1-bit Quantizer
    if integrator >= 0
        bitstream(k) = 1;
    else
        bitstream(k) = -1;
    end

    % DAC Feedback
    feedback = bitstream(k);
    feedbackHistory(k) = feedback;

end

end