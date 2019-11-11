library(stats4)

## code produces MLE - Search for Maximum Likelihood Estimation for further information

'''
This question was an assignment problem looking for evidence
of a potentially biased die. A data set provided advises we have
observed 32 sixes in 100 rolls. This question asks us to answer
whether or not the die is actuall biased. All functions have
been created to compute this question directly. '''

# We essentially need to 'tack on' an unknown parameter, theta
# and observe the values that it takes. Ultimately, we assume
# it is zero under the null. 

log_likelihood <- function(theta) {
  ll <- 32 * log(theta + 1/6) + 68 * log(5/6-theta)
  return(-ll)
}


summary(mle(log_likelihood, start = list(theta = 1/12)))

# We can see that the output is approximately 15.33% with
# a std of 4.6%. As the confidence interval does not contain
# 0 we can conclude that the die is biased.
        
        
