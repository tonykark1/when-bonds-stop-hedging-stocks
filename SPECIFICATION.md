# Frozen research specification — v1 release pass

This document freezes the interpretation of the **existing saved results**. It is not permission to re-select variables, horizons, filters, or inferential procedures after inspecting outcomes. Any later change must be versioned as a robustness extension or a new specification.

## 1. Research question

**When does the stock–bond hedge break, what changes first, and does the answer depend on investment horizon?**

The primary object is the time-varying dependence between equity and Treasury returns. The macro layer asks whether selected state variables and shocks **precede, accompany, or help explain** changes in that dependence. Causal language is prohibited absent a separate identification design.

## 2. Dependence targets

Saved exploratory targets:

- SPY–IEF dynamic conditional correlation
- QQQ–IEF dynamic conditional correlation
- GLD–IEF dynamic conditional correlation
- EURUSD / rate-differential dynamic conditional correlation

The confirmatory target is narrower: the common SPY–IEF / QQQ–IEF Fisher-z DCC component at D4.

## 3. Correlation model

Primary dependence model: DCC(1,1) estimated on standardized univariate volatility-model residuals. Saved DCC-versus-ADCC robustness results use Student-t dependence likelihoods and compare DCC against an asymmetric DCC extension with asymmetry parameter `g`.

The saved model-comparison sample sizes are 1,683 observations for SP500–Treasuries, Nasdaq–Treasuries and Gold–Treasuries, and 1,457 for EURUSD–rate-differential.

**Interpretation rule:** ADCC is retained as a robustness check, not promoted to the primary model unless it materially improves fit and changes the substantive correlation path. In the saved comparison, ADCC is not preferred by AIC/BIC for any of the four systems.

## 4. Correlation transformation

Dynamic correlations are Fisher transformed before wavelet analysis:

`z_t = atanh(rho_t)`

This reduces the boundedness problem of raw correlations and makes additive scale decomposition more defensible. Results should still be interpreted as transformations of a model-estimated latent dependence path.

## 5. Wavelet specification

Primary transform: **LA(8)-style MODWT**.

Primary saved bands:

| Band | Approximate scale |
|---|---:|
| D1 | 2–4 daily observations |
| D2 | 4–8 |
| D3 | 8–16 |
| D4 | 16–32 |
| D5 | 32–64 |

Haar is the saved robustness transform for the strongest relationships. D4 is not re-selected in the confirmatory pass: it is carried forward from the exploratory stage as the pre-specified medium-frequency target.

**Interpretation rule:** these are wavelet scales, not literal investor holding periods.

## 6. Boundary effects

MODWT coefficients near the beginning and end of the sample are filter-contaminated. Release figures and inferential tables must either:

1. remove the scale-specific boundary-affected coefficients using the effective filter width; or
2. visibly flag the boundary region and exclude it from formal inference.

No headline finding may depend solely on edge coefficients. Phase/sign stability checks are treated as additional protection against alignment sensitivity, not as a substitute for explicit boundary handling.

## 7. Macro predictor families

The exploratory screen contains 26 daily state variables and 24 shock/update/market variables. Important saved candidates include:

- inflation compensation / expectations: T5YIE, T10YIE, T5YIFR and related repricing measures;
- Fed expectation-curve level, slope, curvature and uncertainty measures at multiple horizons;
- VIX level/change;
- growth/labor variables including payroll and claims measures;
- oil/commodity variables;
- contemporaneous market returns where used as mechanical/endogenous controls.

Monthly Cleveland inflation-curve/risk-premia series are kept separate because only about 40 overlapping monthly DCC observations are available. NY Fed survey releases are not used for wavelet inference because the saved analysis judged them too sparse/irregular.

## 8. Exploratory inference

The broad macro × target × scale screen is explicitly **exploratory**.

Saved procedures:

- naive pairwise correlation statistics for screening only;
- circular-shift permutation inference for selected strongest time-series relationships;
- Benjamini–Hochberg false-discovery-rate control across the broad screen;
- HAC inference for grouped/joint regressions;
- Haar sign robustness for strongest relationships.

A small naive p-value is never sufficient for a release claim. The broad shift/FDR result is part of the result, not an inconvenience to hide.

## 9. Confirmatory D4 pass

Target: common SPY–IEF / QQQ–IEF Fisher-z DCC component at D4 (≈16–32 trading days).

Saved grouped state factors:

- Fed state
- inflation state
- risk/commodity state
- growth/labor state

Saved grouped shock factors:

- Fed shock
- inflation shock
- risk/commodity shock
- growth/labor update

Saved direct state variables:

- T5YIFR
- FedLevel_180
- FedCurvature_90_180_365
- VIXCLS
- DCOILBRENTEU

Saved direct shock variables:

- Inflation5y5y_bp
- FedRepricing
- FedCurvatureChange_bp
- VIXChange
- OilReturn_pct

Inference combines HAC p-values, BH q-values, block uncertainty intervals and sign-stability checks. The confirmatory pass is a falsification layer: failure to reproduce the exploratory strength must be reported prominently.

## 10. Prediction versus explanation

Contemporaneous regressions describe conditional association. They do **not** establish forecasting ability.

Prediction requires time-ordered validation in which predictors are available before the target realization and all transformations/standardization are fit without future leakage. The saved all-variable ridge exercise has approximately 18–20% in-sample D4 explanatory R² but negative time-series CV R² (about -0.093 for states and -0.034 for shocks).

Therefore v1 makes **no validated prediction claim**.

## 11. Causal-language rule

Allowed language:

- precedes
- accompanies
- is associated with
- helps explain
- is consistent with
- lines up with

Disallowed without a separate causal design:

- causes
- drives
- produces
- leads to (when meant causally)

Contemporaneous return relationships are treated as potentially endogenous/mechanical.

## 12. Sample-period provenance gate

The saved result artifacts recover model sample sizes but **do not contain the exact start/end dates of the daily estimation sample**. Those dates must be recovered from the original aligned input/DCC-path artifact before a formal release is tagged.

This is intentionally left as an explicit provenance gap rather than guessed from observation counts. No one should infer calendar dates from `n` alone.

## 13. Release claim hierarchy

**Tier A — supported:** dependence varies through time and across scales; D4 contains the cleanest saved medium-frequency equity–Treasury structure; ADCC does not materially dominate DCC in the saved comparison.

**Tier B — suggestive:** inflation/rate pressure and risk-off pressure appear to line up with the D4 equity–Treasury dependence component in opposite directions.

**Tier C — unsupported in v1:** stable macro forecasting of future stock–bond correlation; causal attribution of correlation-regime changes; a profitable trading rule.

## 14. Change control

After this specification is committed, changes to targets, bands, filters, predictor families, multiplicity families, lags, or model-selection rules must be documented in a new version. Negative and null results remain in the repository.
