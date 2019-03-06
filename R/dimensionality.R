#' Average Number of Points per Dimension (T2).
#'
#' \code{T2} computes the average number of points per dimension of the input
#' data set.
#'
#' @inheritParams F1
#' @return The average number of points per dimension of the input data set.
#' @export

T2 <- function(x){
  nrow(x) / ncol(x)
}

#' PCA Dimension
#'
#' PCA dimension is the number of PCA components needed to represent 95%
#' of the data variance.
#'
#' @inheritParams F1
#' @return The PCA dimension.
#' @import stats

pca_dimension <- function(x) {
  pca <- prcomp(x)
  ratio_var <- pca$sdev^2/sum(pca$sdev^2)
  m <- which(cumsum(ratio_var) >= 0.95)[1]
}

#' Average Number of Points per PCA Dimension (T3).
#'
#' \code{T3} computes the average number of points per PCA dimension of the input
#' data set. PCA dimension is the number of PCA components needed to represent 95%
#' of the data variance.
#'
#' @inheritParams F1
#' @return The average number of points per PCA dimension of the input data set.
#' @export

T3 <- function(x){
  nrow(x) / pca_dimension(x)
}

#' Ratio of the PCA Dimension to the Original Dimension (T4).
#'
#' \code{T4} computes the proportion of relevant dimensions of the dataset.
#'
#' @inheritParams F1
#' @return The ratio of the PCA dimension to the original dimension.
#' @export

T4 <- function(x){
  pca_dimension(x) / ncol(x)
}
