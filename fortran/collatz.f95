program collatz

  interface 
  function steps(i) result(ic)
    integer (kind=16) :: i
    integer (kind=16) :: ic
  end function
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
      actual=n
      pass=n
      ic=steps(pass)
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

function steps(i) result(ic)
    implicit none
    integer (kind=16) :: i
    integer (kind=16) :: ic

    do while ( i /= 1 )  
      if ( mod(i,2) == 0 ) then  
        i = i / 2
      else
        i = i * 3 + 1             
      endif
      ic = ic + 1                
    enddo

  end function steps

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