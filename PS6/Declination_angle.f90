module Declination_angle

implicit none

   contains      

   subroutine Dec_angle(N,A)
        implicit none   
        integer, intent(in)  :: N
        real, intent(out)    :: A
        real                 :: pi
        pi = 3.14
        A=23.45*sin(((N+284.)*360/365)*pi/180) 
    print*, "A is", A          
   end subroutine Dec_angle 
   
end module Declination_angle
