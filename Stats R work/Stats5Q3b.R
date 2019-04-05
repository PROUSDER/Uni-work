# Question 3b

par(mfrow = c(2,4))

nn <- c(2, 4, 8, 16)
N <- 10000
theta <- 1.7

for(n in nn)
{ #this will create a graph for each value in the vector nn
  title1 <- paste("theta =", theta, ", n =", n)
  that <- sapply(1:N, function(i) mean(rpois(n = n, lambda = theta))) 
  #creates a vector of observations from the poisson distribution. 
  plot(density(that, from = 0), xlim = c(-1,5), ylim = c(0,1.25), main = title1, xlab = "Sampling distribution of theta_hat", ylab="", col ="darkblue", lwd = 2)
  # approximates the distribution from the observations
  abline(v = theta, col ="darkgreen", lwd = 2, lty = 2)
  text(theta, 0, labels ="True value", pos = 4, col = "darkgreen")
  #adds text and the true value of theta
}

x <- seq(from = -1, to = 5, length = N)

for(n in nn){
  title <- paste("theta =", theta, ", n =", n) #creates the title for a graph
  
  y <- dnorm(x, mean = theta, sd = sqrt(theta/n)) # density function for normal distribution(mean = theta, variance = (theta/n)) 
  plot(x, y, type = 'l', col = "darkblue", lwd = 2, xlim = c(-1,5), ylim = c(0,1.25), main = title, ylab ='density of support', xlab = 'x: support of distribution' )
  #plots the graphs support against density
}
