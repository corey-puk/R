# I will upload the file as 'drunk_data.csv'
# The project was based on an old paper that analysed whether drunk individuals tend to fall toward their dominant side or if, in fact
# it was random.. The actual paper has its origins in Brownian Motion
# Below is some code that produces a simple pie graph and looks at the proportions of where individuals ended up based on how intoxicated they were


setwd("<your path to file>")

install.packages("ggplot2")
library("ggplot2")

data <- read.csv("drunk_data.csv", sep = ",", header = TRUE)


heavy <- sum(data$Heavy)
moderate <- sum(data$Moderate)
slightly <- sum(data$Slight)


df <- data.frame(
  group = c("Heavy", "Moderate", "Slightly"),
  value = c(heavy, moderate, slightly)
)



bar <- ggplot(df, aes(x="",y=value, fill=group))+
  geom_bar(width=1, stat="identity")

pie <- bar + coord_polar("y", start=0)
pie <- pie + labs(x=NULL, y=NULL, fill=NULL, title = "End (By Group)")

pie = pie + theme_classic() + theme(axis.line = element_blank(),
                                    axis.text = element_blank(),
                                    axis.ticks = element_blank(),
                                    plot.title = element_text(hjust = 0.5, color = "#666666"))


df2 <- data[,-5]

pie
