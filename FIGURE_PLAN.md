# Figure plan for the public release

The release should use **6 static figures + 1 animation**. Every figure must answer one part of the research question; decorative heatmaps are not enough.

## Figure 1 — When the hedge breaks

**Plot:** SPY–Treasury and Nasdaq–Treasury DCC paths through time, with zero line and clearly marked positive-correlation episodes.  
**Question answered:** *When does the stock–bond hedge weaken?*  
**Rule:** do not label every positive correlation as a “failure”; describe sustained positive/high correlation as weakened diversification.

## Figure 2 — Horizon anatomy

**Plot:** scale × target heatmap or coefficient summary across D1–D5 for the equity–Treasury common dependence structure.  
**Question answered:** *Does the answer depend on horizon?*  
**Key annotation:** D4 ≈ 16–32 observations; D5 larger raw effects but poorer stability.  
**Boundary rule:** exclude/flag contaminated edge coefficients.

## Figure 3 — The two-force hypothesis

**Plot:** D4 coefficient/association plot with uncertainty for a deliberately small set: inflation compensation, Fed level/curvature and VIX/risk-off variables.  
**Question answered:** *What accompanies the transition?*  
**Design:** coefficient dots plus uncertainty intervals, not a significance-star table. Exploratory and confirmatory estimates should be visually distinguishable.

## Figure 4 — Exploration versus confirmation

**Plot:** paired exploratory effect vs confirmatory coefficient for the pre-specified D4 variables, with a 45-degree reference or sign quadrants.  
**Question answered:** *Which apparent findings survive a harder test?*  
**Story:** most shrink materially; Fed-curvature change is borderline rather than definitive.

## Figure 5 — DCC versus ADCC

**Plot:** four-pair model comparison showing ADCC asymmetry `g`, ΔAIC and ΔBIC.  
**Question answered:** *Do asymmetric correlation dynamics change the story?*  
**Story:** saved ADCC asymmetry is small and the information criteria favor DCC.

## Figure 6 — Explanation is not prediction

**Plot:** in-sample R² versus time-series CV R² for state and shock ridge models.  
**Question answered:** *Does the macro layer forecast?*  
**Story:** moderate in-sample fit, negative out-of-sample R². This should be one of the most prominent credibility figures.

## Animation — dependence cube through time

**Plot:** animated heatmap / dependence surface with axes for relationship and wavelet scale, frames over time. If the original “larger-than-2D correlation matrix” is retained, keep the visual encoding fixed across frames.  
**Question answered:** *How does the entire dependence system migrate across assets and horizons?*  
**Rules:** fixed color limits; same ordering in every frame; explicit timestamp; no autoscaling; boundary-affected periods removed/flagged.

## Caption discipline

Every public caption should identify whether the figure is **exploratory**, **confirmatory**, **robustness**, or **predictive validation**. Avoid causal verbs. Report uncertainty/FDR where applicable. A visually strong exploratory heatmap must never be captioned as if it were confirmatory evidence.
