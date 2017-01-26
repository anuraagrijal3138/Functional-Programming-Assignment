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