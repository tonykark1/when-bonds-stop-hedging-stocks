# Surviving analysis archive

This manifest records the result bundles recovered during the release pass. These artifacts are treated as evidence of what was run; they are **not** a substitute for executable source code.

## Core wavelet-DCC bundle

Recovered bundle: `wavelet_dcc_full_results.zip`.

Contents include:

- `FULL_FINDINGS.md`
- `SUMMARY.md`
- `wavelet_pairwise_all.csv`
- `wavelet_haar_robustness_top.csv`
- `wavelet_group_factor_joint_hac.csv`
- `wavelet_group_factor_loadings.csv`
- `wavelet_joint_ridge_fit.csv`
- `wavelet_joint_ridge_coefficients.csv`
- `equity_bond_common_factor_all_variables.csv`
- `equity_bond_common_joint_ridge_fit.csv`
- `equity_bond_common_joint_ridge_coefficients.csv`
- `dcc_common_factor_by_scale.csv`
- `dcc_common_factor_loadings.csv`
- `medium_horizon_relationships.csv`
- Cleveland monthly wavelet tables
- NY Fed feasibility table
- variable dictionary

The bundle contains result tables, not the script that generated them.

## Confirmatory D4 bundle

Recovered bundle: `wavelet_dcc_confirmatory.zip`.

Contents include grouped and direct confirmatory models, block-bootstrap intervals, non-overlap phase checks, subperiod stability and extreme-episode robustness. The dated subperiod files recover the confirmatory calendar span **2023-08-29 through 2026-09-15**.

## DCC / ADCC robustness

Recovered standalone tables:

- `adcc_comparison.csv`
- `adcc_after_gjr.csv`
- `adcc_news_impact.csv`

The first two are preserved in this repository as compact model-comparison tables. The GJR re-estimation is important because it checks that the weak case for ADCC is not merely an artifact of symmetric marginal volatility models.

## Mechanism follow-up bundle

Recovered bundle: `dcc_mechanism_followup.zip`.

Contents include:

- daily mechanism panel;
- conditional logit results;
- lagged-state walk-forward tests;
- 20-day mechanism models and quintiles;
- shock-balance regime tables and robustness variants;
- GJR parameters;
- mediation/descriptive decomposition tables.

The daily mechanism panel spans **2020-01-03 through 2026-09-15**.

## Multivariate DCC bundle

Recovered bundle: `multivariate_dcc_results.zip`.

It contains 15 dynamic pairwise correlations from a six-variable system, DCC eigenstructure, PC1 loadings, macro-regime summaries, 20-day pair shifts, bootstrap results and system wavelet metrics. The dynamic-correlation table spans **2020-01-03 through 2026-09-14**.

This bundle is useful for the larger-than-2D dependence visualization but is secondary to the frozen stock–bond research question.

## Animation

A saved `dcc_heatmap_animation.gif` also survives in the archive. It should not be promoted unchanged until its color limits, ordering, timestamping and boundary treatment are checked against `FIGURE_PLAN.md`.

## Missing artifact

The critical missing artifact is the **executable source pipeline** that produced these bundles. Until it is recovered or reconstructed and validated against the archived outputs, this repository is a research-note release candidate rather than a clean reproducibility package.
