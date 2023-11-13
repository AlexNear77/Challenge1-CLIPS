;; INITIAL STATE
; Hungry monkey
; Chair on floor
; Desk on floor
; Banana on ceiling
; monkey on floor
; monkey free hands
; monkey Far from objects
(assert (banana onCeiling))
(assert (monkey onFloor))
(assert (monkey hungry))
(assert (monkey handsFree))
(assert (monkey hasStrength)) ; la utilice pero solo una vez
(assert (monkey farFromChair))
(assert (monkey farFromDesk))
(assert (chair onFloor))
(assert (desk onFloor)) 
(assert (desk belowBanana)) ; no se usa pero no esta demas
