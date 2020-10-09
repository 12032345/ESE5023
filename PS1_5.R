nums <- c(1,2,3,4,5,6,7,8,9)     #思路参考https://bbs.csdn.net/topics/390592099
sum <- 0
Find_expression <- function(x){  #遍历所有可能，找出符合条件的表达式
  for(o in 1:3^8){
    buffer <- "1"
    result <- 0
    temp <- nums[1]
    for(i in 1:8){
      bit <- (o%/%(3^(i-1))) %% 3
      if(bit == 0){
        buffer <- paste(buffer,"+",sep = "")
        result <- result + temp
        temp <- nums[i+1]
      }
      else if(bit == 1){
        buffer <- paste(buffer,"-",sep = "")
        result <- result + temp
        temp <- -nums[i+1]
      }else{
        if(temp > 0){
          temp <- 10*temp + nums[i+1]
        }else{
          temp <- 10*temp - nums[i+1]
        }
      }
      buffer <- paste(buffer,nums[i+1],sep = "")
    }
    result <- result + temp
    buffer <- paste(buffer, "=",sep = "")
    buffer <- paste(buffer,result,sep = "")
    
    if(result == x){
      print(buffer)
    }
  }
}
Total_solutions <- function(x){  #计算符合条件的表达式的个数
  for(o in 1:3^8){
    buffer <- "1"
    result <- 0
    temp <- nums[1]
    for(i in 1:8){
      bit <- (o%/%(3^(i-1))) %% 3
      if(bit == 0){
        buffer <- paste(buffer,"+",sep = "")
        result <- result + temp
        temp <- nums[i+1]
      }
      else if(bit == 1){
        buffer <- paste(buffer,"-",sep = "")
        result <- result + temp
        temp <- -nums[i+1]
      }else{
        if(temp > 0){
          temp <- 10*temp + nums[i+1]
        }else{
          temp <- 10*temp - nums[i+1]
        }
      }
      buffer <- paste(buffer,nums[i+1],sep = "")
    }
    result <- result + temp
    buffer <- paste(buffer, "=",sep = "")
    buffer <- paste(buffer,result,sep = "")
    
    if(result == x){
      sum <- sum + 1
    }
  }
  print(sum)
}
Find_expression(50)
Total_solutions(50)      #使用暴力解法，没有用到排列组合