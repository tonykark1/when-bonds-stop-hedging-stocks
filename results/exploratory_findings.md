# Exploratory wavelet-DCC findings

> **Status: exploratory.** These results were generated from a broad variable × target × scale screen. They are retained for transparency and hypothesis generation. They are not promoted to confirmatory discoveries.

## Saved method

- Targets: Fisher-z DCC paths for SPY–IEF, QQQ–IEF, GLD–IEF and EURUSD/rate-differential.
- Main transform: LA(8)-style MODWT.
- Bands: D1–D5 ≈ 2–4, 4–8, 8–16, 16–32 and 32–64 daily observations.
- Robustness: Haar on strongest relationships; circular-shift permutation; global BH FDR; HAC grouped-factor regressions; all-variable ridge with time-series CV.
- Predictor screen: 26 daily state variables and 24 shock/update/market variables.
- Cleveland monthly inflation-curve results were tested separately because only ~40 overlapping monthly DCC observations were available.

## Main exploratory findings

1. **D4 is the cleanest medium-frequency band.** D5 often has larger raw relationships but substantially poorer time-series stability and greater slow-regime contamination risk.

2. **The D4 common factor is mainly an equity–bond factor.** Approximate loadings: SPY–IEF 0.690, QQQ–IEF 0.695, GLD–IEF -0.071, EURUSD/rates 0.187.

3. **D4 state screen:** T10YIE ≈ +0.280; T5YIFR +0.266; Fed level/FedLevel180 +0.249; VIX -0.237; Fed curvature -0.232. Selected circular-shift p-values were approximately 0.014, 0.016, 0.026, 0.042 and 0.054. **Strict shift-permutation FDR across the broad screen does not preserve significance.**

4. **D4 shock screen:** Fed-curvature change ≈ -0.254; Fed-level change +0.229; Fed repricing +0.228; 10Y inflation repricing +0.220; 5y5y repricing +0.210; VIX change -0.194. These likewise do not survive broad shift-FDR.

5. **SPY–IEF pair-specific links are stronger than the combined factor.** State examples: T10YIE +0.305, T5YIFR +0.278, Fed level +0.262, VIX -0.227. Shock examples: Inflation10Y +0.262, Fed-curvature change -0.251, Inflation5y5y +0.240, Fed repricing +0.231. The strongest signs are retained under Haar.

6. **Gold–Treasury dependence looks different.** D4 Fed uncertainty at 90d ≈ -0.289 and Fed-uncertainty curvature +0.243; the contemporaneous gold-return component is negatively associated with the correlation-change component (≈ -0.259). Inflation is not the dominant saved gold–bond relationship.

7. **EURUSD/rate-differential also differs.** D4 oil-price state ≈ +0.234 and payroll state ≈ -0.213; shock-side EURUSD return ≈ -0.296 and absolute Fed repricing ≈ -0.271. Contemporaneous return relationships are potentially endogenous/mechanical and receive no causal interpretation.

8. **Prediction fails the saved validation test.** All-variable ridge explains roughly 18–20% of the D4 equity–bond factor in sample, but time-series CV R² is negative: about -0.093 for state predictors and -0.034 for shock predictors. D5 fits more strongly in sample and deteriorates further out of sample.

9. **Cleveland monthly evidence is descriptive only.** At a 4–8 month Haar band, 1Y expected inflation correlates around +0.45 with SPY/QQQ DCC and the 30Y–1Y expected-inflation slope around -0.465, but with only ~40 observations and all-tenor multiplicity the q-values are about 0.24 or worse.

## Hypothesis carried into confirmation

The exploratory pattern is not “all stress raises correlation.” At approximately the D4 scale, two forces appear to compete:

- inflation/rate pressure tends to line up with **higher** equity–Treasury correlation;
- risk-off/VIX pressure tends to line up with **lower** equity–Treasury correlation.

The broad multiplicity correction prevents treating this as final discovery. It is a hypothesis that must survive the dedicated confirmatory specification.
