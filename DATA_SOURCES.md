# Data-source manifest and provenance gates

This file separates **recovered source identities** from **still-unresolved provenance**. A series appearing in a saved result table is not enough to claim a reproducible data pipeline: provider, identifier, transformation, release timing and revision treatment all need to be explicit.

## 1. Market instruments

| Object | Saved symbol/name | Intended role | Provenance status |
|---|---|---|---|
| US equities | SPY | equity return / SPY–IEF DCC | ticker recovered; exact price provider and adjusted-price convention still to recover |
| US growth equities | QQQ | equity return / QQQ–IEF DCC | ticker recovered; exact price provider and adjusted-price convention still to recover |
| US Treasuries | IEF | Treasury return / hedge leg | ticker recovered; exact price provider and adjusted-price convention still to recover |
| Gold | GLD | gold return / GLD–IEF DCC | ticker recovered; exact price provider and adjusted-price convention still to recover |
| EUR/USD | EURUSD | FX return | object recovered; exact provider/ticker convention still to recover |
| rate differential | RateDiff | EURUSD/rate-differential DCC | construction must be recovered before reproduction |

For ETF prices, the reconstruction must use total-return-consistent adjusted prices and must record the provider and download timestamp. A reconstruction that silently changes price convention is a new robustness implementation, not an exact reproduction.

## 2. Daily public macro series with recovered identifiers

The following FRED identifiers survive directly in the result names and can be treated as high-confidence source identities:

| Saved variable | FRED series | Meaning | Release-time rule for descriptive work | Prediction rule |
|---|---|---|---|---|
| `T5YIE` | `T5YIE` | 5-year breakeven inflation rate | same dated observation | may enter only after observation is available |
| `T10YIE` | `T10YIE` | 10-year breakeven inflation rate | same dated observation | may enter only after observation is available |
| `T5YIFR` | `T5YIFR` | 5-year, 5-year forward inflation expectation rate | same dated observation | may enter only after observation is available |
| `VIXCLS` | `VIXCLS` | CBOE VIX close | same dated observation | contemporaneous value is not a pre-close forecast input |
| `DCOILBRENTEU` | `DCOILBRENTEU` | Brent crude oil price | same dated observation after alignment | must respect actual availability/alignment |

Saved transformations include `Inflation5Y_bp`, `Inflation10Y_bp`, `Inflation5y5y_bp`, `VIXChange` and `OilReturn_pct`. The exact differencing/return formula must be verified against the recovered panel before declaring numerical reproduction.

## 3. Growth and labor variables recovered by name

Saved tables contain:

- `PayrollMonthly_k`
- `Payroll3mAverage_k`
- `PayrollUpdate_100k`
- `Unemployment_pct`
- `UnemploymentUpdate_pp`
- `Claims_k`
- `Claims4wk_k`
- `GDPGrowth_annualized_pct`
- `IndustrialProduction_mom_pct`

These names strongly indicate standard US public macro releases, but the exact series identifiers, vintage/revision convention, release-calendar alignment and forward-fill rule are **not yet proven by the surviving artifacts**. They remain a release blocker. Do not guess them into the frozen specification.

For any predictive extension, monthly/weekly/quarterly macro values must be joined by **release timestamp**, not observation period. Revised historical values may not be backfilled into earlier forecast origins unless a real-time vintage source is used.

## 4. Fed-expectations curve variables — unresolved source gate

Saved state variables include:

- `FedLevel`, `FedLevel_90`, `FedLevel_180`, `FedLevel_365`
- `FedUncertainty`, `FedUncertainty_90`, `FedUncertainty_180`, `FedUncertainty_365`
- `FedSlope_365_90`
- `FedCurvature_90_180_365`
- `FedUncSlope_365_90`
- `FedUncCurvature_90_180_365`

Saved shock variables include:

- `FedRepricing`
- `AbsFedRepricing`
- `FedUncertaintyChange_bp`
- `FedSlopeChange_bp`
- `FedCurvatureChange_bp`

The economic meaning is recoverable from the names, but the underlying instrument/provider and construction formula are not yet sufficiently documented. This is the most important remaining data-provenance gap because Fed-level/curvature variables are central to the D4 narrative.

**Release rule:** no exact-reproduction claim until the raw Fed-expectations source, units, horizon interpolation and curve formulas are recovered and one reconstructed date is hand-checked end to end.

## 5. Cleveland Fed and NY Fed secondary data

The archive contains a monthly Cleveland inflation-curve/risk-premia exercise with only about 40 overlapping DCC observations. It remains descriptive. The exact Cleveland dataset version, tenor definitions, download date and transformation code must be recorded before regeneration.

The saved NY Fed feasibility exercise concluded that the available survey releases were too sparse/irregular for defensible wavelet inference. That negative feasibility result stays archived; the release should not manufacture a denser series through interpolation.

## 6. Alignment policy

The reconstructed pipeline must make the following choices explicit rather than burying them in joins:

1. Market returns use a common trading-date calendar.
2. State variables may be carried forward for contemporaneous descriptive analysis only when that rule matches the original construction and is documented.
3. Shock/update variables are zero or missing between releases according to the original definition; they must not be naively forward-filled.
4. Predictive tests use only information available before the target realization.
5. Missingness is never silently converted to zero unless zero has an economic meaning in that variable's construction.
6. Every derived variable records units before and after transformation.

## 7. Minimum machine-readable manifest to add before v1.0

A future `data/series_manifest.csv` should contain one row per raw series with at least:

`name, provider, provider_id, frequency, units, timezone, observation_date_rule, release_timestamp_rule, revision_policy, transformation, start_date, end_date, retrieval_date`

The current document intentionally leaves unresolved fields unresolved. Provenance uncertainty is preferable to a plausible but invented source history.