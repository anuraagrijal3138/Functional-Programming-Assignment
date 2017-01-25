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
