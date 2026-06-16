#!/usr/bin/env Rscript
#admixture date is point date estimated by fastGT
# weights is a text file of chromosome lengths
args <- commandArgs(trailingOnly = TRUE)

if (length(args) != 3) {
  stop("Usage: Rscript calc_jackknife_ci.R admixture_date bootstrap.out weights.txt")
}

full_data_date <- as.numeric(args[1])
bootstrap_file <- args[2]
weights_file <- args[3]

if (is.na(full_data_date)) {
  stop("admixture_date must be numeric")
}

boot <- read.table(bootstrap_file, header = TRUE, stringsAsFactors = FALSE)
weights <- scan(weights_file, what = numeric(), quiet = TRUE)

if (!"date1.est.boot" %in% colnames(boot)) {
  stop("bootstrap file must contain a column named 'date1.est.boot'")
}

jackknife_dates <- boot$date1.est.boot
n <- length(jackknife_dates)

if (length(weights) != n) {
  stop(paste0("number of weights (", length(weights),
              ") does not match number of rows in bootstrap file (", n, ")"))
}

if (any(weights <= 0)) {
  stop("all weights must be positive")
}

h_j <- sum(weights) / weights

jackknife_se <- sqrt(
  (1 / n) * sum(
    (1 / (h_j - 1)) *
    (
      h_j * full_data_date -
      (h_j - 1) * jackknife_dates -
      n * full_data_date +
      sum((1 - weights / sum(weights)) * jackknife_dates)
    )^2
  )
)

ci_lower <- full_data_date - 1.96 * jackknife_se
ci_upper <- full_data_date + 1.96 * jackknife_se

cat("Admixture date:", full_data_date, "\n")
cat("Weighted jackknife SE:", jackknife_se, "\n")
cat("95% CI:", ci_lower, ci_upper, "\n")
