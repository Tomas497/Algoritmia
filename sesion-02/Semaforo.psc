Algoritmo Semaforo
	Definir unidades Como Entero
	Escribir "Unidades en inventario:"
	Leer unidades
	Si unidades < 0 Entonces
		Escribir "ERROR: las unidades no pueden ser negativas"
	SiNo
		Si unidades = 0 Entonces
			Escribir "ROJO: agotado"
		SiNo
			Si unidades <= 10 Entonces
				Escribir "AMARILLO: pedir"
			SiNo
				Escribir "VERDE: todo bien"
			FinSi
		FinSi
	FinSi
FinAlgoritmo
