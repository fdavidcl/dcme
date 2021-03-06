#' The Geometric Mean Ratio of Standard Deviations.
#'
#' \code{sd_ratio} computes the lack of homogeneity between the covariance
#' matrices of the classes in the data set.
#'
#' @inheritParams F1
#' @return The geometric mean ratio of standard deviations.
#' @import stats
#' @export

sd_ratio <- function(x, y){
  if (!is.data.frame(x)) x <- as.data.frame(x)

  n <- num_examples(x)
  p <- num_features(x)
  q <- num_classes(y)

  x_groups <- split(x, y)
  n_per_class <- vapply(x_groups, num_examples, numeric(1))

  a <- (2 * (p ^ 2) + 3 * p - 1) / (6 * (p + 1) * (q - 1))
  b <- sum(1 / (n_per_class - 1)) - (1 /(n - q))
  gamma <- 1 - a * b

  cov_mat <- cov(x)
  inv_cov_mat_per_class <- lapply(x_groups,
                                  function(x){
                                    tryCatch(solve(cov(x)),
                                             error = function(e) NA)
                                  })
  if (anyNA(inv_cov_mat_per_class)){
    warning("At least one of the class matrices was singular. Returning NA.")
    return(NA)
  }

  a <- n_per_class - 1
  b <- vapply(inv_cov_mat_per_class,
              function(x) log(norm(x %*% cov_mat, type = "F")),
              numeric(1))
  M <- gamma * sum(a * b)

  exp(M / (p * sum(n_per_class - 1)))
}

#' Mean Absolute Correlation Coefficient.
#'
#' \code{corr_abs} computes the correlations between all pairs of features
#' for each class and then averages these values for all pairs and all classes.
#'
#' @inheritParams F1
#' @return The mean absolute correlation coefficient of the input data set.
#' @import stats
#' @export

corr_abs <- function(x, y){
  if (!is.data.frame(x)) x <- as.data.frame(x)

  x_groups <- split(x, y)
  mean_abs_cor_per_class <- vapply(x_groups,
                                   function(x) mean(abs(cor(x))),
                                   numeric(1))
  mean(mean_abs_cor_per_class)
}
