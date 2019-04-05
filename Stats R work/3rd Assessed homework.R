### Louis Forbes Wright lf16177

##  Stats computer practical 3

# Q1

# We will input the data first

library(datasets)
data("morley")
lightspeed <- morley$Speed

# We now test the hypothesis as given in the question using Pearson's 
# Goodness of Fit with significance approximately 95%.

n <- length(lightspeed)
breaks <- c(-Inf, seq(from = 745, to = 945, by = 50), Inf)
Obs <- table(cut(lightspeed, breaks))
Obs

# We are testing if these are observations come
# from independent identical normal distributions.

# We use the MLEs for the normal distribution to remove the need to numerically optimise

mu.hat <- mean(lightspeed)

sigma.hat <- sum((lightspeed - mu.hat)^2)/n

# now we can find the 

plamhat <- pnorm(breaks[-1], mean = mu.hat, sd = sqrt(sigma.hat)) - pnorm(breaks[-length(breaks)], mean = mu.hat, sd = sqrt(sigma.hat)) 
round(plamhat, 3)

Exp <- n * plamhat
round(cbind(Obs = Obs, Exp = Exp), 1)

tstat <- sum(((Obs - Exp)^2)/Exp)
tstat
# tstat will approach a chi-squared as we use more data. So we can bound the p-value.
# the dimension of THETA is 2

pval1 <- pchisq(tstat, df = 3, lower.tail = FALSE)
pval2 <- pchisq(tstat, df = 5, lower.tail = FALSE)

round(c(pval1, pval2), 3)
