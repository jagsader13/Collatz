program collatz

  interface 
  subroutine steps(i,val)
    integer (kind=16) :: i
    integer (kind=16) :: val
  end subroutine
  end interface

  interface 
  SUBROUTINE Bubble_Sort(a)
    integer (kind=16), dimension(10) :: a
    INTEGER (kind=16) :: i, j,temp
    LOGICAL :: swapped
  END SUBROUTINE 
  end interface

    integer (kind=16):: ic,n,a,b,actual,pass
    integer (kind=16):: maxIndex
    integer (kind=16), dimension(10) :: numbers
    integer (kind=16), dimension(10) :: sequences
    numbers = (/0,0,0,0,0,0,0,0,0,0/)
    sequences = (/0,0,0,0,0,0,0,0,0,0/)
    maxIndex=5e9
    
    do n=1, maxIndex
      ic=0
      actual=n
      pass=n
      call steps(pass,ic)
      if(ic .gt. sequences(1)) then
        sequences(1)=ic
        numbers(1)=actual
      else if (ic .eq. sequences(1)) then
        if(actual .lt. numbers(1)) then
          numbers(1)=actual
        end if
      end if
      call Bubble_Sort(numbers)
      call Bubble_Sort(sequences)
    end do
   
    Print *, "Numbers"

    do a = 1, 10
      print*, numbers(a)
   enddo
   
   print *, " "
   Print *, "Sequences"

  do b = 1, 10
   print*, sequences(b)
  enddo

  print *, " "

end program collatz

recursive subroutine steps(i, val)

integer(kind = 16) :: i
integer(kind = 16) :: val

if ( i /= 1 ) then
        if(mod(i, 2) == 0) then     
                call steps((i / 2), val)
        endif

        if(mod(i, 2) /= 0) then
                call steps(((3 * i) + 1), val)
        endif
        val = val + 1;
else
        val = 0
        return
endif

end subroutine steps


  SUBROUTINE Bubble_Sort(a)
    integer (kind=16), dimension(10) :: a
    INTEGER (kind=16) :: i, j, temp
    LOGICAL :: swapped
   
    DO j = SIZE(a)-1, 1, -1
      swapped = .FALSE.
      DO i = 1, j
        IF (a(i) > a(i+1)) THEN
          temp = a(i)
          a(i) = a(i+1)
          a(i+1) = temp
          swapped = .TRUE.
        END IF
      END DO
      IF (.NOT. swapped) EXIT
    END DO
  END SUBROUTINE Bubble_Sort