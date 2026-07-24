# First-Order Sigma-Delta ADC

## Overview

This folder contains a MATLAB behavioral model of a first-order Sigma-Delta Analog-to-Digital Converter (ADC).

The objective is to understand the operation of a Sigma-Delta modulator before extending the design to second-order architectures, digital decimation filters, and Verilog RTL implementation.

---

## Files

| File | Description |
|------|-------------|
| run_first_order.m | Main simulation script |
| first_order_modulator.m | Implements the first-order Sigma-Delta feedback loop |
| plot_results.m | Generates simulation plots |

---

## Simulation Flow

Analog Input

↓

Difference Amplifier

↓

Integrator

↓

1-bit Quantizer

↓

DAC Feedback

↓

Back to Difference Amplifier

---

## Generated Plots

The simulation currently generates:

1. Analog Input Signal
2. Difference Amplifier Output (Error)
3. Integrator Output
4. 1-bit Sigma-Delta Bitstream
5. DAC Feedback

---

## Future Work

- Oversampling Ratio (OSR) analysis
- FFT spectrum
- Quantization noise analysis
- SNR and ENOB calculation
- Second-order Sigma-Delta modulator
- CIC Decimation Filter
- FIR Compensation Filter
- Synthesizable Verilog RTL
