# Poisson function and MLE plot

like.pois <- function(lambda, y) {
  like <- exp(-lambda) * lambda^y/factorial(y)
  return(like)
}

lambda.grid <- seq(0.001, 10, by = 0.01)

par(mfrow = c(2, 2))
plot(lambda.grid, like.pois(lambda.grid, 3), xlab = "lambda", ylab = "Like(lambda)",
     type = "l", main = "y=3")
abline(v = 3)
plot(lambda.grid, like.pois(lambda.grid, 4), xlab = "lambda", ylab = "Like(lambda)",
     type = "l", main = "y=4")
abline(v = 4)
plot(lambda.grid, like.pois(lambda.grid, 5), xlab = "lambda", ylab = "Like(lambda)",
     type = "l", main = "y=5")
abline(v = 5)
plot(lambda.grid, like.pois(lambda.grid, 6), xlab = "lambda", ylab = "Like(lambda)",
     type = "l", main = "y=6")
abline(v = 6)
