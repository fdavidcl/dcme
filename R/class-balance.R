#' The Number of Observations in the Majority Class.
#'
#' \code{num_examples_majority} computes the number of examples in the
#' majority class. It assumes the number of classes in the input data set is
#' two.
#'
#' @inheritParams F1
#' @return The number of examples in the majority class.
#' @export

num_examples_majority <- function(y){
  if (length(unique(y)) != 2){
    stop("Data must have (only) 2 classes.")
  }

  max(table(y))
}

#' The Number of Observations in the Minority Class.
#'
#' \code{num_examples_minority} computes the number of examples in the
#' minority class. It assumes the number of classes in the input data set is
#' two.
#'
#' @inheritParams F1
#' @return The number of examples in the minority class.
#' @export

num_examples_minority <- function(y){
  if (length(unique(y)) != 2){
    stop("Data must have (only) 2 classes.")
  }

  min(table(y))
}

#' The Proportion of Majority Examples in the Data Set.
#'
#' \code{proportion_examples_majority} computes the proportion of examples
#' that belong to the majority class.
#'
#' @inheritParams F1
#' @return The proportion of examples that belong to the majority class.
#' @export

proportion_examples_majority <- function(y){
  num_examples_majority(y) / length(y)
}

#' The Proportion of Minority Examples in the Data Set.
#'
#' \code{proportion_examples_minority} computes the proportion of examples
#' that belong to the minority class.
#'
#' @inheritParams F1
#' @return The proportion of examples that belong to the minority class.
#' @export

proportion_examples_minority <- function(y){
  num_examples_minority(y) / length(y)
}

#' Entropy of Class Proportions (C1)
#'
#'
#' @inheritParams F1
#' @return The entropy of class proportions of the input data set.
#' @export

C1 <- function(y){
  pi <- table(y) / length(y)

  - 1 / log(num_classes(y)) * sum(pi * log(pi))
}


#' The Imbalance Ratio (IR) of a Data Set.
#'
#' \code{IR} computes the imbalance ratio of a binary data set. It is defined
#' as the ratio of the number of majority class examples to the number of
#' minority class examples.
#'
#' @inheritParams F1
#' @return The imbalance ratio of the input data set.
#' @export

IR <- function(y){
  num_examples_majority(y) / num_examples_minority(y)
}

#' The Imbalance Ratio (C2) of a Multiclass Data Set.
#'
#' \code{C2} computes the imbalance ratio of a binary or multiclass data set.
#' This is not equivalent to IR, the imbalance ratio for binary data sets.
#'
#' @inheritParams F1
#' @return The imbalance ratio of the input data set.
#' @export

C2 <- function(y) {
  counts <- table(y)
  ircomps <- counts / (length(y) - counts)

  (1 - 1 / num_classes(y)) * sum(ircomps)
}
