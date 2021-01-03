subroutine Matrix_multip(M,N,O)
                implicit none
                integer::i,j,k
                real(4)::r
                real,dimension(4,3),intent(in)::M
                real,dimension(3,3),intent(in)::N
                real,dimension(4,3),intent(out)::O      
        !M * N
                do i=1,4        
                        do j=1,3
                        r=0
                                do k=1,3
                                        r=r+(M(i,k) * N(k,j))
                                end do
                        O(i,j)=r
                        end do
                end do
        end subroutine  Matrix_multip
