# When Bonds Stop Hedging Stocks
## A Multi-Horizon Anatomy of Correlation Regime Changes

### Abstract

Stock–bond diversification is usually discussed as if correlation were one number. This note asks a different question: **when does the stock–bond hedge weaken, what changes around the transition, and does the answer depend on horizon?** Dynamic conditional correlations are decomposed across wavelet scales and related to monetary-policy expectations, inflation compensation, market stress, growth/labor information and commodity variables. The strongest exploratory structure appears around a 16–32 trading-day wavelet scale. Inflation/rate-pressure measures tend to line up with higher equity–Treasury correlation while risk-off/VIX measures tend to line up with lower correlation. However, broad circular-shift/FDR inference removes the apparent significance of the exploratory screen, and a narrower confirmatory D4 pass weakens most individual macro-driver claims. DCC-versus-ADCC comparisons also provide little evidence that an asymmetric correlation term materially improves the saved models. Finally, time-series cross-validation is negative despite moderate in-sample explanatory fit. The result is therefore an anatomy of horizon-dependent dependence—not a causal model or a validated forecasting strategy.

## 1. Why this question matters

The portfolio question is not whether stocks and bonds are correlated on average. A hedge matters precisely when the dependence structure changes. A single full-sample or rolling correlation can blur together fast market stress, medium-frequency repricing and slower macro regimes.

The empirical question is therefore decomposed into three parts:

1. **When does the hedge weaken?** Identify changes in dynamic equity–Treasury dependence.
2. **At what scale?** Ask whether the structure is concentrated at short, medium or slower wavelet bands.
3. **What changes around it?** Test whether monetary-policy expectations, inflation compensation, risk-off variables and other macro information precede or accompany the dependence transition.

The third question is intentionally not phrased causally.

## 2. Empirical design

The saved exploratory system contains Fisher-z transformed DCC paths for SPY–IEF, QQQ–IEF, GLD–IEF and EURUSD/rate-differential. The main transform is LA(8)-style MODWT, with D1–D5 bands corresponding approximately to 2–4, 4–8, 8–16, 16–32 and 32–64 daily observations. Haar is used as a robustness transform for the strongest relationships.

The broad screen contains 26 state variables and 24 shock/update/market variables. Inference is deliberately stricter than ordinary heatmap inspection: selected relationships receive circular-shift permutation checks; the broad screen is subjected to Benjamini–Hochberg false-discovery-rate control; joint regressions use HAC inference; and the confirmatory pass adds block uncertainty and sign-stability checks.

A separate DCC-versus-ADCC comparison tests whether asymmetric correlation dynamics are necessary. The saved comparison contains 1,683 observations for the three equity/gold–Treasury systems and 1,457 for EURUSD/rate-differential.

The exact daily calendar start/end dates must still be recovered from the original aligned input artifact before formal release tagging. They are not reconstructed from observation counts.

## 3. Result 1 — the dependence structure is horizon-specific

The clearest exploratory equity–Treasury structure appears at **D4, approximately 16–32 trading days**. D5 often produces larger raw correlations with macro variables, but it is materially less stable through time and more exposed to slow-regime contamination.

The D4 common dependence factor is overwhelmingly an equity–bond object: the saved loadings are approximately 0.690 for SPY–IEF and 0.695 for QQQ–IEF, compared with -0.071 for GLD–IEF and 0.187 for EURUSD/rates.

This is the first substantive result: the apparent macro structure is not uniform across scales, and the most interpretable medium-frequency signal is concentrated in the stock–bond relationship.

## 4. Result 2 — two forces appear to compete

In the exploratory D4 state screen, inflation/rate variables have positive relationships with the equity–bond dependence factor: T10YIE is around +0.280, T5YIFR +0.266 and Fed-level measures around +0.249. VIX is around -0.237 and Fed curvature around -0.232.

The shock-side screen has the same broad shape. Fed-curvature change is around -0.254, while Fed-level change, Fed repricing and inflation repricing are positive. VIX change is negative.

A useful economic description is therefore **not** “stress makes correlations rise.” Instead, the saved data are consistent with two competing channels at roughly the D4 scale:

- an **inflation/rate-pressure** channel associated with stocks and Treasuries moving more similarly;
- a **risk-off** channel associated with Treasuries retaining more of their hedge behavior against equities.

This description is a hypothesis about dependence structure. It is not evidence that these variables cause the regime.

## 5. Result 3 — the broad screen does not survive the credibility layer

Several exploratory circular-shift p-values are small, and naive heatmaps look visually persuasive. That is exactly where the research design needs to become stricter.

Once the broad search is treated as a multiple-testing problem, strict shift-permutation/FDR correction does not preserve the apparent discoveries. The correct interpretation is not to discard the pattern, but to downgrade it from “finding” to “candidate mechanism.”

