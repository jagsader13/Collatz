#!/usr/bin/sbcl --script

(defun collatz(value)
	(cond (( = (mod value 2) 0) 
		( + (collatz ( / value 2)) 1))
	((> value 1) (+ (collatz ( + ( * 3 value) 1)) 1 ))
	(t 0)))   

(defun arrange (array predicate)
  (do ((length (length array))
       (i 0 (1+ i)))
      ((eql i length) array)
    (do ((mindex i)
         (min (aref array i))
         (j i (1+ j)))
        ((eql j length)
         (rotatef (aref array i) (aref array mindex)))
      (when (funcall predicate (aref array j) min)
        (setf min (aref array j)
              mindex j)))))



(defvar numbers)
(defvar sequences)
(setf numbers (make-array '(10)))
(setf (aref numbers 0) 0) 
(setf (aref numbers 1) 0) 
(setf (aref numbers 2) 0) 
(setf (aref numbers 3) 0) 
(setf (aref numbers 4) 0) 
(setf (aref numbers 5) 0) 
(setf (aref numbers 6) 0) 
(setf (aref numbers 7) 0) 
(setf (aref numbers 8) 0) 
(setf (aref numbers 9) 0)
(setf sequences (make-array '(10)))
(setf (aref sequences 0) 0) 
(setf (aref sequences 1) 0) 
(setf (aref sequences 2) 0) 
(setf (aref sequences 3) 0) 
(setf (aref sequences 4) 0) 
(setf (aref sequences 5) 0) 
(setf (aref sequences 6) 0) 
(setf (aref sequences 7) 0) 
(setf (aref sequences 8) 0) 
(setf (aref sequences 9) 0)

(defvar ic)  

(loop for i from 1 to 400000
   	do (setf ic 0)
   	(setf ic (collatz i))

   (if (> ic (aref sequences 0))
    (progn
       (setf (aref sequences 0) ic)
	   (setf (aref numbers 0)  i)))

	(when (/= ic (aref sequences 0))
		(if ( < i (aref numbers 0))
			(setf (aref numbers 0) i) ))
		
)

(princ "Numbers")
(terpri)
(write numbers)
(terpri)
(princ "Sequences")
(terpri)
(write sequences)
(terpri)