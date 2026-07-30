%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project : Sigma-Delta ADC Modeling and RTL Implementation
%
% File    : second_order_modulator.m
%
% Purpose :
% Behavioral model of a Second-Order Sigma-Delta ADC
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [bitstream, int1History, int2History, feedbackHistory] = ...
    second_order_modulator(inputSignal)

%% Number of Samples

N = length(inputSignal);

%% Initialize Variables

int1 = 0;
int2 = 0;

feedback = 0;

bitstream = zeros(1,N);

int1History = zeros(1,N);
int2History = zeros(1,N);

feedbackHistory = zeros(1,N);

%% Sigma-Delta Loop

for k = 1:N

    % First Integrator

    error1 = inputSignal(k) - feedback;

    int1 = int1 + error1;

    int1History(k) = int1;

    % Second Integrator

    int2 = int2 + int1;

    int2History(k) = int2;

    % Comparator

    if int2 >= 0

        bitstream(k) = 1;
        feedback = 1;

    else

        bitstream(k) = -1;
        feedback = -1;

    end

    feedbackHistory(k) = feedback;

end

end