------------Bisection-------------
program main
    implicit none
    real f, x0, xmid, x1
    real tol
    tol = 0.05; x0 = 0.; x1 = 2.0;
    do while(abs(x1-x0) > tol)
        xmid = (x0+x1)/2
        print*, x0, xmid, x1
        if(f(x0)*f(xmid)<0) then
            x1= xmid;
        elseif(f(xmid)*f(x1)<0) then
            x0 = xmid;
        else
            print*, "No root"
            stop
        endif
    enddo
    print*, xmid
end program

real function f(x)
    f = x*x*x - x - 4
end function

/* or
real function f(x)
    f = x*x*x - 3*x - 1
end function
*/
