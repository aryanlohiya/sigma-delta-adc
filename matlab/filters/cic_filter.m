%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project : Sigma-Delta ADC Modeling and RTL Implementation
%
% File    : cic_filter.m
%
% Purpose :
% First-order CIC (SINC) Decimation Filter
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function output = cic_filter(bitstream,R)

%% Integrator

integrator = cumsum(bitstream);

%% Downsample

downsampled = integrator(1:R:end);

%% Comb

output = zeros(size(downsampled));

output(1) = downsampled(1);

for k = 2:length(downsampled)

    output(k) = downsampled(k) - downsampled(k-1);

end

end