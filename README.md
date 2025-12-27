# Implementation-of-Monte-Carlo-Simulation
This project implements a Monte Carlo simulation to evaluate the statistical properties—bias, variance, and mean squared error (MSE)—of the maximum estimator of the parameter 𝜃, for samples drawn from a uniform distribution 𝑈(0,𝜃). Monte Carlo estimates are compared with exact theoretical values, providing insight into estimator performance across different sample sizes and demonstrating the effectiveness of simulation-based inference.

# Monte Carlo Simulation of Maximum Estimator from Uniform Distribution

**Author:** Paolo Pio Vitiello  
**Date:** December 2025

## Overview

This project implements a Monte Carlo simulation to evaluate the bias, variance, and mean squared error (MSE) of the maximum estimator from a uniform distribution \(U(0, \theta)\). The simulation compares Monte Carlo estimates with exact theoretical quantities across multiple sample sizes.

## Features

- Simulates 10,000 replicates for each sample size.
- Computes bias, variance, and MSE of the maximum estimator.
- Visualizes the bias distribution via boxplots.
- Plots differences between Monte Carlo and exact values with error bars.
- Fully reproducible with **R Markdown**.

## Requirements

- R (>= 4.2)
- R packages: `knitr`, `ggplot2` (optional for enhanced plotting)
- Basic familiarity with R and R Markdown

## Usage

1. Clone this repository.
2. Open `monte_carlo_max_uniform.Rmd` in RStudio.
3. Knit to HTML or PDF to generate results and plots.
4. Modify `theta`, `n_grid`, or `M` to explore different parameter configurations.

```{r}
# Example
theta <- 1
n_grid <- c(5, 10, 20, 50, 100)
M <- 10000
```
