profile_text <- read.csv("boxchart_data.csv",header=T, row.names=1)

library(ggplot2)
library(reshape2)
data_m <- melt(profile_text)
head(data_m)

p <- ggplot(data_m, aes(x=variable, y=value),color=variable) + 
  geom_boxplot(aes(fill=factor(variable))) + 
  theme(axis.text.x=element_text(angle=50,hjust=0.5, vjust=0.5)) +
  theme(legend.position="none")

p