The dedicated D4 confirmatory pass does the same thing more directly. Grouped Fed and inflation state factors are weak. The risk/commodity state factor is stronger (beta -0.216, HAC p 0.0205), but BH q is 0.0819 and its block interval crosses zero. None of the grouped shock factors is strongly confirmed.

Among the direct shock variables, Fed-curvature change is the closest result to surviving: beta -0.183, HAC p 0.0119 and BH q 0.0593. Its 32-observation block interval barely excludes zero, while its 64-observation interval crosses zero. That is **borderline evidence**, not a clean discovery.

The confirmatory weakening is itself informative. It says the medium-frequency structure looks more robust than any single macro explanation for it.

## 6. Result 4 — DCC is sufficient for the saved release

ADCC allows negative shocks to affect correlation dynamics differently. If asymmetry were central to the story, the extra term should materially improve the dependence model.

That does not happen in the saved comparison. The estimated ADCC asymmetry parameter is about 0.013 for SP500–Treasuries, 0.018 for Nasdaq–Treasuries, effectively zero for Gold–Treasuries and 0.017 for EURUSD/rate-differential. The saved likelihood-ratio evidence is weak, and both AIC and BIC differences are positive for ADCC relative to DCC across all four systems.

The simpler DCC specification is therefore the cleaner primary model for this release, with ADCC retained as a robustness check rather than a source of a new story.

## 7. Result 5 — explanation is not prediction

The all-variable ridge models make the distinction unusually clear. At D4, they explain roughly 18–20% of the equity–bond dependence factor **in sample**. But time-series cross-validated R² is approximately -0.093 for state variables and -0.034 for shocks.

A model that organizes the historical dependence structure can still fail to forecast it. The release therefore makes no claim that the macro variables can predict future stock–bond correlation in real time.

Any later predictive extension must lag information according to actual publication availability, prevent transformation/standardization leakage, use rolling or expanding estimation, and beat a simple persistence/no-change benchmark out of sample.

## 8. Other assets do not share the same anatomy

Gold–Treasury dependence has a different saved structure. Fed uncertainty and uncertainty curvature are more prominent, while inflation is not the dominant relationship. EURUSD/rate-differential dependence also differs, with oil, payroll information, FX returns and Fed repricing appearing in the exploratory D4 screen.

This cross-asset heterogeneity is useful because it argues against interpreting the equity–bond result as a generic artifact in which every macro stress variable simply correlates with every DCC series.

## 9. What can be said, and what cannot

The strongest defensible statement is:

> **Stock–bond diversification is horizon-dependent. A medium-frequency dependence component around 16–32 trading days contains the cleanest saved macro structure, but individual macro explanations are substantially less robust than the dependence pattern itself.**

The current evidence does **not** establish that inflation expectations, Fed repricing, VIX or Fed-curve curvature cause correlation-regime changes. It also does not establish a profitable allocation strategy or validated forecast.

## 10. Limitations

First, DCC is a model-estimated latent dependence process. Wavelet analysis is therefore being applied to an estimated object, and uncertainty from the first-stage DCC estimation should ideally propagate into the second stage.

Second, MODWT creates scale-specific boundary contamination. Formal release figures must remove or visibly flag scale-specific edge coefficients and keep them out of inference.

Third, macro variables arrive at different publication times. Contemporaneous alignment is useful for explanation but is insufficient for a genuine forecasting test.

Fourth, the exploratory search is large. The FDR failure is correctly reported, but a future clean replication should pre-register a smaller variable family before observing the new sample.

Fifth, the exact start/end dates of the saved daily estimation sample are not present in the surviving summary artifacts and must be recovered before a release is tagged.

## 11. Next falsification tests

The next version should be harder to pass, not broader. The highest-value tests are: propagate DCC parameter uncertainty into wavelet statistics; compare the D4 result against rolling/EWMA dependence targets; rerun the frozen D4 specification on a genuinely held-out later sample; impose publication-time lags on macro predictors; and test whether any predictive improvement survives a simple persistence benchmark and transaction-aware portfolio evaluation.

## Conclusion

The research started with a familiar tool—DCC-GARCH—but the useful result is not another dynamic-correlation chart. The interesting object is the **breakdown of diversification across horizons**. The saved evidence points to a medium-frequency stock–bond dependence component and a plausible tension between inflation/rate pressure and risk-off pressure. The same evidence also rejects the temptation to oversell the result: multiple-testing correction weakens the broad screen, confirmation weakens most individual drivers, and out-of-sample prediction fails.

That combination is the story. The hedge changes by horizon; the dependence transition is real enough to study; the macro explanation is suggestive; and the forecasting claim has not yet earned its place.
