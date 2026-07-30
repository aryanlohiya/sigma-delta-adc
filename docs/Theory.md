# Sigma-Delta ADC Theory

## Introduction

A Sigma-Delta Analog-to-Digital Converter (ADC) is a high-resolution data converter that achieves excellent accuracy by combining oversampling, noise shaping, and digital filtering. Unlike conventional Nyquist-rate ADCs, Sigma-Delta converters shift quantization noise to higher frequencies, allowing it to be removed by digital filters.

---

## Working Principle

A Sigma-Delta ADC consists of two major sections:

- Analog Modulator
- Digital Decimation Filter

The analog modulator converts the input signal into a high-frequency 1-bit bitstream. The digital filter reconstructs the signal at a lower sampling rate while suppressing out-of-band quantization noise.

---

## Oversampling

Oversampling samples the input at a frequency much higher than the Nyquist rate.

Advantages include:

- Reduced quantization noise within the signal band
- Improved SNR
- Easier analog anti-alias filtering

---

## Noise Shaping

Noise shaping is the defining feature of Sigma-Delta ADCs.

The feedback loop pushes most of the quantization noise toward high frequencies, leaving the signal band relatively noise-free.

---

## First-Order Sigma-Delta Modulator

Components:

- Difference amplifier
- Integrator
- 1-bit quantizer
- DAC feedback

The first-order modulator provides first-order noise shaping with a simple architecture.

---

## Second-Order Sigma-Delta Modulator

A second integrator is added to improve noise shaping.

Advantages:

- Better SNR
- Lower in-band quantization noise
- Higher achievable resolution

---

## CIC Filter

The Cascaded Integrator-Comb (CIC) filter performs:

- Decimation
- Low-pass filtering

without requiring multipliers.

---

## FIR Filter

The FIR filter removes remaining high-frequency components after the CIC filter and smooths the reconstructed signal.

---

## Signal-to-Noise Ratio (SNR)

The Signal-to-Noise Ratio is defined as

SNR = 10 log10 (Signal Power / Noise Power)

Higher SNR indicates better converter performance.

---

## Effective Number of Bits (ENOB)

ENOB measures the effective resolution of the ADC.

ENOB = (SNR − 1.76) / 6.02

---

## Complete Signal Flow

Analog Input

↓

Sigma-Delta Modulator

↓

1-bit Bitstream

↓

CIC Filter

↓

FIR Filter

↓

Digital Output
