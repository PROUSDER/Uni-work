cdf.poisson.mle <- function(v, lambda, n) {
  ppois(n*v, lambda = n * lambda)
}

n <- 12
lambda <- 3.2
v <- seq(from = 1, to = 5, length = 1001)
plot(v, cdf.poisson.mle(v, lambda = lambda, n = n), type= "l", main = "CDF of the ML estimator for lambda", xlab = "lambda", ylab="CDF")
abline(v=lambda, col="darkgreen")
text(lambda, 0, labels = "True value of lambda", pos = 4, col = "darkgreen")

N <- 100
poisson.mles <- sapply(N, function(i)mean(rpois(n, lambda = lambda)))

print(poisson.mles)