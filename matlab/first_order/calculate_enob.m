%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project : Sigma-Delta ADC Modeling and RTL Implementation
%
% File    : calculate_enob.m
%
% Purpose :
% Calculates the Effective Number of Bits (ENOB)
% from the Signal-to-Noise Ratio (SNR).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function enob = calculate_enob(snr)

%% Calculate ENOB

enob = (snr - 1.76)/6.02;

%% Display Result

fprintf('ENOB             : %.2f bits\n', enob);

end