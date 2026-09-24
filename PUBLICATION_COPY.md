# Public-facing copy

## LinkedIn draft

**When do bonds stop hedging stocks?**

I started this as a DCC-GARCH exercise, but “I estimated dynamic correlations” is not much of a research question.

The more interesting question became:

> **When does the stock–bond hedge break, what changes around the transition, and does the answer depend on horizon?**

The strongest exploratory structure appears around a **16–32 trading-day wavelet scale**. At that horizon, inflation/rate-pressure measures tend to line up with *higher* stock–Treasury correlation, while risk-off/VIX pressure tends to line up with *lower* correlation.

There is also a striking descriptive split conditional on an equity shock: risk-off-dominant episodes usually preserve the Treasury hedge, while rate-pressure-dominant episodes are much more likely to produce same-direction stock/bond losses.

But the credibility checks matter more than the pretty heatmap:

- broad multiple-testing/FDR correction does not validate the exploratory variable screen;
- a narrower confirmatory D4 pass weakens most individual macro-driver claims;
- ADCC does not materially improve on DCC, including after GJR marginal models;
- in-sample macro fit does not survive time-series cross-validation;
- lagged-state walk-forward models are near chance at predicting whether the Treasury hedge will fail during an equity shock.

So my conclusion is deliberately narrower:

**Stock–bond diversification is horizon-dependent, and the type of shock helps describe hedge failure when it occurs. I do not yet have evidence that the macro state reliably predicts the break beforehand, much less that one variable causes it.**

That negative result is part of the research, not something to hide.

Repository: *When Bonds Stop Hedging Stocks: A Multi-Horizon Anatomy of Correlation Regime Changes*

## One-sentence version

Stock–bond hedge failure appears horizon-specific and strongly related to the contemporaneous balance between rate-pressure and risk-off shocks, but the relationship weakens under confirmatory testing and does not yet translate into reliable out-of-sample prediction.

## Short chart-carousel captions

**1 — The hedge is not constant.** Dynamic equity–Treasury dependence moves materially through time; positive/high correlation is where diversification weakens.

**2 — Horizon matters.** The cleanest saved macro structure is around D4, roughly 16–32 trading days; slower D5 effects are larger but less stable.

**3 — Two forces, not one “stress” factor.** Inflation/rate pressure lines up with higher stock–bond correlation; risk-off pressure lines up with lower correlation.

**4 — Exploration is not confirmation.** Many attractive exploratory coefficients shrink or become uncertain in the dedicated D4 falsification pass.

**5 — Asymmetry does not rescue the story.** ADCC adds little relative to DCC in the saved comparisons, including after GJR marginals.

**6 — Explanation is not prediction.** Moderate in-sample fit becomes negative CV R²; lagged-state hedge-failure classifiers are near chance.

**Animation — The dependence system moves across both time and scale.** Keep fixed color limits and ordering so the animation shows actual migration rather than autoscaling artifacts.
