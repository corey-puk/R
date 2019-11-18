# need stats4 first - if you do not have this available, download using install.packages()
# code will be immediately executable upon loading of the stats4 package
library(stats4)

library(Sleuth3)
donner <- case2001
donner <- within(donner, {
  Surv <- as.numeric(Status) - 1 ## Died -> 0, Survived -> 1
  SexN <- as.numeric(Sex) - 1 ## Female -> 0, Male -> 1
})


# bernoulli (logistic regression) MLE 


donner.neg.ll <- function(beta0, beta1, beta2) {
  tmp <- beta0 + beta1 * donner$Age + beta2 * donner$SexN
  ll <- sum(donner$Surv * tmp - log(1 + exp(tmp)))
  -ll
}


# use mle function to maximise 
summary(mle(donner.neg.ll, start = list(beta0 = 0, beta1 = 0, beta2 = 0)))



donner.neg.ll <- function(beta0, beta1, beta2) {
  tmp <- beta0 + beta1 * donner$Age + beta2 * donner$SexN
  p <- 1/(1 + exp(-tmp))
  ll <- sum(dbinom(donner$Surv, 1, p, log = TRUE))
  return(-ll)
}


summary(glm(Surv ~ Age + Sex, donner, family = binomial(link = logit)))


# As this is a logistic regression be mindful that immediate interpretation of the coefficients is in terms of 'likelihoods'
# and that you must exponentiate the coefficient to be able to interpret, as it is currently linked via a log-link 





