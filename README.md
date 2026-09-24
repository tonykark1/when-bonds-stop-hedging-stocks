# When Bonds Stop Hedging Stocks

## A multi-horizon anatomy of stock–bond correlation regime changes

The interesting question is not whether dynamic stock–bond correlations can be estimated. It is **when the stock–bond hedge breaks, what changes first, and whether the answer depends on investment horizon**.

This repository turns an exploratory DCC-GARCH / wavelet study into a deliberately conservative research artifact. It separates discovery from confirmation, distinguishes contemporaneous explanation from prediction, and treats macro variables as variables that may **precede, accompany, or help explain** dependence transitions—not as identified causal drivers.

## Headline result

The strongest exploratory structure appears around the **D4 wavelet band (roughly 16–32 trading days)**. At that horizon, inflation/rate-pressure variables tend to line up with higher equity–Treasury correlation while risk-off/VIX variables tend to line up with lower correlation. But this is not a forecasting victory: broad multiple-testing correction removes the apparent significance of the exploratory screen, and a dedicated confirmatory D4 pass substantially weakens most individual-driver claims.

A secondary hedge-failure analysis sharpens the economic interpretation. Conditional on a negative equity shock, contemporaneous risk-off-dominant episodes usually retain the Treasury hedge, while rate-pressure-dominant episodes frequently produce same-direction stock/bond losses. Yet lagged-state walk-forward classifiers are near chance. In other words, **shock type helps describe the break when it occurs; the saved macro state does not reliably forecast it beforehand.**

The defensible conclusion is therefore:

> **Stock–bond diversification is horizon-dependent. The evidence is stronger for a changing dependence structure than for a stable predictive macro model.**

## What survives scrutiny

- The underlying daily mechanism panel spans **2020-01-03 to 2026-09-15**; the dedicated confirmatory D4 macro sample spans **2023-08-29 to 2026-09-15**.
- D4 is cleaner and more stable than the slower D5 band, whose larger raw relationships come with greater instability and slow-regime contamination risk.
- SPY–Treasury and Nasdaq–Treasury correlations dominate the D4 common dependence factor.
- The strongest exploratory D4 relationships are directionally consistent with two competing forces: inflation/rate pressure pushing stock–bond correlation upward and risk-off pressure pushing it downward.
- DCC versus ADCC comparisons do **not** provide strong evidence that an asymmetric correlation term materially improves fit for the four tested systems; AIC and BIC favor the simpler DCC specification. Re-estimation after GJR marginal models reaches the same conclusion.
- Haar robustness preserves the sign of the strongest relationships.
- Broad circular-shift/FDR inference does not validate the exploratory variable screen as a collection of discoveries.
- The confirmatory D4 models leave most macro coefficients statistically uncertain. Fed-curvature change is the closest thing to a surviving shock-side result, but even that is borderline after multiplicity correction and is not framed causally.
- The contemporaneous shock-balance split is large descriptively, but the lagged-state walk-forward hedge-failure models do not forecast reliably.
- All-variable ridge models reach roughly 18–20% in-sample explanatory R² at D4 but have **negative time-series cross-validated R²**, so the macro layer is explanatory/descriptive rather than a validated forecasting model.

## Research design

The frozen specification is documented in [`SPECIFICATION.md`](SPECIFICATION.md). The project uses Fisher-z transformed dynamic-correlation paths, LA(8)-style MODWT as the main decomposition, D1–D5 bands, Haar as a robustness transform, circular-shift inference, BH false-discovery-rate control, HAC inference, block uncertainty checks, and time-series cross-validation.

The analysis distinguishes four evidentiary layers:

1. **Exploration** — broad macro × target × horizon screening used to discover candidate structure.
2. **Confirmation** — a deliberately narrower D4 falsification pass on a pre-specified equity–Treasury target and small predictor set.
3. **Mechanism follow-up** — secondary post-screen evidence asking what distinguishes hedge failure conditional on an equity shock; explicitly not treated as pre-specified confirmation.
4. **Prediction** — evaluated separately with time-ordered validation; negative CV R² and near-chance walk-forward classification mean the current evidence does not support a forecasting claim.

## Repository map

- [`SPECIFICATION.md`](SPECIFICATION.md) — frozen estimand, variables, transforms, horizons, inference rules, dates, and claim discipline.
- [`research_note/RESEARCH_NOTE.md`](research_note/RESEARCH_NOTE.md) — publication-style research note.
- [`FIGURE_PLAN.md`](FIGURE_PLAN.md) — six static figures plus one animation, each tied to a research question.
- [`results/adcc_comparison.csv`](results/adcc_comparison.csv) — saved DCC versus ADCC model comparison.
- [`results/adcc_after_gjr.csv`](results/adcc_after_gjr.csv) — asymmetry robustness after GJR marginal models.
- [`results/confirmatory_d4.md`](results/confirmatory_d4.md) — confirmatory D4 results with uncertainty.
- [`results/mechanism_followup.md`](results/mechanism_followup.md) — conditional hedge-failure and walk-forward falsification evidence.
- [`results/exploratory_findings.md`](results/exploratory_findings.md) — archived exploratory findings, clearly labeled as such.

## What this repository does *not* claim

It does not claim that inflation, Fed expectations, VIX, or any other macro variable **causes** stock–bond correlation regimes. It does not claim a profitable trading strategy. It does not claim validated real-time prediction. Wavelet bands are scale-specific decompositions, not literal investor holding periods, and DCC paths are model-based latent dependence estimates rather than directly observed correlations.

## Status

**Research specification frozen for the release pass.** Existing saved results are being preserved rather than re-selected after seeing outcomes. Further work should be treated as a new version or explicit robustness extension, not silently folded into the frozen specification.
