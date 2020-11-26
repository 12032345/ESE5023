#6.1
library(MASS)
library(leaps)

data(cpus)
sample_index <- sample(nrow(Boston),nrow(Boston)*0.80)
cpus_train <- cpus[sample_index,]
cpus_test  <- cpus[-sample_index,]
subset_result <- regsubsets(perf ~ syct+mmin+mmax+cach+chmin+chmax, data=cpus_train, nbest=2, nvmax = 7)
plot(subset_result, scale="bic")
summary(subset_result)

#6.2
bestmodel <- lm(perf ~ syct+mmin+mmax+cach+chmax, data=cpus_train) 
summary(bestmodel)

perf_p <- predict(bestmodel,cpus_test)
#caculate the mean bias
mean(perf_p) - mean(cpus_test$perf)

# good work
