if (!requireNamespace("testthat", quietly = TRUE)) {
  stop("Package 'testthat' is required to run the repository checks")
}

testthat::test_dir("tests/testthat", reporter = "summary", stop_on_failure = TRUE)
