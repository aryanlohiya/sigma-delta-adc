function plot_results( ...
    t, ...
    inputSignal, ...
    errorHistory, ...
    integratorHistory, ...
    bitstream, ...
    feedbackHistory, ...
    samplesToPlot)

%% =========================================================================
% Project : Sigma-Delta ADC Modeling and RTL Implementation
%
% File    : plot_results.m
%
% Purpose :
%   Generates plots for the first-order Sigma-Delta modulator.
%
% Author  : Aryan Lohiya
% =========================================================================
%% Validate Number of Samples to Plot

samplesToPlot = min(samplesToPlot, length(t));
%% Number of Samples to Display

samplesToPlot = 100;

%% Create Figure

figure( ...
    'Name','First-Order Sigma-Delta ADC', ...
    'Color','w', ...
    'Position',[100 100 1000 900]);

%% Analog Input

subplot(5,1,1)

plot( ...
    t(1:samplesToPlot), ...
    inputSignal(1:samplesToPlot), ...
    'LineWidth',1.5);

title('Analog Input Signal')

ylabel('Amplitude')

grid on

%% Difference Amplifier Output (Error)

subplot(5,1,2)

plot( ...
    t(1:samplesToPlot), ...
    errorHistory(1:samplesToPlot), ...
    'LineWidth',1.5);

title('Difference Amplifier Output')

ylabel('Error')

grid on

%% Integrator Output

subplot(5,1,3)

plot( ...
    t(1:samplesToPlot), ...
    integratorHistory(1:samplesToPlot), ...
    'LineWidth',1.5);

title('Integrator Output')

ylabel('Integrator')

grid on

%% Sigma-Delta Bitstream

subplot(5,1,4)

stairs( ...
    t(1:samplesToPlot), ...
    bitstream(1:samplesToPlot), ...
    'LineWidth',1.2);

ylim([-1.5 1.5])

title('1-bit Sigma-Delta Bitstream')

ylabel('Bit')

grid on

%% DAC Feedback

subplot(5,1,5)

stairs( ...
    t(1:samplesToPlot), ...
    feedbackHistory(1:samplesToPlot), ...
    'LineWidth',1.2);

ylim([-1.5 1.5])

title('DAC Feedback')

xlabel('Time (s)')

ylabel('Feedback')

grid on

end