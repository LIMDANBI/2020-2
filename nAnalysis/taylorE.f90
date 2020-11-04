program main
    implicit none
    real nconstant
    print*, nconstant(1.0, 1.e-6)
end program

real function nconstant(x, eps)
    real ans, term
    integer k
    ans = 0
    term =1
    k = 0
    do while(abs(term)>eps)
        ans = ans + term
        k=K+1
        term = term*x/float(k)
    enddo
    nconstant = ans
end function
