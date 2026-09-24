# Mechanism follow-up: hedge failure conditional on an equity shock

> **Status: secondary exploratory / falsification evidence.** This analysis was run after the main DCC/wavelet screen and must not be presented as a pre-registered confirmation.

## Question

When equities receive a negative standardized innovation, what determines whether Treasuries also receive a negative innovation (**hedge failure**) versus a positive innovation (**flight to quality**)?

The underlying daily mechanism panel spans **2020-01-03 to 2026-09-15**. The macro-conditioned portion is shorter because the relevant expectation variables begin later.

## Conditional hedge-failure rates

For SPY negative innovations (`z < 0`), the saved sample contains 799 events and a 53.6% bond-failure rate. For severe SPY shocks (`z < -1`), there are 229 events and a 51.5% failure rate.

For QQQ negative innovations, the saved sample contains 788 events and a 52.5% bond-failure rate. For severe QQQ shocks (`z < -1`), there are 243 events and a 51.9% failure rate.

## Contemporaneous shock-balance split

A same-day shock-balance score produces a large descriptive separation:

| Equity | Regime | n | Treasury hedge-failure rate | Mean DCC news |
|---|---|---:|---:|---:|
| SPY | risk-off dominant | 71 | 26.8% | -0.0531 |
| SPY | middle | 210 | 56.2% | 0.0093 |
| SPY | rate-pressure dominant | 71 | 94.4% | 0.0220 |
| QQQ | risk-off dominant | 71 | 25.4% | -0.0447 |
| QQQ | middle | 210 | 50.0% | 0.0047 |
| QQQ | rate-pressure dominant | 71 | 88.7% | 0.0210 |

Alternative balance constructions preserve the qualitative separation. For example, SPY risk-off versus rate-pressure failure rates remain roughly 24–36% versus 86–92% across saved variants; QQQ remains roughly 23–35% versus 80–89%.

This is consistent with the two-force interpretation: risk-off shocks are more likely to preserve the Treasury hedge, while rate-pressure shocks are more likely to make stocks and Treasuries move down together.

## But the lagged state does not forecast the split well

The stronger credibility result is the failure of the lagged-state classifier.

| Equity | Equity-shock threshold | OOS n | walk-forward AUC | log loss | base log loss |
|---|---:|---:|---:|---:|---:|
| SPY | z < 0 | 280 | 0.474 | 0.784 | 0.677 |
| SPY | z < -0.5 | 150 | 0.488 | 0.872 | 0.682 |
| SPY | z < -1 | 75 | 0.546 | 0.961 | 0.691 |
| QQQ | z < 0 | 280 | 0.476 | 0.771 | 0.689 |
| QQQ | z < -0.5 | 145 | 0.469 | 0.861 | 0.692 |
| QQQ | z < -1 | 75 | 0.442 | 0.806 | 0.693 |

The classifier is near chance and generally worse than the base-rate forecast on log loss. The small severe-SPY AUC improvement is based on only 75 OOS events and does not overcome the poor probability calibration.

## 20-day descriptive mechanism

On the saved weekly-sampled 20-day analysis (`n=131`), changes in T5YIFR are positively associated with 20-day DCC change while changes in VIX are negatively associated with it. A macro-only model has R² around 0.21. Adding cumulative DCC news raises R² to about 0.46; adding the share of same-sign equity/bond innovations raises it to about 0.42.

This is useful for anatomy, but it is not a clean forecasting result: the DCC-news and same-sign variables are contemporaneous components of the dependence transition.

## Interpretation

The mechanism follow-up sharpens the headline:

> **What seems to distinguish hedge failure is the nature of the shock occurring now, not a reliably forecastable lagged macro state.**

That statement is deliberately narrower than “rate pressure causes hedge failure.” Same-day Fed repricing and related shock variables may be endogenous to the same information event affecting both asset classes.
