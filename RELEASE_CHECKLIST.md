# Release checklist

The repository should not be tagged `v1.0` until every blocking item is checked.

## Specification and provenance

- [x] Primary research question frozen.
- [x] DCC/ADCC target systems named.
- [x] Main wavelet family and D1–D5 scales frozen.
- [x] Confirmatory D4 target frozen.
- [x] Exact daily mechanism-panel dates recovered: 2020-01-03 to 2026-09-15.
- [x] Exact confirmatory D4 macro dates recovered: 2023-08-29 to 2026-09-15.
- [x] Exploratory, confirmatory, mechanism and predictive layers explicitly separated.
- [ ] Original executable source code recovered and committed.
- [x] Provenance manifest added; known FRED identifiers, alignment rules and unresolved source gates are explicit in `DATA_SOURCES.md`.
- [ ] Remaining unresolved providers/series IDs and Fed-expectations construction recovered.
- [ ] Environment/package lock file recovered or rebuilt.

## Statistical credibility

- [x] DCC versus ADCC comparison archived.
- [x] ADCC robustness after GJR marginal models archived.
- [x] Haar wavelet robustness documented.
- [x] Circular-shift inference documented.
- [x] Broad BH/FDR failure reported rather than hidden.
- [x] HAC confirmatory inference documented.
- [x] Block uncertainty intervals documented.
- [x] Subperiod/sign stability documented.
- [x] Time-series CV failure reported.
- [x] Lagged-state walk-forward hedge-failure failure reported.
- [ ] First-stage DCC parameter uncertainty propagated into second-stage wavelet inference, or explicitly scoped as future work.

## Wavelet implementation

- [x] Boundary effects explicitly recognized in the specification.
- [x] Dependency-light LA(8) effective-filter-width and conservative two-sided boundary utilities added with tests.
- [ ] Figure-generation code demonstrably removes or flags scale-specific boundary coefficients.
- [ ] Exact LA(8) implementation/library and original boundary convention recovered from source code.
- [ ] Confirm that every public figure uses the same frozen boundary rule.

## Figures

- [ ] Figure 1: DCC paths / hedge-break timeline.
- [ ] Figure 2: horizon anatomy.
- [ ] Figure 3: two-force D4 coefficient plot with uncertainty.
- [ ] Figure 4: exploration versus confirmation shrinkage.
- [ ] Figure 5: DCC versus ADCC model comparison.
- [ ] Figure 6: in-sample explanation versus out-of-sample prediction.
- [ ] Animation: fixed-scale dependence heatmap through time.
- [ ] Every caption labeled exploratory / confirmatory / robustness / predictive validation.

## Reproducibility

- [ ] Clean checkout runs end to end without private paths.
- [ ] Raw-data download or documented public-data reconstruction works.
- [ ] Intermediate DCC paths can be regenerated.
- [ ] Wavelet tables can be regenerated.
- [ ] Confirmatory tables can be regenerated.
- [ ] Figure outputs are deterministic given frozen inputs/seeds.
- [x] Automated invariant tests cover DCC correlation bounds, positive-semidefinite correlation matrices, no look-ahead in predictive splits, BH/FDR adjustment and wavelet boundary removal.
- [x] GitHub Actions workflow added to run the dependency-light invariant suite on pushes/PRs.

## Narrative discipline

- [x] No causal verbs for observational associations.
- [x] No profitable-strategy claim.
- [x] No validated forecasting claim.
- [x] Null/negative results are prominent.
- [x] ADCC non-improvement is reported.
- [x] Mechanism split is labeled secondary/post-screen.
- [x] Wavelet scales are not called literal investor holding periods.

## Release gate

**Current state: research-note release candidate with a tested reproducibility scaffold, not yet a reproducible-code release.**

The largest remaining blocker is not another statistical model. It is recovering/reconstructing the actual DCC + macro-input pipeline, especially the Fed-expectations source/construction, and validating reconstructed outputs against the frozen archive.