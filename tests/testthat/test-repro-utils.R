source(file.path("R", "repro_utils.R"))

testthat::test_that("Fisher transform stays finite at correlation bounds", {
  z <- fisher_z(c(-1, -0.5, 0, 0.5, 1))
  testthat::expect_true(all(is.finite(z)))
  testthat::expect_equal(z[3], 0)
  testthat::expect_true(all(diff(z) > 0))
})

testthat::test_that("LA8 MODWT equivalent widths increase as expected", {
  testthat::expect_equal(modwt_effective_filter_width(8L, 1L), 8L)
  testthat::expect_equal(modwt_effective_filter_width(8L, 2L), 22L)
  testthat::expect_equal(modwt_effective_filter_width(8L, 3L), 50L)
  testthat::expect_equal(modwt_effective_filter_width(8L, 4L), 106L)
  testthat::expect_equal(modwt_effective_filter_width(8L, 5L), 218L)
})

testthat::test_that("boundary trimming removes both contaminated edges", {
  x <- seq_len(300)
  keep <- modwt_interior_mask(length(x), level = 4L, filter_length = 8L)
  testthat::expect_false(any(keep[1:105]))
  testthat::expect_false(any(keep[(300 - 105 + 1):300]))
  testthat::expect_true(all(keep[106:(300 - 105)]))
  testthat::expect_equal(trim_modwt_boundary(x, 4L, 8L), x[keep])
})

testthat::test_that("boundary trimming fails when no interior remains", {
  testthat::expect_error(modwt_interior_mask(200L, 5L, 8L), "No uncontaminated")
})

testthat::test_that("valid correlation matrices pass", {
  R <- matrix(c(1, 0.2, -0.1,
                0.2, 1, 0.3,
                -0.1, 0.3, 1), 3, 3, byrow = TRUE)
  testthat::expect_true(validate_correlation_matrix(R))
})

testthat::test_that("invalid correlation matrices fail loudly", {
  nonsym <- matrix(c(1, 0.9, 0.1, 1), 2, 2, byrow = TRUE)
  testthat::expect_error(validate_correlation_matrix(nonsym), "symmetric")

  out_of_bounds <- matrix(c(1, 1.1, 1.1, 1), 2, 2)
  testthat::expect_error(validate_correlation_matrix(out_of_bounds), "outside")

  non_psd <- matrix(c(1, 0.9, 0.9,
                      0.9, 1, -0.9,
                      0.9, -0.9, 1), 3, 3, byrow = TRUE)
  testthat::expect_error(validate_correlation_matrix(non_psd), "positive semidefinite")
})

testthat::test_that("DCC paths enforce bounds and date order", {
  d <- as.Date("2026-01-01") + 0:2
  testthat::expect_true(validate_dcc_path(c(-0.2, 0, 0.4), d))
  testthat::expect_error(validate_dcc_path(c(0, 1.01)), "bounds")
  testthat::expect_error(validate_dcc_path(c(0, 0.1), rev(d[1:2])), "increasing")
})

testthat::test_that("BH adjustment is exactly one declared family", {
  p <- c(0.001, 0.01, 0.04, 0.2, 0.9)
  testthat::expect_equal(bh_adjust_family(p), stats::p.adjust(p, method = "BH"))
  testthat::expect_error(bh_adjust_family(c(0.1, 1.1)), "[0, 1]")
})

testthat::test_that("expanding splits never look ahead", {
  splits <- make_expanding_splits(n = 100L, initial = 60L, assess = 5L, skip = 0L)
  testthat::expect_true(assert_no_lookahead(splits))
  testthat::expect_equal(max(splits[[1]]$train), 60L)
  testthat::expect_equal(splits[[1]]$test, 61:65)
})

testthat::test_that("standardization uses training moments only", {
  train <- c(1, 2, 3, 4, 5)
  test <- c(100, 200)
  out <- train_standardize(train, test)
  testthat::expect_equal(out$center, mean(train))
  testthat::expect_equal(out$scale, stats::sd(train))
  testthat::expect_equal(out$test, (test - mean(train)) / stats::sd(train))
})
