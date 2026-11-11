Algoritmo sin_titulo
	Algoritmo Piramide
		Definir n, fila, j Como Entero
		Escribir "Altura de la pirámide:"
		Leer n
		Para fila <- 1 Hasta n Hacer
			Para j <- 1 Hasta n - fila Con Paso 1 Hacer
				Escribir Sin Saltar " "
			FinPara
			Para j <- 1 Hasta 2 * fila - 1 Hacer
				Escribir Sin Saltar "*"
			FinPara
			Escribir ""
		FinPara
FinAlgoritmo
FinAlgoritmo
