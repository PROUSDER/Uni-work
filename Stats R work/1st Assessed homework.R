# 1st Question
dlaplace<-function(x, mu, b, log.p=FALSE)
  {
    if(!(isTRUE(log.p))) #calculating the normal density 
      {(0.5*b)*exp((abs(x-mu))/(-b))}
    if(isTRUE(log.p)) #calculating the log density
      {(-(log(2*b)+(abs(x-mu))/b))}
    
}

# 2nd Question

b.l.likelihood.graph <- function(b, mu, x){
  title = paste('b = ',b) # creates the title for the graph
  b.likelihood <- 1:length(mu) # creates a vector with the same number of entries as mu has
  
  for(i in 1:length(mu)){b.likelihood[i] <- (ell(mu[i], b, x))} #for each mu in the interval this calculates the likelihood
  plot(mu, b.likelihood, main = title ,type='l') 
}

ell <- function(mu, b, x){
  return(sum(-log(2*b)-(abs(x-mu))/b)) #fix this  #calculates the log likelihood for an observation of x
}

#3rd question
