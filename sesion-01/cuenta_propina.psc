Algoritmo sin_titulo
	definir cuenta Como Entero
	definir propina Como Real
	definir personas como Entero
	definir ct como real
	
	cuenta = 120000
	Escribir "Cuantas personas son?"
	Leer personas 
	propina = 0.1
	
	Escribir "EL total de la propina es: " cuenta*propina " cop"
	Escribir "El total de la cuenta mas propina es: " cuenta+cuenta*propina " cop"
	
	Mientras personas <= 0 Hacer 
		Escribir "Ingrese un numero de personas valido"
		leer personas
	FinMientras
	
	Escribir "Cada persona paga: " (cuenta+cuenta*propina)/personas " cop"
	
	
	
	
FinAlgoritmo
