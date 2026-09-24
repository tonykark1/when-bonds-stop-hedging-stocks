# Confirmatory D4 falsification pass

**Target:** common SPY–IEF / QQQ–IEF Fisher-z DCC wavelet component at D4 (approximately 16–32 trading days).  
**Main wavelet:** LA(8).  
**Robustness transform:** Haar.

This file preserves the confirmatory results as saved. The purpose is falsification, not post-hoc rescue of the exploratory screen.

## Grouped state-factor model

| Factor | beta | HAC p | BH q | block32 95% CI | 20-phase sign agreement | rolling sign agreement |
|---|---:|---:|---:|---|---:|---:|
| Fed_state | 0.069 | 0.595 | 0.630 | [-0.197, 0.315] | 70% | 56% |
| Inflation_state | 0.063 | 0.630 | 0.630 | [-0.153, 0.401] | 65% | 67% |
| RiskCommodity_state | -0.216 | 0.0205 | 0.0819 | [-0.387, 0.036] | 100% | 78% |
| GrowthLabor_state | -0.081 | 0.518 | 0.630 | [-0.313, 0.201] | 90% | 56% |

The risk/commodity state factor is the strongest grouped-state result, but its block interval crosses zero and its BH q-value is above 0.05. It is suggestive, not a clean confirmation.

## Grouped shock-factor model

| Factor | beta | HAC p | BH q | block32 95% CI | 20-phase sign agreement | rolling sign agreement |
|---|---:|---:|---:|---|---:|---:|
| Fed_shock | 0.172 | 0.188 | 0.377 | [-0.092, 0.434] | 95% | 78% |
| Inflation_shock | 0.025 | 0.814 | 0.814 | [-0.143, 0.302] | 55% | 89% |
| RiskCommodity_shock | -0.151 | 0.136 | 0.377 | [-0.326, 0.145] | 80% | 67% |
| GrowthLabor_update | -0.046 | 0.612 | 0.814 | [-0.210, 0.148] | 55% | 56% |

No grouped shock factor provides strong confirmatory evidence.

## Direct five-variable state model

| Variable | beta | HAC p | BH q | block32 CI | block64 CI | non-overlap sign | thirds sign |
|---|---:|---:|---:|---|---|---:|---:|
| T5YIFR | 0.143 | 0.282 | 0.353 | [-0.205, 0.349] | [-0.230, 0.332] | 70% | 67% |
| FedLevel_180 | 0.054 | 0.705 | 0.705 | [-0.144, 0.437] | [-0.146, 0.490] | 50% | 67% |
| FedCurvature_90_180_365 | -0.150 | 0.183 | 0.306 | [-0.362, 0.102] | [-0.406, 0.158] | 90% | 100% |
| VIXCLS | -0.122 | 0.178 | 0.306 | [-0.342, 0.077] | [-0.312, 0.049] | 90% | 100% |
| DCOILBRENTEU | 0.133 | 0.0654 | 0.306 | [-0.079, 0.272] | [-0.143, 0.291] | 75% | 67% |

The signs of Fed curvature and VIX are relatively stable across partitions, but their uncertainty intervals include zero and multiplicity-adjusted evidence is weak.

## Direct five-variable shock model

| Variable | beta | HAC p | BH q | block32 CI | block64 CI | non-overlap sign | thirds sign |
|---|---:|---:|---:|---|---|---:|---:|
| Inflation5y5y_bp | 0.126 | 0.279 | 0.436 | [-0.154, 0.315] | [-0.154, 0.299] | 60% | 67% |
| FedRepricing | 0.086 | 0.419 | 0.436 | [-0.086, 0.345] | [-0.097, 0.396] | 60% | 67% |
| FedCurvatureChange_bp | -0.183 | 0.0119 | 0.0593 | [-0.344, -0.002] | [-0.369, 0.041] | 85% | 100% |
| VIXChange | -0.071 | 0.436 | 0.436 | [-0.284, 0.138] | [-0.252, 0.130] | 90% | 100% |
| OilReturn_pct | 0.083 | 0.251 | 0.436 | [-0.082, 0.261] | [-0.104, 0.291] | 65% | 67% |

Fed-curvature change is the closest result to surviving the confirmatory filter: HAC p=0.0119, BH q=0.0593, with the 32-observation block interval barely excluding zero but the 64-observation interval crossing zero. It should be described as **borderline/suggestive**, not as a discovered causal driver.

## Confirmatory conclusion

The dedicated D4 pass is materially weaker than the broad exploratory screen. That weakening is a central result. The evidence supports a horizon-specific dependence structure and some stable directional patterns, but not a collection of individually established macro drivers.
