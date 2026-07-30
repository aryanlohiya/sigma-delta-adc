%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot Results for Second-Order Sigma-Delta ADC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function plot_results_second_order( ...
    t,...
    inputSignal,...
    int1History,...
    int2History,...
    bitstream,...
    feedbackHistory)

figure

subplot(5,1,1)

plot(t,inputSignal,'LineWidth',1.5)

title('Analog Input Signal')

ylabel('Amplitude')

grid on

subplot(5,1,2)

plot(t,int1History,'LineWidth',1.5)

title('First Integrator Output')

ylabel('Integrator 1')

grid on

subplot(5,1,3)

plot(t,int2History,'LineWidth',1.5)

title('Second Integrator Output')

ylabel('Integrator 2')

grid on

subplot(5,1,4)

stairs(t,bitstream,'LineWidth',1.5)

title('1-bit Sigma-Delta Bitstream')

ylabel('Bit')

ylim([-1.5 1.5])

grid on

subplot(5,1,5)

stairs(t,feedbackHistory,'LineWidth',1.5)

title('DAC Feedback')

xlabel('Time (s)')

ylabel('Feedback')

ylim([-1.5 1.5])

grid on

end