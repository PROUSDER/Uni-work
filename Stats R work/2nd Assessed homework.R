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

#creating sampling data, using the functions defined in the worksheet.

T_statistic_1 <- sapply(1:N, function(i) -log(mean(rpois(n, lambda) == 0)))
Lambda_MLE_1 <- sapply(1:N , function(i) mean(rpois(n, (lambda))))
# for lambda = 1 

T_statistic_2 <- sapply(1:N, function(i) -log(mean(rpois(n, 2) == 0)))
Lambda_MLE_2 <- sapply(1:N , function(i) mean(rpois(n, 2)))
 #for lambda = 2

title = "Sampling distributions for lambda = 1, and lambda = 2."
xlabel = "values of Lambda_MLE and T_statistic"

plot(density(T_statistic_1), ylim = c(0, 6.5), xlim = c(0.5, 2.75), xlab = xlabel , main = title, lty = 3)
lines(density(Lambda_MLE_1), lty = 1, col="darkblue")
lines(density(T_statistic_2), lty = 3)
lines(density(Lambda_MLE_2), lty = 1, col = "darkblue")
legend(x = 'topright', lty = c(3,1), legend = c("T_statistic","Lambda_MLE"), cex = 0.75)

##creating and plotting the sampling distributions for the two methods

abline(v = c(1,2), col ="darkgreen") #adding the true values of lambda to the graph
text(x = c(1.5,2.5), y =c(0,0), label = c("true value of lambda = 1","true value of lambda = 2"), col = "darkgreen")



## Question 2


ell <- function(x, lambda){
  -sum(x*log(lambda) - log(factorial(x)) - lambda
)}

#Creating a function ell that is the log-likelihood
#function for the poisson distribution.

ell.x <- function(lambda){ ell(xobs, lambda
)}

#creating a function ell.x, which is the observed log-likelihood
#from the data xobs.


init <- c(lambda = 0.5) 
#the initial parameters of ell.x to pass into the optim function.

lambda_hat <- optim(par = init, fn = ell.x, method = "L-BFGS-B", upper = 2, lower = 1e-2, hessian = T)
#maximises the log-likelihood function on observed data, for inital parameters lambda = 0.5 using the L-BFGS-B method.

print(lambda_hat)
#results show that 0.61 is the value of lambda that gives the maximum 
#under those conditions, as was expected.

#Now we are creating a 95% confidence interval about the ML estimate.

alpha <- 0.05
z.value <- qnorm(1-alpha/2)

#As the poisson distribution is a regular model,
#we can produce a asymptotically exact Wald confidence interval.

conf_upper_bound <- lambda_hat$par + z.value*(sqrt(lambda_hat$par)/sqrt(n))
conf_lower_bound <- lambda_hat$par - z.value*(sqrt(lambda_hat$par)/sqrt(n))

#Found by reordering the event
#{z_1-alpha/2 <= sqrt(n*fisher_info(lambda_hat))*(lambda_hat-lambda) <= z_alpha/2}

#plot(lambda_hat$par, ylim=c(0,1))
#lines(c(1,1), c(conf_lower_bound, conf_upper_bound), col=2, lty='dashed')

#so the interval is
print(paste('The interval is [', signif(conf_lower_bound), ',', signif(conf_upper_bound), ']'))

# Question 3

#We are now using the rule of thumb 

lambda <- seq(1e-2, 1, length = 10000)

log_likelihood_lambda <- sapply(lambda, function(i) -ell.x(i))

log_likehood_ML_lambda <- -ell.x(mean(xobs))-2

plot(lambda, log_likelihood_lambda, type = 'l')
abline(h = log_likehood_ML_lambda, col=2)

L <- sapply


















