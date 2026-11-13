Algoritmo Calificaciones
	Definir i, aprobados Como Entero
	Definir nota, suma, mayor, menor Como Real
	Definir alguienPerdio Como Logico
	suma <- 0
	aprobados <- 0
	mayor <- 0
	menor <- 5
	alguienPerdio <- Falso
	Para i <- 1 Hasta 5 Hacer
		Escribir "Nota del estudiante ", i, ":"
		Leer nota
		suma <- suma + nota
		Si nota >= 3 Entonces
			aprobados <- aprobados + 1
		SiNo
			alguienPerdio <- Verdadero
		FinSi
		Si nota > mayor Entonces
			mayor <- nota
		FinSi
		Si nota < menor Entonces
			menor <- nota
		FinSi
	FinPara
	Escribir "Promedio: ", suma / 5
	Escribir "Aprobados: ", aprobados
	Escribir "Nota más alta: ", mayor, " y más baja: ", menor
	Si alguienPerdio Entonces
		Escribir "Hay estudiantes en refuerzo"
	FinSi
FinAlgoritmo
