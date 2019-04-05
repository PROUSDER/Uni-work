xtab <- c(109, 65, 22, 3, 1, 0)
xobs <- rep(0:5, xtab)
n <- length(xobs)
xbarobs <- mean(xobs)

ell <- funtion(lambda) {
  stopifnot(all(lambda > 0))
  n <- length(xobs)
  n * (-lambda +mean(xobs) * log(lambda))
}

