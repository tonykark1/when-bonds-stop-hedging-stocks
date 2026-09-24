# Reproducibility utilities for the frozen stock-bond dependence specification.
#
# These functions are deliberately dependency-light. They encode invariants that
# should hold regardless of the eventual DCC/wavelet package used to reconstruct
# the original analysis.

fisher_z <- function(rho, eps = 1e-10) {
  stopifnot(is.numeric(rho), length(eps) == 1L, eps > 0, eps < 1)
  clipped <- pmin(pmax(rho, -1 + eps), 1 - eps)
  atanh(clipped)
}

modwt_effective_filter_width <- function(filter_length = 8L, level) {
  stopifnot(length(filter_length) == 1L, filter_length >= 2,
            length(level) == 1L, level >= 1,
            filter_length == as.integer(filter_length),
            level == as.integer(level))
  as.integer((2^level - 1) * (filter_length - 1) + 1)
}

# Conservative two-sided boundary exclusion. The exact wavelet implementation
# must still be recorded because package boundary conventions differ. For LA(8),
# the level-j equivalent filter width is (2^j - 1)(8 - 1) + 1.
modwt_interior_mask <- function(n, level, filter_length = 8L) {
  stopifnot(length(n) == 1L, n >= 1, n == as.integer(n))
  width <- modwt_effective_filter_width(filter_length, level) - 1L
  idx <- seq_len(n)
  keep <- idx > width & idx <= (n - width)
  if (!any(keep)) {
    stop("No uncontaminated interior coefficients remain at this level/sample size")
  }
  keep
}

trim_modwt_boundary <- function(x, level, filter_length = 8L) {
  x[modwt_interior_mask(length(x), level, filter_length)]
}

validate_correlation_matrix <- function(R, tol = 1e-8) {
  if (!is.matrix(R) || nrow(R) != ncol(R)) {
    stop("R must be a square matrix")
  }
  if (any(!is.finite(R))) stop("R contains non-finite values")
  if (max(abs(R - t(R))) > tol) stop("R is not symmetric")
  if (max(abs(diag(R) - 1)) > tol) stop("R diagonal is not one")
  if (any(R < -1 - tol | R > 1 + tol)) stop("Correlation outside [-1, 1]")
  eig <- eigen((R + t(R)) / 2, symmetric = TRUE, only.values = TRUE)$values
  if (min(eig) < -tol) stop("R is not positive semidefinite")
  invisible(TRUE)
}

validate_dcc_path <- function(rho, dates = NULL, tol = 1e-10) {
  if (!is.numeric(rho) || any(!is.finite(rho))) {
    stop("DCC path must be finite numeric values")
  }
  if (any(rho < -1 - tol | rho > 1 + tol)) {
    stop("DCC path leaves correlation bounds")
  }
  if (!is.null(dates)) {
    if (length(dates) != length(rho)) stop("dates and rho lengths differ")
    if (is.unsorted(dates, strictly = TRUE)) stop("dates must be strictly increasing")
  }
  invisible(TRUE)
}

bh_adjust_family <- function(p) {
  if (!is.numeric(p)) stop("p must be numeric")
  if (any(!is.na(p) & (p < 0 | p > 1))) stop("p-values must lie in [0, 1]")
  stats::p.adjust(p, method = "BH")
}

make_expanding_splits <- function(n, initial, assess = 1L, skip = 0L) {
  vals <- c(n = n, initial = initial, assess = assess, skip = skip)
  if (any(vals != as.integer(vals)) || n < 2 || initial < 1 || assess < 1 || skip < 0) {
    stop("n, initial, assess and skip must be valid integers")
  }
  starts <- seq.int(initial + 1L, n - assess + 1L, by = assess + skip)
  lapply(starts, function(test_start) {
    list(
      train = seq_len(test_start - 1L),
      test = seq.int(test_start, test_start + assess - 1L)
    )
  })
}

assert_no_lookahead <- function(splits) {
  for (s in splits) {
    if (length(s$train) == 0L || length(s$test) == 0L) stop("empty split")
    if (max(s$train) >= min(s$test)) stop("look-ahead detected")
    if (length(intersect(s$train, s$test)) > 0L) stop("train/test overlap detected")
  }
  invisible(TRUE)
}

# A predictive design should fit transforms only on the training window. This
# helper makes that rule explicit for ordinary z-scoring.
train_standardize <- function(train, test) {
  mu <- mean(train, na.rm = TRUE)
  sigma <- stats::sd(train, na.rm = TRUE)
  if (!is.finite(sigma) || sigma <= 0) stop("training scale is not positive")
  list(
    train = (train - mu) / sigma,
    test = (test - mu) / sigma,
    center = mu,
    scale = sigma
  )
}
