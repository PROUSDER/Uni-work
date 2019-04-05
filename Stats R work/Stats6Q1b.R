n <- 7
lambda <- 3.3
N <- 10000
estimates <- sapply(1:N, function(i) median(rexp(n, rate = lambda)))
# sets up parameters and N estimates, from 7 observations of Exp(3.3)

#By usiing the weak law of large numbers we can approach
#the bias and the mean square error, of the median.

true_median <- -(log(0.5)/lambda) #Calculating the true median from work in (1a)

median_bias <- sum(estimates-true_median)/N


median_MSE <- sum((estimates-true_median)^2)/N


print(paste("the bias is,", median_bias,"the MSE is,", median_MSE))