#options(width=70)
#N <- 10000
#theta <- 1.7
#n <- 2
#that <- sapply(1:N, function(i) mean(rpois(n = n, lambda = theta)))
#plot(density(that, from = 0), xlim = c(0,5), main = paste("theta =", theta, ", n =", n), xlab = "Sampling distribution of thetahat", ylab="", col ="darkblue", lwd = 2)
#abline(v = theta, col ="darkgreen", lwd = 2, lty = 2)
#text(theta, 0, labels ="True value", pos = 4, col = "darkgreen")

# Question 3a
par(mfrow = c(2,2))
nn <- c(2, 4, 8, 16)
N <- 10000
theta <- 1.7

for(n in nn)
  { #this will create a graph for each value in the vector nn
  that <- sapply(1:N, function(i) mean(rpois(n = n, lambda = theta))) 
  #creates a vector of observations from the poisson distribution. 
  plot(density(that, from = 0), xlim = c(0,5), ylim = c(0,1.25), main = paste("theta =", theta, ", n =", n), xlab = "Sampling distribution of theta_hat", ylab="", col ="darkblue", lwd = 2)
  # approximates the distribution from the observations
  abline(v = theta, col ="darkgreen", lwd = 2, lty = 2)
  text(theta, 0, labels ="True value", pos = 4, col = "darkgreen")
  #adds text and the true value of theta
}

