;logic: recursive cdr and car. append 
(DEFINE (reverse-general L)
        (COND
           ((NULL? L) L)  ;case to break recursion
           (ELSE 
                (IF  (LIST? (CAR L)) ;check there is list inside the list
                
                     ( append  (reverse-general (CDR L)) ;for list inside the list
                               (list(reverse-general (CAR L))) 
                               )
                              
                  
                     (append (reverse-general (CDR L)) ;else case
                             (list (CAR L))            
                             )
                      )
                 )
             )
          )

(DEFINE (sum-up-numbers-simple L)
        (COND
        ((NULL? L) 0)
        ((NUMBER? (CAR L)) (+ (CAR L) (sum-up-numbers-simple (CDR L)))) 
        (ELSE (+ 0 (sum-up-numbers-simple (CDR L))))
           )
      )

(DEFINE (sum-up-numbers-general L)
        (COND
        ((NULL? L) 0)
        ((NUMBER? (CAR L)) (+ (CAR L) (sum-up-numbers-general (CDR L))))
        ((LIST? (CAR L)) (+ (sum-up-numbers-general (CAR L)) (sum-up-numbers-general (CDR L))))
        (ELSE (+ 0 (sum-up-numbers-simple (CDR L)))
           )
        )
      )

;Supporting function to get min value in a list
(DEFINE (get-min L)
        (COND
        ((NULL? (CDR L)) (CAR L))
        (ELSE
        (MIN (CAR L) (get-min (CDR L)))
        )))

;supporting function to ignore letters
(DEFINE (ignore-char L)
        (COND
        ((NULL? L) '())
        ((NUMBER? (CAR L)) (CONS (CAR L) (ignore-char (CDR L))))
        (ELSE
        (ignore-char (CDR L)))
        ))

;supporting function that returns a list of numbers in a list which are greater than a given number
(DEFINE (great-list L1 L2)
        (COND
        ((NULL? L2) '())
        ((> (CAR L2) L1) (CONS (CAR L2) (great-list L1 (CDR L2))))
        (ELSE
        (great-list L1 (CDR L2))
        )))

;main function min-above-min
(DEFINE (min-above-min L1 L2)
        (COND
        ((NULL? (ignore-char L1)) #F)
        ((NULL? L2) (get-min (ignore-char L1)))
        (ELSE
        (get-min(great-list (get-min (ignore-char L2)) (ignore-char L1)))
        )))
