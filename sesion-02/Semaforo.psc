Algoritmo Semaforo
	Definir unidades Como Entero
	EScribir "Ingrese las unidades"
	leer unidades
	
Si unidades < 0 Entonces
	Escribir "Invalido"
SiNo
	Si unidades = 0 Entonces
		Escribir "Rojo: Agotado"
	SiNo
		Si unidades = 0 Entonces
			Escribir "Rojo: Agotado"
		SiNo
			si unidades > 1 & unidades < 10 Entonces
				Escribir "Amarillo: Pedir"
			SiNo
				Escribir "Verde: Todo bien"
			FinSi
		FinSi
	FinSi	
FinSi

FinAlgoritmo
