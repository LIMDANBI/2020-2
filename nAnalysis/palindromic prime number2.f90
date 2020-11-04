
--------------- 내 알고리즘 (함수사용)-----------------
program main
    implicit none
    logical is_palindromic
    integer i, k
    logical is_prime
    is_prime = .true.

    do i=11, 10000, 2
        k=3
        do while(k < sqrt(float(i))+1)
            if(mod(i,k) .EQ. 0) is_prime = .false.
            k=k+2
        enddo
        if(is_prime) then
            if(is_palindromic(i)) then
                print*, i, 'is a palindromic prime number'
            endif
        endif
        is_prime = .true.
    enddo
end program

logical function is_palindromic(i)
    integer  tmp, tmp2
    is_palindromic = .false.
    if(i < 100) then
        if(i/10 .EQ. mod(i,10)) is_palindromic = .true.
    else if(i<1000) then
        tmp = i/100
        if(tmp .EQ. mod((i-tmp*100),10)) is_palindromic = .true.
    else
        tmp = i/1000
        tmp2 = (i - 1000*tmp)/100
        if(tmp .EQ. mod((i-1000*tmp-100*tmp2),10)) then
            if(tmp2 .EQ. ((i-1000*tmp)/10)) is_palindromic = .true.
        endif
    endif
end function
