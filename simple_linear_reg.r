# Code is executable in R session

head(cars)


plot(cars$speed,cars$dist, xlab = "Speed", ylab = "Distance")

hist(cars$speed)

linear_model <- lm(cars$dist ~ cars$speed) 


summary(linear_model)

scatter.smooth(x=cars$speed, y=cars$dist, main = "Plot of Speed over Distance",
               xlab = "Speed",
               ylab = "Distance")

speed <- coef(linear_model)[2]

print(paste0("We can expect an increase in distance of ", speed*2 ,
             " when speed is increased by 2, on average."))
