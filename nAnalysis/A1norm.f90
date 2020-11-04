--------------------- my A1norm ------------------------
program main
    implicit none
    real A1norm
    real, allocatable, dimension(:,:) :: A
    integer M, N
    read*, M, N
    allocate(A(N, M))
    read*, A
    print*, A1norm (A, M, N)
end program

real function A1norm(A, M, N)
   integer i, j
   real sums
   dimension A(N, M)
   rmax = -1
   do i = 1, M
     sums = 0.
     do j = 1, N
        sums = sums + abs(A(j,i))
     enddo
     if(sums > rmax) rmax = sums
   enddo
   A1norm = rmax
end function
