n <- 7
lambda <- 3.3
N <- 10000
mhat_observations <- sapply(1:N, function(i) -(log(0.5)*mean(rexp(n, rate = lambda))))
# sets up parameters and N*(7 observations) of Exp(3.3)

#Using the mhat we derived in (1a)

true_median <- -(log(0.5)/lambda)
#creates N mhat_observations from N observations

#Now we use the Weak law of large numbers to approach the bias and MSE.

bias <- sum(mhat_observations - true_median)/N
MSE  <- sum((mhat_observations - true_median)^2)/N

print(paste("the bias is,", bias,"the MSE is,", MSE))