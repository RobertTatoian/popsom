\name{map.build}
\alias{map.build}
\title{Build Map}
\description{Constructs a SOM, returns an object of class 'map'.}
\usage{
map.build(data,labels=NULL,xdim=10,ydim=5,alpha=0.3,train=1000,algorithm="vsom")
}
\arguments{
  \item{data}{a dataframe where each row contains an unlabeled training instance.}
  \item{labels}{a vector or dataframe with one label for each observation in data.}
  \item{xdim}{the x-dimension of the map. (default=10)}
  \item{ydim}{the y-dimension of the map. (default=5)}
  \item{alpha}{the learning rate, should be a positive non-zero real number. (default=0.3)}
  \item{train}{the number of training iterations. (default=1000)}
  \item{algorithm}{training algorithm selection switch. (default="vsom")}
}
\value{object of type 'map'.}

\note{You have a choice of training algorithms: 
	\itemize{
	\item "vsom" - vectorized stochastic learning, this is a highly optimized version of stochastic training written in FORTRAN 9X.
	\item "som" - the traditional stochastic learning algorithm written in C++/TNT. 
	\item "batchsom" - batch version of the SOM training algorithm, written in C.
	\item "experimental" - 	experimental implementation of vectorized stochastic learning implemented directly in R.	
	}
}
\note{If your training data does not have any labels you can construct a simple label vector as follows: labels <- 1:nrow(training.data).  
	If you let the labels default to the NULL value then no labels will be shown 
	in the map visualization.}
\author{Lutz Hamel, Benjamin Ott, Gregory Breard}
\examples{
data(iris)

## set data frame and labels
df <- subset(iris,select=-Species)
labels <- subset(iris,select=Species)

## build a map
m <- map.build(df, labels, xdim=15, ydim=10, train=1000)
}
