# we install some packages

# we set the seed and install some packages

invisible(set.seed(999))
invisible(library(rjags, quietly = TRUE, warn.conflicts = FALSE))

# We load our data from the source
data <- read.table(file = "C:/Users/User/Documents/programming/Stats R work/datasets/DataSheet6/radon.txt", sep = '') 
# We convert our data to a data frame
data <- as.data.frame(data)

# we do some preprocessing on the data
county.list <- data[3]
data <- data[,c(1,2,4,5)]
head(data)
#we split the data based on if the house had a basement or not.
data_basement <- data[(data['floor'] == 1),]
data_floor <- data[(data['floor'] == 0),]


# We produce an intial values for the basement/first floor coefficients.
# Which by our model is the difference between the average of the basement and no basement readings 

beta <- NULL
for(i in 1:length(unique(data[3]))){
  beta0 <-c(beta, mean(data_basement[data_basement[,3] == i,1]) - mean(data_floor[data_floor[,3] == i,1])) 
}
beta0

# We define our model as shown on the accompanied sheet, and use non-informative priors

cat('
    model{
    for(i in 1:n){
    x[i] ~ dnorm(theta[c[i]] + beta * B[i], omega0^(-2))
    }
    for( j in 1:m){
    theta[j] ~ dnorm(alpha*uu[j], omega0.th^(-2))
    }
    alpha ~ dnorm(0, 0.001)
    beta ~ dnorm(beta0, 0.001)
    omega0 ~ dunif(0, 100)
    omega0.th ~ dunif(0, 100)
    }', file = 'radon.bug')

# we assign the data to the deterministic elements of the model
radon_data <- list(n = nrow(data), x = c(data[,1]), c = data[,3], B = data[,2], uu = unique(data[,4]), m = length(unique(data[,3])), beta0 = beta0 )

# we assign inital values to the stochastic elements of the model
radon_init <- list(alpha = 1, beta = beta0, omega0.th = 1, omega0 = 1, theta = rnorm(unique(data[,4])))

# We use jags to create the model
suppressMessages(log.radon <-jags.model('radon.bug', data = radon_data, init = radon_init))


# Our variables of interest are
log.radon.vars <- c("alpha", "beta", "omega0", "omega0.th", "theta")


# burn-out period
update(log.radon, n.iter = 10000, silent.jags = TRUE)

# We draw a sample after 20000 iterations of the model
sample <- coda.samples(log.radon, log.radon.vars, n.iter = 20000, silent.jags = TRUE)


# we set the plotting parameters to see if our burn-out period was a good choice.
par(mfrow = c(3,2))
pp <- NULL
for(i in 1:6){
  traceplot(sample[,i+5])
  pp <- c(pp, sample[,1+5])
}
# and the autocorrelations
autocorr.plot(pp, lag.max = 50)

average_log.radon <- NULL
observation_number <- NULL
for(i in 1:length(unique(data[,3]))){
  j <- data_basement[,3] == i
  # average with basement log.radon reading by county
  average_log.radon <- c(average_log.radon, mean(data_basement[j,1]))
  # number of with basement observations by county
  observation_number <- c(observation_number, nrow(data_basement[j,]))
}
par(fig = c(0,0.8,0,1), new = FALSE)
plot(x = observation_number, y = average_log.radon, type = 'p', xlab = 'number of observations', main = 'Naive median log radon against number of observations')
minnesota_radon <- median(data_basement[,1])
abline(h = minnesota_radon)
par(fig = c(0.6,1,0,1), new = TRUE)
boxplot(average_log.radon, horiz = TRUE, axes = FALSE)

# we find the average for the values of alpha and beta from our MCMC simulation
est.alpha <- mean(sample[,1][[1]])
est.beta <- mean(sample[,2][[1]])
# We use the recorded uranium levels and our estimated value to estimate theta
est.theta <- est.alpha * unique(data[,4])
# We use our estimated parameters to estimate a mean for log.radon for each county
est.log.radon <- est.theta + est.beta
# and a estimated mean for the state
est.minnesota_radon <- median(est.log.radon)
par(fig = c(0,0.8,0,1), new = FALSE)
plot(y = est.log.radon, observation_number, xlab = 'number of observations', main = 'MCMC median log radon against the number of observations' )
abline(h = est.minnesota_radon)
par(fig = c(0.6,1,0,1), new = TRUE)
boxplot(est.log.radon, horiz = TRUE, axes = FALSE)

print(paste("We make a prediction of ", est.minnesota_radon, " for the log.radon in Minnesota."))

# cook uranium reading
cook.uu <- -0.504995982525783
# estimated readings
est.cook_firstfloor <- est.alpha*cook.uu 
est.cook_basement <- est.cook_firstfloor + est.beta
print(paste("The estimated log radon for a house in Cook with a basement is", 
            est.cook_basement, ". The estimated log radon for a house in Cook with no basement is"
            , est.cook_firstfloor, "."))