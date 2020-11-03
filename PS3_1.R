#data
Mydata <- read.csv("days.csv",head = T)

#plot
boxplot(Rainfall~Days, data=Mydata,
        main = "Cloud Seeding Experiment",
        col = "#8fb2c9",
        border = "#11659a")

#do a one-way anova to prove if seeding have an effect on rainfall 
anova <- aov(Rainfall ~ Days,data = Mydata)
summary(anova)