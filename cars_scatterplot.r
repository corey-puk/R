head(data)
install.packages("ggplot2")
library(ggplot2)
install.packages("ggrepel")
library("ggrepel")


cars <- mtcars


plot(cars)


plot(cars$wt,cars$hp)

# ggplot library allows us to create ggplot objects. We're then able to use gg methods.

p <- ggplot(cars, aes(x=wt, y=hp)) + geom_point() + geom_label_repel(label=rownames(cars), label.padding = unit(0.15,"lines"), label.size = 0.001) + labs(y = "Total Horsepower",
                          x = "Weight (Tonnes)")

p # call p 

