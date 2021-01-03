program Cal_SZA

use AST
use Declination_angle

implicit none

real    :: A, Long, LST, H, Lat, SZA
integer :: N, AST_r

!2.1
N=355
call Dec_angle(N,A)

!2.2
Long = 114.062996
LST = 875
call solar_time(N,Long,LST,AST_r)

!2.3
H = (AST_r-720)/4
Lat = 22.542883
SZA = ACOS(cos(Lat*pi/180)*cos(A*pi/180)*cos(H*pi/180)+sin(Lat*pi/180)*sin(A*pi/180)) *180/pi
write(*,*),"SZA is ",SZA

end program Cal_SZA
