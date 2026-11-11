Algoritmo Calificaciones
		Definir contador, ganaron Como Entero
		Definir calificacion, acumulado, max, men Como Real
		Definir reprobados Como Logico
		
		acumulado <- 0
		ganaron <- 0
		max <- 0
		men <- 5
		reprobados <- Falso
		
		Para contador <- 1 Hasta 5 Hacer
			Escribir "Ingrese la nota ", contador, ":"
			Leer calificacion
			acumulado <- acumulado + calificacion
			
			Si calificacion >= 3 Entonces
				ganaron <- ganaron + 1
			SiNo
				reprobados <- Verdadero
			FinSi
			
			Si calificacion > max Entonces
				max <- calificacion
			FinSi
			
			Si calificacion < men Entonces
				men <- calificacion
			FinSi
		FinPara
		
		Escribir "Promedio: ", acumulado / 5
		Escribir "Ganaron: ", ganaron
		Escribir "Nota mas alta: ", max, " y nota mas baja: ", men
		
		Si reprobados Entonces
			Escribir "Hay estudiantes en refuerzo"
		FinSi
FinAlgoritmo
