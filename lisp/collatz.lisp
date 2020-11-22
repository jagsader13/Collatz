#!/usr/bin/sbcl --script

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

(defvar num)
(defvar counter) 
(setf counter 0)               
(write-line "Enter the starting number: ")
(setq num (read))
(setf counter (getCollatz num counter))
(terpri)
(princ "A starting value of ")
(write num)
(princ " has ")
(write counter)
(princ " steps.")
(terpri)