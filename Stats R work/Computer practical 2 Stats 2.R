### Louis Forbes Wright

##Question 1

#mpar <- par(lwd = 2)

xtab <- c(109, 65, 22, 3, 1, 0)
xobs <- rep(0:5, xtab)

T_test <- -(log(mean(xobs == 0)))
Lambda_hat <- mean(xobs)

n <- 200
N <- 10000 
lambda <- 1

#creating sampling data then using the functions defined in the worksheet.

T_statistic_1 <- sapply(1:N, function(i) -log(mean(rpois(n, lambda) == 0)))
Lambda_MLE_1 <- sapply(1:N , function(i) mean(rpois(n, (lambda))))
# for lambda = 1 

T_statistic_2 <- sapply(1:N, function(i) -log(mean(rpois(n, 2) == 0)))
Lambda_MLE_2 <- sapply(1:N , function(i) mean(rpois(n, 2)))
 #for lambda = 2

title = "Sampling distributions for lambda = 1, and lambda = 2."
xlabel = "values of Lambda_MLE and T_statistic"

plot(density(T_statistic_1), ylim = c(0, 6.5), xlim = c(0.5, 2.75), xlab = xlabel, ylab = "", main = title, lty = 3)
lines(density(Lambda_MLE_1), lty = 1, col="darkblue")
lines(density(T_statistic_2), lty = 3)
lines(density(Lambda_MLE_2), lty = 1, col = "darkblue")
legend(x = 'topright', lty = c(3,1), legend = c("T_statistic","Lambda_MLE"), cex = 0.75)

#creating and plotting the sampling distributions for the two methods

abline(v = c(1,2), col ="darkgreen") #adding the true values of lambda to the graph
text(x = c(1.5,2.5), y =c(0,0), label = "true value of lambda", col = "darkgreen")



## Question 2


ell <- function(x, lambda){
  sum(x*log(lambda) - log(factorial(x)) - lambda)
}
#Creating a function ell that is the log-likelihood
#estimator for the poisson distribution.

ell.x <- function(lambda){ -ell(xobs, lambda)}

#Negative so that optim maximises the expression.

init <- c(lambda = 0.5) #parameters to initialise optimisiation.

opt <- optim(par = init, fn = ell.x, method = "L-BFGS-B", upper = 2, lower = 0.1, hessian = TRUE)
#optim function maximises ell


lambdahat <- opt$par #the MLE found numerically by optim
nIhatopt <- opt$hessian[1, 1] #the ML observed fisher information found using optim 

Lopt <- lambdahat - qnorm(1-0.025)/sqrt(nIhatopt) #numerical lower bound
Uopt <- lambdahat + qnorm(1-0.025)/sqrt(nIhatopt) #numerical upper bound

round(c(L = Lopt, U = Uopt), 3) 

#Question 3

pp <- seq(from =  0.01, to = 1.5, length = 100001) #segments the interval
ll <- sapply(pp, function(i) -ell.x(i)) #calculates the log-likelihood at those points

plot(pp, ll, type ='l', main = "Log-likelihood function", xlab  = "Values for lambda", ylab = "", bty = "n")
abline(h = -ell.x(lambdahat) - 2, col = "red", lty = 2) #rule of thumb, Wilk's method
points(x = lambdahat, y = -ell.x(lambdahat))# the MLE for lambda


CI_lambda <- range(pp[ll > -ell.x(lambdahat)-2]) 
# finds the minimum and maximum of the set of values
# where the log-likelihood is more than the log-likelihood at the MLE-2.
round(CI_lambda, 3)

## Question 4

#the probability that P(X > 0) is equal to (1-P(X = 0)).

#the expectation of the indicator of X = 0 is equal to the probability that X = 0.
#Using this we can approach P(X = 0) using the weak law of large numbers.

p_0 <- sapply(1:N, function(i) mean(rpois(n, lambda = opt$par)==0))

#creates sampling data then uses WLLN to sample P(X=0).

sample_distribution <- density(1-p_0)
#the sample distribution of 
plot(sample_distribution, main = "distribution for the probability for P(X=0)", xlab = "", ylab = "")



max(sample_distribution$y)









