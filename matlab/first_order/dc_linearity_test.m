clear;
clc;
close all;

%% Number of Samples

N = 1000;

%% Test Input Values

dcInputs = -0.95:0.007:0.95;

%% Store Results

averageBitstream = zeros(size(dcInputs));

%% Run Test

for i = 1:length(dcInputs)

    inputSignal = dcInputs(i) * ones(1,N);

    [bitstream,~,~,~] = first_order_modulator(inputSignal);

    averageBitstream(i) = mean(bitstream);

end

%% Calculate Error

error = averageBitstream - dcInputs;

maxError = max(abs(error));

fprintf('Maximum Error = %.6f\n', maxError);

%% Plot

figure

plot(dcInputs,averageBitstream,'o-','LineWidth',2)

hold on

plot(dcInputs,dcInputs,'r--','LineWidth',2)

grid on

xlabel('Analog Input')

ylabel('Average Bitstream')

title('DC Linearity Test')

legend('Measured','Ideal')