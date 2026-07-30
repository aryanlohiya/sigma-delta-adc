%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FIR Low-Pass Filter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function output = fir_filter(inputSignal)

%% FIR Coefficients

coeff = ones(1,8)/8;

%% Filtering

output = filter(coeff,1,inputSignal);

end