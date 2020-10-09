x1 <- sample(1:50,50)
x2 <- sample(1:50,50)#I got inspired by reading https://www.runoob.com/r
M1 <- matrix(x1,nrow=5,ncol=10)
M2 <- matrix(x2,nrow=10,ncol=5)
M3 <- matrix(data = 0,nrow=5,ncol=5)
for(x in 1:5){
  for(y in 1:5){
    for(z in 1:10){
      M3[x,y] <- M3[x,y]+M1[x,z]*M2[z,y]
    }
  }
}
M4 <- M1%*%M2

