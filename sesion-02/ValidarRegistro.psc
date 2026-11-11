Algoritmo ValidarRegistro
	Definir edad como entero 
	Definir respuesta como caracter 
	Escribir "¿Cuantos años tienes?"
	Leer edad 
	Escribir "¿Aceptas los terminos? (S/N)"
	Leer respuesta
	
	respuesta <- Mayusculas(respuesta)
	si edad >= 14 y respuesta = "S" Entonces
		Escribir "Registro exitoso"
	sino 
		EScribir "No puedes registrarte"
	FinSi
FinAlgoritmo
