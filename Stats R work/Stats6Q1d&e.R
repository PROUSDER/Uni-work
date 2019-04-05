
n <- 100
lambda <- 3.3
N <- 10000


estimates <- sapply(1:N, function(i) median(rexp(n, rate = lambda)))
mhat_observations <- sapply(1:N, function(i) -(log(0.5)*mean(rexp(n, rate = lambda))))
#estimators from (1b) and (1c)

true_median <- -(log(0.5)/lambda) #Calculating the true median from work in (1a)


sample_median <- density(estimates, from = 0)
MLE_median <- density(mhat_observations, from = 0)

title <- paste('estimators of the median n = ', n )

plot(sample_median, ylim = c(0,22), xlim = c(0,0.65), lty = 2, lwd = 2, main = title, xlab = 'values of the median')
legend("topright", legend = c("Using sample median","Using ML estimator"), lty = c(3,2))
lines(MLE_median, lty = 3, lwd = 2)
abline(v = true_median, col ='darkgreen')
text(true_median, 0, labels ="True value", pos = 4, col = "darkgreen")
