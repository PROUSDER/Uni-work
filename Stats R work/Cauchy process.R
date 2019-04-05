### Cauchy process

# A Cauchy process is a Brownian motion subject to a Levy subordinator.

max_T <- 10000
X_0 <- 0
variance <- 1
time <- 0:max_T

change_pe_increment <- rnorm(n = length(time) - 1, sd = sqrt(variance))

X_t <- c(0,cumsum(daily_change))+X_0

plot(time, X_t, type = 'l', ylim = c(-max(abs(X_t))-1,max(abs(X_t)+1)))
max(abs(X_t))

