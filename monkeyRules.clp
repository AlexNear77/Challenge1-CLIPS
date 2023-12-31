(defglobal ?*plan_de_accion* = (create$))

(defrule r1 
    (monkey farFromChair) 
    ?fact <- (monkey farFromChair)
    => 
    (printout  t "monkey goes to the chair" crlf) 
    (assert (monkey nearChair)) 
    (retract ?fact) 
    (bind ?*plan_de_accion* (create$ ?*plan_de_accion* "Monkey goes to the chair"))
)

(defrule r2
    (monkey nearChair) 
    (monkey handsFree) 
    (monkey hasStrength)
    ?fact1 <- (monkey handsFree)
    ?fact2 <- (chair onFloor)
    => 
    (printout t "mokey took the chair" crlf)
    (assert (monkey handsBusy)) 
    (assert (monkey grabbedChair))
    (retract ?fact1)
    (retract ?fact2)
    (bind ?*plan_de_accion* (create$ ?*plan_de_accion* "Monkey takes the chair"))
)

(defrule r3
    (monkey nearChair) 
    (monkey handsBusy) 
    (monkey grabbedChair)
    ?fact1 <- (monkey farFromDesk)
    => 
    (printout t "monkey goes to the desk" crlf) 
    (assert (monkey nearDesk))
    (retract ?fact1)
    (bind ?*plan_de_accion* (create$ ?*plan_de_accion* "Monkey goes to the desk"))
)

(defrule r4
    (monkey nearDesk) 
    (monkey handsBusy) 
    (monkey grabbedChair)
    ?fact1 <- (monkey handsBusy)
    ?fact2 <- (monkey grabbedChair)
    => 
    (printout t "monkey put the chair on desk" crlf)
    (assert (chair onDesk))
    (assert (monkey handsFree))
    (retract ?fact1)
    (retract ?fact2)
    (bind ?*plan_de_accion* (create$ ?*plan_de_accion* "Monkey puts the chair on desk"))
)

(defrule r5
    (monkey nearDesk) 
    (monkey handsFree) 
    ?fact1 <- (monkey onFloor)
    => 
    (printout t "monkey climbs on the desk" crlf)
    (assert (monkey onDesk))
    (retract ?fact1)
    (bind ?*plan_de_accion* (create$ ?*plan_de_accion* "Monkey climbs on the desk"))
)

(defrule r6
    (chair onDesk) 
    (monkey handsFree) 
    (monkey onDesk)
    ?fact1 <- (monkey onDesk)
    => 
    (printout t "monkey climbs on the chair" crlf)
    (assert (monkey onChair))
    (assert (monkey nearBanana))
    (retract ?fact1)
    (bind ?*plan_de_accion* (create$ ?*plan_de_accion* "Monkey climbs on the chair"))
)

(defrule r7
    (monkey nearBanana) 
    (monkey handsFree)
    ?fact1 <- (monkey handsFree)
    ?fact2 <- (banana onCeiling)
    => 
    (printout t "monkey takes the banana" crlf)
    (assert (monkey grabbedBanana))
    (assert (monkey handsBusy))
    (retract ?fact1)
    (retract ?fact2)
    (bind ?*plan_de_accion* (create$ ?*plan_de_accion* "Monkey takes the banana"))
)

(defrule r8
    (monkey grabbedBanana) 
    (monkey hungry)
    ?fact1 <- (monkey handsBusy)
    ?fact2 <- (monkey grabbedBanana)
    ?fact3 <- (monkey hungry)
    => 
    (printout t "monkey eats the banana" crlf)
    (assert (monkey handsFree))
    (assert (monkey happy))
    (retract ?fact1)
    (retract ?fact2)
    (retract ?fact3)
    (bind ?*plan_de_accion* (create$ ?*plan_de_accion* "Monkey eats the banana"))
)