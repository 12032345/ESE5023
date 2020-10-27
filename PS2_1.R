library(dplyr)
library(tidyr)
#1.1
Sig <- read.csv(file = "C:/Users/user/Documents/signif.txt", header = T,sep="\t")
Sig_Eqs <- as_tibble(Sig)

#1.2
Sig_Eqs %>%
  select(COUNTRY,DEATHS) %>%
  group_by(COUNTRY) %>%
  summarize(totoldeaths = sum(DEATHS)) %>%
  arrange(desc(totoldeaths))

#1.3
Sig_Eps_table <- Sig_Eqs %>%
  select(YEAR,EQ_PRIMARY) %>%
  filter(EQ_PRIMARY > 6.0)
totol_earthquakes <- table(Sig_Eps_table$YEAR) #table()的输出可以看成是一个带名字的数字向量。可以用names()和as.numeric()分别得到名称和频数
plot(totol_earthquakes)
# @MingYANG  
# your answer is right, but make a plot like this is not recommended. Abscissa cannot be identified because of the dense numbers
# try this: plot(names(totol_earthquakes), as.numeric(totol_earthquakes)，type="l")

#1.4
#1.4.1 function
CountEq_LargestEq <- function(x){
  CountEq <- table(Sig_Eqs$COUNTRY)
  CountEq2 <- as_tibble(as.data.frame(CountEq))
  CountEq3 <- CountEq2 %>%
    filter(Var1 == x) 
  ## MingYANG
  ## this is quite vaque for understanding your purpose
  ## you didn`t use the data above, and you`d better delete it
  a <- Sig_Eqs %>%
    unite(date,YEAR,MONTH,DAY,sep = "-",remove = FALSE) %>%
    select(date,EQ_PRIMARY,COUNTRY) %>%
    group_by(COUNTRY) %>%
    summarise(date = date,largeEq=max(EQ_PRIMARY)) %>%
    filter(is.na(largeEq)==FALSE) %>%
    filter(COUNTRY == x)
  out <- list(CountEq3$Freq,a$date)
  return(out)
}
# MingYANG
# your answer is not right
# TRY THIS BELOW:
# 1.4 workable code for reference 
CountEq_LargestEq<-function(country){
  Number_Eq<-Sig_Eqs%>% 
    filter(COUNTRY==country)%>% 
    nrow()
  Max_Eq<-Sig_Eqs%>%
    filter(COUNTRY==country)%>% 
    filter(EQ_PRIMARY==max(EQ_PRIMARY,na.rm=T))%>% 
    mutate(date=paste(YEAR,MONTH,DAY,sep="-"))%>% 
    pull(date)
  list<-list(Number_Eq,Max_Eq)
  return(list)
}

#CountEq_LargestEq("ANTARCTICA")  test for the function
#1.4.2 apply the function to each country
b <- Sig_Eqs %>%
  group_by(COUNTRY)%>%
  summarise(max=max(EQ_PRIMARY))
country <- b$COUNTRY
for (i in country){
  CountEq_LargestEq(i)
}
#1.4.3using a Matrix to report the results in a descending order
i=1
M<-matrix(ncol = 3,nrow = length(unique(Sig_Eqs_noNA$COUNTRY)))
for(Country in unique(Sig_Eqs_noNA$COUNTRY)){
  M[i,]<-c(as.character(Country),
                as.numeric(CountEq_LargestEq(Country)[1,1]),
                as.character(CountEq_LargestEq(Country)[1,2]))
  i=i+1
}
Result <- M[order(as.numeric(newMat[,2]),decreasing=T)]
Result
