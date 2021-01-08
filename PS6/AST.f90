module AST

implicit none

   real, parameter :: pi = 3.14
   
contains      

   subroutine solar_time(N,Long,LST,AST)
   implicit none
   integer, intent(in)  :: N
   real, intent(in)     :: Long,LST
   integer, intent(out) :: AST
   real                 :: D,ET,LSTM
        D = (360*(N-81.)/365)*pi/180
        ET = 9.87*sin(2*D) - 7.53*cos(D) - 1.5*sin(D)
        LSTM = 15*(nint(Long/15))
        AST = LST + 4*(LSTM - Long) + ET
    print*, "AST is ", AST          
   end subroutine solar_time  
   
end module AST

! excellent work!
