#option pricing based on Black-Scholes Formula

current_stock_price <- 50
time_until_option_expires <- 720
Option_strike_price <- 5
Risk_free_interest_rate <- 3
implied_volatility <- 3

S <- current_stock_price
t <- time_until_option_expires
K <- Option_strike_price
r <- Risk_free_interest_rate
s <- implied_volatility

d_1 <- (log(S/K)+(r+(s^2)/2)*t)/(s*sqrt(t))
d_2 <- d_1 - s*sqrt(t)

C <- S*pnorm(d_1)-pnorm(d_2)*K*exp(-r*t)


##

N <- 10000

daily_change <- rnorm(n = length(1:time_until_option_expires) - 1, sd = sqrt(implied_volatility))

change_in_price <- c(0,cumsum(daily_change))
daily_price <- change_in_price + current_stock_price
 

plot(1:time_until_option_expires, daily_price, type = 'l', ylim = c(min(daily_price)-1,max(daily_price)+1), xlab = "days", ylab = "price")
abline(h = C, col=2, lty = 2)
