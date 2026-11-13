Algoritmo ValidarEdad
	Definir edad Como Entero
	Escribir "Ingresa tu edad:"
	Leer edad
	// Válida: edad >= 0 Y edad <= 120
	// Ley de De Morgan -> Inválida: edad < 0 O edad > 120
	Si edad < 0 O edad > 120 Entonces
		Escribir "Edad inválida"
	SiNo
		Escribir "Edad válida"
	FinSi
FinAlgoritmo
