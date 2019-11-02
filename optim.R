## This was a project that looked at the pregnancy rates between smokers and non-smokers using Maximum Likelihood Estimation of a 
# hypergeometric distribution (negative binomial). I will also upload the pregnancies file for others to use.

setwd("<your file path>")

data <- read.csv("pregnancies.csv", sep = ",", header = TRUE)

library(stats4)

rep <- rep(1:13, c(29,16,17,4,3,9,4,5,1,1,1,3,7))
idk <- mean(rep)*length(rep)

rep2 <- rep(1:13, c(198,107,55,38,18,22,7,9,5,3,6,6,12))
idk2 <- mean(rep2)*length(rep2)

smoke_like <- function(p) {
  like <- (1-p)**(idk-100)*p**100
  return(like)
}

smoke_log_like <- function(p) {
  log_like <- (idk - 100) * log(1-p) + 100 * log(p)
  return(log_like)
}

minus_smoke <- function(p) {
  minus_s <- -smoke_log_like(p)
  return(minus_s)
}

nonsmoke_like <- function(p) {
  like <- (1-p)**(idk2-486)*p**486
  return(like)
}

nonsmoke_log_like <- function(p) {
  log_like <- (idk2 - 486) * log(1-p) + 486 * log(p)
  return(log_like)
}

minus_nonsmoke <- function(p) {
  minus_s <- -nonsmoke_log_like(p)
  return(minus_s)
}


(res <- summary(mle(minus_smoke, start = list(p=0.2))))
(res2 <- summary(mle(minus_nonsmoke, start = list(p=0.3))))


p <- seq(0.001, 0.99, length = 10000)
loglik <- smoke_log_like(p)
logrl <- loglik - max(loglik)
range(p[logrl > -1.92])

p2 <- seq(0.001, 0.99, length = 10000)
loglik2 <- nonsmoke_log_like(p)
logrl2 <- loglik2 - max(loglik2)
range(p[logrl2 > -1.92])

