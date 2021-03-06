#!/usr/bin/sbcl --script

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


(defun getCollatz (start seqSize)
	(setf seqSize 0)
	(loop while (not(eq start 1)) do
		(if (eq (mod start 2) 0)
			(setf start (/ start 2))
			(setf start (+ (* 3 start) 1))
		)
		(setf seqSize (+ seqSize 1 ))
	)		
	(return-from getCollatz seqSize))


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
   	(setf ic (getCollatz i ic))

   (if (> ic (aref sequences 0))
    (progn
       (setf (aref sequences 0) ic)
	   (setf (aref numbers 0)  i)))

	(when (/= ic (aref sequences 0))
		(if ( < i (aref numbers 0))
			(setf (aref numbers 0) i) ))
	;(arrange numbers true)
	;(arrange sequences true)
)

(princ "Numbers")
(terpri)
(write numbers)
(terpri)
(princ "Sequences")
(terpri)
(write sequences)
(terpri)