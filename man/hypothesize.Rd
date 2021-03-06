% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hypothesize.R
\name{hypothesize}
\alias{hypothesize}
\title{Declare a null hypothesis}
\usage{
hypothesize(x, null, ...)
}
\arguments{
\item{x}{a data frame that can be coerced into a \code{\link[dplyr]{tbl_df}}}

\item{null}{the null hypothesis. Options include "independence" and "point"}

\item{...}{arguments passed to downstream functions}
}
\value{
A tibble containing the response (and explanatory, if specified) variable data with
parameter information stored as well
}
\description{
Declare a null hypothesis
}
\examples{
# One binary variable
  mtcars \%>\%
    dplyr::mutate(am = factor(am)) \%>\%
    specify(response = am, success = "1") \%>\%
    hypothesize(null = "point", p = 0.75) \%>\%
    generate(reps = 100, type = "simulate") \%>\%
    calculate(stat = "prop")

# Permutation test
  mtcars \%>\%
    dplyr::mutate(cyl = factor(cyl)) \%>\%
    specify(mpg ~ cyl) \%>\%
    hypothesize(null = "independence") \%>\%
    generate(reps = 100, type = "permute") \%>\%
    calculate(stat = "F")
}
