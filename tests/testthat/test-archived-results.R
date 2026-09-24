testthat::test_that("archived DCC/ADCC comparison has frozen sample sizes and model ordering", {
  x <- utils::read.csv(
    testthat::test_path("..", "..", "results", "adcc_comparison.csv"),
    check.names = FALSE
  )
  testthat::expect_equal(nrow(x), 4L)
  testthat::expect_equal(
    x$pair,
    c("SP500_Treasuries", "Nasdaq_Treasuries", "Gold_Treasuries", "EURUSD_RateDifferential")
  )
  testthat::expect_equal(x$n, c(1683L, 1683L, 1683L, 1457L))
  testthat::expect_true(all(x$delta_AIC_adcc_minus_dcc > 0))
  testthat::expect_true(all(x$delta_BIC_adcc_minus_dcc > 0))
  testthat::expect_equal(x$adcc_g[1], 0.0129068217131917, tolerance = 1e-10)
  testthat::expect_equal(x$adcc_g[2], 0.0178359332088049, tolerance = 1e-10)
  testthat::expect_lt(abs(x$adcc_g[3]), 1e-10)
  testthat::expect_equal(x$adcc_g[4], 0.0173828821386657, tolerance = 1e-10)
})

testthat::test_that("GJR marginal robustness still does not favor ADCC", {
  x <- utils::read.csv(
    testthat::test_path("..", "..", "results", "adcc_after_gjr.csv"),
    check.names = FALSE
  )
  testthat::expect_equal(nrow(x), 4L)
  testthat::expect_equal(x$n, c(1683L, 1683L, 1683L, 1457L))
  testthat::expect_true(all(x$delta_AIC_adcc_minus_dcc > 0))
  testthat::expect_true(all(x$delta_BIC_adcc_minus_dcc > 0))
  testthat::expect_true(all(x$p_boundary_mixture >= 0.1))
})
