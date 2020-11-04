--------------------- MaxElement ------------------------
program main
    implicit none
    real MaxElement
    real, allocatable, dimension(:,:) :: A
    integer N
    read*, N
    allocate(A(N, N))
    read*, A
    print*, "Max element is ", MaxElement (A, N)
end program

real function MaxElement(A, N)
   dimension A(N, N)
   integer i
   real rmax
   rmax = A(1,1)
   do i = 1, N
    if(A(i,i)>rmax) rmax = A(i,i)
    // or // if(A(i,i) .GT. rmax) rmax = A(i,i)
   enddo
   MaxElement = rmax
end function
