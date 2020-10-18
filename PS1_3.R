Pascal <- function(x) {  #帕斯卡三角
  lapply(0:x, function(i) choose(i, 0:i)) #参考https://blog.csdn.net/the_sad_of_night/article/details/82803882?utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-2.channel_param&depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-2.channel_param
}
Pascal_triangle <- function(x){  #打印第x行
  print(Pascal(x)[x])
}
Pascal_triangle(100)
  # it is really good for a researcher to use various useful tools to improve your work efficiency
  # but as a student, it is essential to know the basic principle，and write it by yourself
  # moreover, this is an introductory course for programing, the most important part is to:
  #   1   learn thinking a realistic problem with programing perspection
  #   2   coding by yourself to solve this problem
