(declare-const a Int) ; a value
(declare-const b Int) ; b value
(declare-const c Int) ; c value
(declare-fun gcd (Int Int) Int)
(declare-fun gcd3 (Int Int Int) Int)

; gcd(a,b,c) == gcd(a,gcd(b,c))
(assert (= (gcd3 a b c) (gcd a (gcd b c)) ) )

; REFERS TO gcd(b,c)
(declare-const a1 Int)
(declare-const b1 Int)
(assert (and (= a1 b) (= b1 c)))
(declare-const ifb0 Bool)
(assert 
 (ite (= b1 0)
  (and (= ifb0 true) (= a1 (gcd a1 b1)))
  (and (= ifb0 false) (= (gcd a1 b1) (gcd b1 (mod a1 b1))))))
(assert (= ifb0 true))  ; covers "return a" coverage

; REFERS TO gcd(a,gcd(b,c))
(declare-const a2 Int)
(declare-const b2 Int)
(assert (and (= a2 a) (= b2 (gcd a1 b1))))
(declare-const ifb1 Bool)
(assert 
   (ite (= b2 0) 
      (and (= ifb1 true) (= a2 (gcd a2 b2)))  
      (and (= ifb1 false) (= (gcd a2 b2) (gcd b2 (mod a2 b2))))))
(assert (= ifb1 false)) ; covers "gcd(a,gcd(b,c))" coverage

(assert (and ; assures gcd is divisor
   (= 0 (mod b (gcd b c)))
   (= 0 (mod c (gcd b c)))
   (= 0 (mod a (gcd3 a b c)))
   (= 0 (mod b (gcd3 a b c)))
   (= 0 (mod c (gcd3 a b c)))))

(check-sat)
(get-model)

