library(tidyr)
library(dplyr)
library(ggplot2)

Mydata <- read.csv("Tyrannosaurus rex skeleton.csv",header = T)

anova <- aov(Oxygen ~ Bone, data = Mydata)
summary(anova)