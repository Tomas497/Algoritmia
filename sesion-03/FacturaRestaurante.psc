Algoritmo FacturaRestaurante
	Definir subtotal, impuesto, propina Como Real
	subtotal <- LeerPedido()
	impuesto <- CalcularPorcentaje(subtotal, 8)
	propina <- CalcularPorcentaje(subtotal, 10)
	ImprimirFactura(subtotal, impuesto, propina)
FinAlgoritmo

// Lee platos hasta que el precio sea 0 (centinela) y acumula el subtotal
SubProceso subtotal <- LeerPedido()
	Definir subtotal, precio Como Real
	Definir cantidad Como Entero
	subtotal <- 0
	Escribir "Precio del plato (0 para terminar el pedido):"
	Leer precio
	Mientras precio <> 0 Hacer
		Escribir "Cantidad:"
		Leer cantidad
		subtotal <- subtotal + precio * cantidad
		Escribir "Precio del plato (0 para terminar el pedido):"
		Leer precio
	FinMientras
FinSubProceso

// Una sola pieza reutilizable: sirve para el impuesto (8) y la propina (10)
SubProceso valor <- CalcularPorcentaje(base, porcentaje)
	Definir valor Como Real
	valor <- base * porcentaje / 100
FinSubProceso

SubProceso ImprimirFactura(subtotal, impuesto, propina)
	Definir total Como Real
	total <- subtotal + impuesto + propina
	Escribir "Subtotal: $", subtotal
	Escribir "Impuesto (8%): $", impuesto
	Escribir "Propina (10%): $", propina
	Escribir "Total: $", total
FinSubProceso
