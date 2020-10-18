Least_moves <- function(x){
  v <- vector(length = x+1)
  v[1] <- 0
  for(i in 2:x){
    v[i] <- v[i-1]+1
    if(i %% 2 == 0)  #注意R语言中取余数运算符:%%
    {
      v[i] <- min(v[i],v[i/2] + 1)
    }
  }
  print(v[x])
}
Least_moves(5)
# Least_moves(1) should be 0
#使用倒推法解决，没有用到combinations()、permutations()
