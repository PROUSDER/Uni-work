## Financial maths Sheet 6

d_1 <- function(u, v, K, r, sigma){
  (log(u/K) + (r + (sigma^2)/2))/(sigma * sqrt(v))
}


d_2 <- function(u, v, K, r, sigma){
  (log(u/K) + (r - (sigma^2)/2))/(sigma * sqrt(v))
}

Pi_t <- function(r, sigma, S_0, K, Time){
  S_0*pnorm(d_1(S_0, Time, K, r, sigma)) - K*exp(-1*r*Time)*pnorm(d_2(S_0, Time, K, r, sigma))
}

sigma <- (1:1000000)/1000000
gg <- Pi_t(0.16, sigma, 38, 40, 1/2)

ts.plot(gg)
which.min(abs(gg - 4.25))
sigma[which.min(abs(gg -4.25))]