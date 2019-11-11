# Code below is executable within R. It produces the Maximum Likelihood Estimation by way of the glm() function.
# I've also included a plot and histogram for visualisation purposes.



library(Sleuth3)
elephants <- case2201


head(elephants)

hist(elephants[,2], main="Histogram of Elephant Matings", xlab="Rate")

# Create the MLE for Poisson using glm and log-link
elephants.glm1 <- glm(Matings ~ Age, data = elephants, family = poisson(link = log))
summary(elephants.glm1)

# The age coefficient needs to exponentiated. This gives us the expected 
# average mating rate for each unit increase in Age over an 8 year period. 
X_coef <- exp(0.0689) - 1
lambda_obs <- exp(-1.5820+0.0687)

# An example for a 27 y.o elephant would be; 

e_27_rate <- exp(-1.5820+0.0687*27)-1

# Observed estimate of the mean successful matings for a 27 y.o male
# elephant is approximately 31% over an 8 year period

max(elephants$Age) # We can see that the maximum age for an elephant 
# in the data set is 52. We can plot the data to see how matings increase
# with age. 

plot(exp(-1.5820+0.0687*seq(1,50)),xlab = "Age", ylim = c(0,9),
     ylab = "Successful Matings", main="Poisson Distribution of Elephant Matings")

# Fitting the prediction algorithm

fm <- glm(Matings ~ Age, data = elephants, family = poisson(link = log))
(pred.LinearPredictor.scale <- predict(fm, newdata = data.frame(Age = c(25,
                                                                        45))))


(pred.Response.scale <- predict(fm, newdata = data.frame(Age = c(25,
                                                                 45)), type = "response"))



