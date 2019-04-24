### Is a p-value a conditional probability? Yes, it is.

set.seed(1)

sample_1 <- rpois(20, lambda=5) ### sample 20 obs from a distribution with a population mean of 5

mean(sample_1) ## 5.55 is my sample mean

### can I reject the null that lambda = 5 because my sample mean is "very big"?
### given the null hyptothesis is true, what's the probability of sampling a mean 5.55 or higher?
### via simulation, we can repeatedly sample 20 obs from the population (assuming the null is true)

vector_of_means <- sapply(1:10000, function(x){
  set.seed(x)
  
  sample_x <- rpois(20, lambda=5) ## assume null is true
  
  return(mean(sample_x))
  
}

  )

### although the population distribution is non-normal
### the sampling distribtuion of the mean is normal
### via Central Limit Theorem (CLT)

hist(vector_of_means)

### Given the null is true, what's the probability that a sample mean is >= 5.55?

sum(vector_of_means >= 5.55) / length(vector_of_means) ## 0.1482, this is a frequentist probability

### Conclusion, I cannot reject the null hypothesis (with 90% confidence) that the population parameter is equal to 5.

### Alternatively, rather than a simulation, you could run a one-sided t-test

t.test(sample_1, alternative = "greater", mu=5) ## p-value = 0.1497

### Wow, t.test and simulation gave the almost the same p-values. Not an accident.

