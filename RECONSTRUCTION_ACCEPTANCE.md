# Numerical acceptance gates for reconstruction

The reconstructed pipeline should be judged against frozen outputs, not against whether it produces a similar-looking chart. This document defines the order of proof.

## Gate 0 — provenance before optimization

Before tuning any model setting, recover or explicitly replace:

- market-price provider and adjusted-price convention;
- EURUSD/rate-differential construction;
- Fed-expectations level/uncertainty source and 90/180/365-day interpolation;
- growth/labor series IDs and release-date alignment;
- original univariate GARCH marginal specification and DCC likelihood/distribution;
- exact LA(8) MODWT library/convention.

If a source cannot be recovered, the replacement must be labeled a **reconstruction implementation** and compared with the archive rather than silently treated as identical.

## Gate 1 — sample identity

The saved DCC/ADCC model-comparison samples contain:

| Pair | Frozen n |
|---|---:|
| SP500–Treasuries | 1,683 |
| Nasdaq–Treasuries | 1,683 |
| Gold–Treasuries | 1,683 |
| EURUSD–rate differential | 1,457 |

The underlying mechanism panel spans 2020-01-03 to 2026-09-15. The dedicated confirmatory D4 macro sample spans 2023-08-29 to 2026-09-15.

A mismatch in `n` or date support must be explained before comparing coefficients.

## Gate 2 — DCC/ADCC archive fingerprint

For the original saved Student-t comparison, reconstruction should first reproduce the qualitative ordering exactly:

- ADCC ΔAIC > 0 for all four systems;
- ADCC ΔBIC > 0 for all four systems;
- the asymmetry parameter is small for equity–Treasury systems and effectively zero for Gold–Treasuries.

Frozen asymmetry fingerprints:

| Pair | saved ADCC g |
|---|---:|
| SP500–Treasuries | 0.0129068217 |
| Nasdaq–Treasuries | 0.0178359332 |
| Gold–Treasuries | ~0 |
| EURUSD–rate differential | 0.0173828821 |

Exact reproduction should target numerical agreement to floating-point/optimizer tolerance. A clean-room implementation using different optimizer/library versions may be accepted with looser tolerance only if likelihoods, parameter ordering, DCC paths and conclusions are demonstrably equivalent.

The GJR-marginal robustness must also preserve positive ΔAIC/ΔBIC for ADCC and boundary-mixture p-values above 0.10 for all four systems.

## Gate 3 — wavelet sample fingerprint

The archived LA(8) broad-screen sample sizes are scale-specific:

| Scale | Approximate band | Frozen broad-screen n |
|---|---|---:|
| D1 | 2–4 | 864 |
| D2 | 4–8 | 850 |
| D3 | 8–16 | 822 |
| D4 | 16–32 | 766 |
| D5 | 32–64 | 654 |

These counts are useful fingerprints of the original alignment/boundary convention. The new conservative two-sided boundary utility may produce different counts. If so, that is not a reason to alter the utility until the old numbers reappear; it is evidence that the original boundary convention must be recovered and documented.

## Gate 4 — D4 directional fingerprint

Before comparing p-values, the reconstructed D4 equity–bond common-factor screen should reproduce the archived signs and approximate ordering:

- `FedLevel` positive (~+0.249)
- `FedLevel_180` positive (~+0.249)
- `T10YIE` positive (~+0.280 in the archived narrative)
- `T5YIFR` positive (~+0.266 in the archived narrative)
- `VIXCLS` negative (~-0.237)
- `FedCurvature_90_180_365` negative (~-0.232)

Failure of sign/order is a data/construction warning, not an invitation to retune the wavelet band.

## Gate 5 — multiplicity and confirmation fingerprint

The broad circular-shift/BH correction must continue to remove the apparent exploratory discoveries as a family. A reconstruction that suddenly produces many FDR discoveries should be treated as suspicious until the family definition, permutation scheme and alignment are reconciled.

The confirmatory D4 pass should preserve the central negative result: most individual macro coefficients remain uncertain. The archived direct Fed-curvature-change result is borderline rather than definitive (HAC p about 0.0119; BH q about 0.0593; wider block interval crosses zero).

## Gate 6 — predictive falsification fingerprint

The archived all-variable ridge exercise has negative time-series CV R² despite moderate in-sample explanatory fit. The lagged-state hedge-failure classifier is near chance and generally loses to the base-rate forecast on log loss.

A reconstructed pipeline that produces strong out-of-sample forecasting performance must therefore trigger a leakage audit before it is celebrated.

Minimum audit:

1. release-time joins rather than observation-period joins;
2. transforms fit on training data only;
3. no centered filters using future observations;
4. no future-filled macro data;
5. rolling/expanding split indices satisfy `max(train) < min(test)`;
6. benchmark is computed on the same test observations.

## Gate 7 — mechanism fingerprint

Conditional on negative equity innovations, the saved contemporaneous shock-balance split is large:

- SPY: risk-off-dominant failure ~26.8%; rate-pressure-dominant ~94.4%;
- QQQ: risk-off-dominant failure ~25.4%; rate-pressure-dominant ~88.7%.

This is a descriptive mechanism fingerprint, not a target to optimize. If reconstruction materially changes it, inspect innovation standardization, date alignment and balance-score construction.

## Release decision

A reproducible `v1.0` requires either:

**A. Exact recovery:** the original source/conventions are recovered and the frozen outputs reproduce within numerical tolerance; or

**B. Transparent reconstruction:** irrecoverable inputs are replaced with documented public equivalents, all deviations from frozen fingerprints are tabulated, and the scientific conclusion is re-evaluated without tuning toward the old answer.

Option B is scientifically acceptable. Pretending B is A is not.