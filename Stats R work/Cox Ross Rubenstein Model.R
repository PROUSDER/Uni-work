## Cox-Ross-Rubenstein model

CRR <-function(t,up,dwn, p, starting_price = 1){
  
  
  
  N_t <- cumsum(rbinom(t, 1, p))
  
  
  S_0 <- starting_price
  u <- up
  d <- dwn
  S_t <- NULL
  
  for(i in 1:t){
    S_t <- c(S_t, S_0*u^(N_t[i])*d^(i - N_t[i]))
  }
  
  ts.plot(log(S_t))
  ts.plot(log(S_t/S_0))
}


