Pascal_triangle <- function(x){
  M <- matrix(nrow=x,ncol=x)
  for(i in 1:x){
    M[i,1] <- 1
    M[i,i] <- 1
  }
  for(a in 3:x){
    for(b in 2:x){
      M[a,b] <- M[a-1,b-1]+M[a-1,b]
    }
  }
  for(i in 1:x){
    M[i,1] <- 1
    M[i,i] <- 1
  }
  print(M)
}
Pascal_triangle(4)

