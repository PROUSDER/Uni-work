options(width = 65)

Theta <- c(0.25, 0.6)
pTheta <- c(0.5, 0.5)

LTheta <- Theta^8*(1-Theta)^4

m <- sum(LTheta*pTheta)
qTheta <- LTheta * pTheta / m
qTheta

Theta <- seq(from = 0, to = 1, by = 0.01)
pTheta <- rep(1/length(Theta), length(Theta))
LTheta <- Theta^8 * (1-Theta)^4
m <- sum(pTheta * LTheta)
qTheta <- LTheta * pTheta / m

plot(Theta, qTheta, pch = 16, main = 'Prior and posterior probabilities for theta', xlab = 'Values for Theta', ylab = 'Probability')
points(Theta, pTheta, pch = 1)
legend('topleft', legend = c('Prior','Posterior'), pch = c(1,16), lty = 0)

punif <- function(theta){
  ifelse(0 <= theta, ifelse(theta <= 1, 1, 0))
}
L <- function(theta){
  stopifnot(all(0 <= theta & theta <= 1))
  theta^8 * (1-theta)^4
}

ii <- integrate(f = function(theta) {
  L(theta) * punif(theta)
}, lower = 0, upper = 1)
ii

m <- ii$value
post <- function(theta){
  L(theta) * punif(theta) / m
}


tt <- seq(from = 0, to = 1, length = 101)
plot(tt, post(tt), type = 'l', lty = 1, lwd = 2, main = 'Prior and posterior probability density functions', xlab = 'values of theta', ylab = 'Probability density')
lines(tt, punif(tt),lty = 2, lwd = 2)
legend('topleft', legend = c('Prior', 'Posterior'), lty = c(2,1), lwd = 2)