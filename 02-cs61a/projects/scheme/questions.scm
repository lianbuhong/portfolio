(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cadar x) (car (cdr (car x))))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

;; Problem 14
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 14
  (define (enumerate-helper s index)
    (cond
      ((null? s) '())
      (else (cons (list index (car s)) (enumerate-helper (cdr s) (+ index 1)))
    )
    )
  )
  (enumerate-helper s 0)
  ; END PROBLEM 14
)


;; Problem 15

;; Return the value for a key in a dictionary list
(define (get dict key)
  ; BEGIN PROBLEM 15
  (define (get-helper s)
    (if (null? s) 
      #f
      (if (eq? key (car (car s)) )
        (cadr(car s))
        (get-helper (cdr s))
      )
    )
  )
  (get-helper dict)
  ; END PROBLEM 15
  )

;; Return a dictionary list with a (key value) pair
(define (set dict key val)
  ; BEGIN PROBLEM 15
(define (set-helper s)
    (cond
      ((null? s) (list (list key val)))
      ((eq? key (car (car s))) (cons (list key val) (cdr s)))
      (else (cons (car s) (set-helper (cdr s))))))
  (set-helper dict)
  ; END PROBLEM 15
  )

;; Problem 16

;; implement solution-code
(define (solution-code problem solution)
  ; BEGIN PROBLEM 16
  (cond
    ((eq? problem '_____) solution)
    ((pair? problem) 
      (cons
        (solution-code (car problem) solution)
        (solution-code (cdr problem) solution)
      )
    )
    (else problem)
  )
  ; END PROBLEM 16
  )
