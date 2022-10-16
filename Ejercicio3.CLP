;Codigo realizado por Héctor Toribio González y Palayo Torres Alonso
;Ejercicio 3

;Pedimos el escenario

(defrule inicio "pedimos"
(declare (salience 2000))=>
	(printout T "Escriba el escenario que quiere utilizar: "crlf)
	(assert (escenario = (read T)))
)

;Escenarios en los que introducimos las caracteristicas en la memoria

;Escenario 1
(defrule escenario1 "escenario 1"
	(escenario 1)
=>
	(assert (indbateria nivel cero))
	(assert (motor arranca FALSE))
	
)


;Escenario 2
(defrule escenario2 "escenario 2"
	(escenario 2)=>
	(assert (motor para TRUE))
	(assert (indcombustible nivel cero))
)


;Empezamos a definir las reglas

;Unimos las causas originales a las lecturas de los indicadores y las causas ;intermedias
(defrule deposito "estado deposito"
	(indcombustible nivel cero)
	(combustible estado FALSE)=>
	(assert (deposito estado vacio))
	(printout t crlf "El deposito esta vacio" crlf)
)


(defrule bateria "estado bateria"
	(indbateria nivel cero)
	(potencia estado FALSE)=>
	(assert (bateria nivel baja))
	(printout t crlf "La bateria esta baja" crlf)
)

(defrule fusible "estado fusible"
	(potencia estado FALSE)
	(insfusible resultado roto)=>
	(assert (fusible estado roto))
	(printout t crlf "El fusible esta fundido" crlf) 
)


;Unimos las causas intermedias a  los comportamientos del motor
(defrule potencia "estado potencia"
	(motor arranca FALSE)=>
	(assert (potencia estado FALSE))
	
)

(defrule combustibleA "estado combustible cuando no arranca"
	(motor arranca FALSE)=>
	(assert (combustible estado FALSE))
	
)

(defrule combustibleB "estado combustible cuando se para"
	(motor para TRUE)=>
	(assert (combustible estado FALSE))
	
)
