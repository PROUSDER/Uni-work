N <- 10000
current_price <- 50
volatility <- 1
days_held <- 0:N

daily_change <- rnorm(n = length(days_held) - 1, sd = sqrt(volatility))

price <- c(0,cumsum(daily_change))

plot(days_held, price, type = 'l', ylim = c(-max(abs(price))-1,max(abs(price)+1)))
max(abs(price))
