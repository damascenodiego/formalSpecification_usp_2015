; Formal Specification - Task 02
; Part 1) write a program to return the type of a triangle (invalid, equilateral, isosceles, scalene) given three lines
; prove correctness using z3
 
(declare-fun a () Real)
(declare-fun b () Real)
(declare-fun c () Real)
(declare-fun triang () Int)
(assert (or (and
                (> (+ a b) c) (> (+ b c) a) (> (+ a c) b)
                (> a 0) (> b 0) (> c 0))
          (= triang -1))) ; if( not valid ) return -1
(assert (or (not (and
          (> (+ a b) c) (> (+ b c) a) (> (+ a c) b) 
          (> a 0) (> b 0) (> c 0)))
          (not (and (= a b) (= a c))) ;; a==b && b==c (equilateral)
          (= triang 0))) ; if( equilateral ) return 0
(assert (or (not(and
          (> (+ a b) c) (> (+ b c) a) (> (+ a c) b) 
          (> a 0) (> b 0) (> c 0)))
          (and (= a b) (= a c)) ;; a==b && b==c (equilateral)
          (not (xor (= a b) (= a c) (= b c))) ;; (isosceles)
          (= triang 1)))  ; if( isosceles ) return 1
(assert (or (not(and
          (> (+ a b) c) (> (+ b c) a) (> (+ a c) b) 
          (> a 0) (> b 0) (> c 0)))
          (and (= a b) (= a c)) ;; a==b && b==c (equilateral)
          (xor (= a b) (= a c) (= b c)) ;; (scalene)
          (= triang 2)))  ; if( scalene ) return 2
;(assert (and (not (= a b c)) (= triang 0))) ; equilateral
;(assert (and 
;    (not (xor (= a b) (= a c) (= b c))) 
;    (= triang 1) )) ; isosceles
;(assert (and (or (= a b) (= a c) (= b c)) (= triang 2) )) ; scalene

(check-sat)
(get-model)
