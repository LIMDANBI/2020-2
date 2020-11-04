--------------------- Mycos ------------------------
program main
    implicit none
    real mycos
    real x, eps
    read*, x, eps
    print*, "mycos is : ", mycos(x,eps), " library cos is ", cos(x)
end program

real function mycos(x, eps)
    integer k, flag
    real term, ans
    k = 1
    flag = 1
    term = 1
    ans = 0
    do while(abs(term)>eps)
        ans = ans + term*flag
        flag = -flag
        term = term*x*x/float(k)/float(K+1)
        k=k+2
    enddo
    mycos = ans
end function
