program main
    implicit none
    integer i, k, tmp, tmp2
    logical is_prime
    is_prime = .true.

    do i=11, 10000, 2
        k=3
        do while(k < sqrt(float(i))+1)
            if(mod(i,k) .EQ. 0) is_prime = .false.
            k=k+2
        enddo
        if(is_prime)then
            if(i < 100) then
                if(i/10 .EQ. mod(i,10)) print*, i, 'is a palindromic prime number'
            else if(i<1000) then
                tmp = i/100
                if(tmp .EQ. mod((i-tmp*100),10)) print*, i, 'is a palindromic prime number'
            else
                tmp = i/1000
                tmp2 = (i - 1000*tmp)/100
                if(tmp .EQ. mod((i-1000*tmp-100*tmp2),10)) then
                    if(tmp2 .EQ. ((i-1000*tmp)/10)) print*, i, 'is a palindromic prime number'
                endif
            endif
        endif
        is_prime = .true.
    enddo
end program
