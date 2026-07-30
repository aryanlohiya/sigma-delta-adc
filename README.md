# Sigma-Delta ADC Modeling and RTL Implementation

A complete behavioral implementation of a Sigma-Delta Analog-to-Digital Converter (ADC) covering MATLAB modeling, digital signal processing, and Verilog RTL design.

---

# Features

- MATLAB behavioral modeling
- First-order Sigma-Delta Modulator
- Second-order Sigma-Delta Modulator
- FFT Spectrum Analysis
- Signal-to-Noise Ratio (SNR) Estimation
- Effective Number of Bits (ENOB) Calculation
- DC Linearity Testing
- CIC Decimation Filter
- FIR Low-Pass Filter
- Complete Digital Decimation Chain
- Behavioral Verilog RTL Implementation
- RTL Testbench Verification

---

# Project Overview

Sigma-Delta ADCs achieve high-resolution analog-to-digital conversion using oversampling, noise shaping, and digital filtering.

This project demonstrates the complete design flow of a Sigma-Delta ADC:

- Behavioral modeling in MATLAB
- Performance analysis using FFT, SNR, and ENOB
- Digital filtering using CIC and FIR filters
- Behavioral RTL implementation of the digital processing chain in Verilog
- Verification using simulation waveforms

---

# Project Architecture

```text
                 Analog Input
                      │
                      ▼
        Sigma-Delta Modulator
                      │
                1-bit Bitstream
                      │
                      ▼
              CIC Decimation Filter
                      │
                      ▼
             FIR Low-Pass Filter
                      │
                      ▼
          Decimated Digital Output
```

---

# MATLAB Implementation

The MATLAB portion of the project includes:

## First-Order Sigma-Delta Modulator

- Behavioral implementation
- Integrator
- Quantizer
- 1-bit DAC feedback
- Time-domain visualization

  #### Full Behavioral Simulation

![First Order Full](images/First_order_full.png)

The figure above shows:
- Analog input signal
- Difference amplifier output
- Integrator output
- 1-bit Sigma-Delta bitstream
- DAC feedback

#### Zoomed View

![First Order Zoom](images/First_order_zoom.png)

The zoomed waveform highlights the modulation process and demonstrates how the bitstream density changes with the input signal.

---

---

## Second-Order Sigma-Delta Modulator

- Two-stage integrator architecture
- Improved noise shaping
- Time-domain analysis

---

## FFT Analysis

- Frequency spectrum calculation
- Identification of signal frequency
- Observation of quantization noise shaping

---

## Performance Evaluation

### Signal-to-Noise Ratio (SNR)

- FFT-based signal power estimation
- Noise power calculation
- SNR computation in dB

### Effective Number of Bits (ENOB)

Calculated using

```
ENOB = (SNR - 1.76) / 6.02
```

---

## DC Linearity Test

- Input sweep
- Average bitstream calculation
- Linearity verification

---

## Digital Filters

### CIC Filter

Implemented:

- Integrator
- Decimation
- Comb stage

---

### FIR Filter

Implemented:

- Moving-average FIR filter
- Low-pass smoothing
- Output reconstruction

---

### Complete Decimation Chain

The digital processing chain combines:

```
Bitstream
    │
    ▼
CIC Filter
    │
    ▼
FIR Filter
    │
    ▼
Final Output
```

---

# Verilog RTL Implementation

Behavioral RTL was developed for the complete digital processing chain.

## First-Order RTL

- First-order Sigma-Delta Modulator
- Testbench
- Waveform verification

---

## Second-Order RTL

- Second-order Sigma-Delta Modulator
- Testbench
- Waveform verification

---

## Digital Filters

### CIC Filter

- Integrator
- Decimator
- Comb stage
- Testbench

---

### FIR Filter

- 4-tap moving-average FIR filter
- Testbench

---

## Top-Level Decimation Chain

- CIC Filter instantiation
- FIR Filter instantiation
- Complete signal flow verification

---

# Repository Structure

```
sigma-delta-adc/

├── matlab/
│
│   ├── first_order/
│   ├── second_order/
│   └── filters/
│
├── verilog/
│
│   ├── first_order/
│   ├── second_order/
│   └── filters/
│
└── README.md
```

---

# Simulation Results

Behavioral verification was performed for:

- First-order Sigma-Delta Modulator
- Second-order Sigma-Delta Modulator
- CIC Filter
- FIR Filter
- Complete Decimation Chain

Waveform simulations were carried out using EDA Playground.

---

# Tools Used

- MATLAB Online
- Verilog HDL
- EDA Playground
- GitHub

---

# Concepts Covered

- Oversampling
- Noise Shaping
- Quantization
- FFT
- SNR
- ENOB
- CIC Filtering
- FIR Filtering
- Decimation
- Digital Signal Processing
- Verilog RTL Design
- Digital System Verification

---

# Future Improvements

Possible extensions include:

- Fixed-point arithmetic optimization
- Higher-order Sigma-Delta modulators
- Parameterizable filter architecture
- FPGA synthesis and hardware validation
- Power and area optimization

---

# Author

**Aryan Lohiya**

B.Tech – Integrated Circuit Design and Technology (ICDT)

Indian Institute of Technology Gandhinagar

---

# License

This project is intended for educational and learning purposes.
