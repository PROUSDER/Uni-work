#Generalised likelihood ratio test statistic
#from data on the Montana Business Outlook Survey

residents <- c(58,64,67)
#data given as a table in the example

#supposing these are uniformly distributed => _P_0 = (1/3, 1/3, 1/3)
expected_residents <- mean(residents)

T_pearson <- sum(sapply(residents, function(i) (i-expected_residents)^2))/expected_residents

#this gives a value of 0.66667
#now we to choose a significane value and test the hypothesis for that value

#with an alpha of 0.05, we now test the hypothesis.
#as T_pearson is convergent in distribution to chi squared(m-1), we can use this distribution to test the hypothesis.

alpha = 0.05

p_value <- pchisq(T_pearson, df = (length(residents)-1), lower.tail = FALSE)
print(p_value)

