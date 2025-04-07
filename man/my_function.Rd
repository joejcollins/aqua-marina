\name{my_function}
\alias{my_function}
\title{A Sample Function for Data Analysis}
\description{
  This function performs a basic operation on a numeric vector. It calculates the 
  mean and standard deviation of the input vector and returns them in a list.
}
\usage{
  my_function(x)
}
\arguments{
  \item{x}{A numeric vector. The function will calculate the mean and standard 
  deviation of this vector.}
}
\value{
  A named list with two elements:
  \item{mean}{The mean of the input vector.}
  \item{sd}{The standard deviation of the input vector.}
}
\examples{
  # Example usage of my_function
  vec <- c(1, 2, 3, 4, 5)
  result <- my_function(vec)
  print(result)
}
\seealso{
  \code{\link{mean}}, \code{\link{sd}}
}
