% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/class-balance.R
\name{num_examples_majority}
\alias{num_examples_majority}
\title{The Number of Observations in the Majority Class.}
\usage{
num_examples_majority(y)
}
\arguments{
\item{y}{A vector (or factor) determining the class of each example in
the data.}
}
\value{
The number of examples in the majority class.
}
\description{
\code{num_examples_majority} computes the number of examples in the
majority class. It assumes the number of classes in the input data set is
two.
}
