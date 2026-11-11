Algoritmo Bisiesto
	Definir año Como Entero
	EScribir "Ingrese el año"
	Leer año
	
	Si (año MOD 4 = 0 & año MOD 100 <> 0) O (año MOD 400 = 0 & año MOD 100 <> 0) Entonces
		Escribir "El año ", año, " es bisiesto."
	SiNo
		Escribir "El año ", año, " no es bisiesto."
	Fin Si
	
FinAlgoritmo
