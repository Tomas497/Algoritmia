# Algoritmia # Bitácora de Algoritmos - PSeInt

Notas y registro de pruebas de los ejercicios hechos en PSeInt.


Pruebas de Ejecución

1. Cálculo de cuenta y propina 
Este programa calcula la propina fija del 10% para una cuenta de $120.000 y divide el total entre el número de personas

Caso de prueba 1:
    Personas: 4
    Salida esperada / obtenida:
     Propina: 12000 cop
     Total con propina: 132000 cop
     Cada persona paga: 33000 cop

Caso de prueba 2 (Validación de entrada):
    Personas: -1 -> luego 2
    Salida esperada / obtenida:
    Al meter -1, pide ingresar un número válido.
    Al corregir a 2:
      Propina: 12000 cop
      Total con propina: 132000 cop
      Cada persona paga: 66000 cop


2. Conversión de edad 
Convierte la edad ingresada a un aproximado en días (multiplicando por 365) y meses (dividiendo los días entre 30).

Caso de prueba 1:
Edad: 20
 Salida:
    Días: 7300
    Meses: 243.33

Caso de prueba 2:
  Edad: 15
  Salida:
    Días: 5475
    Meses: 182.5


3. Promedio de notas 
Recibe tres notas y calcula la media aritmética.

Caso de prueba 1:
  Notas: 4.0, 3.5, 4.5
  Salida (Promedio): 4.0

Caso de prueba 2:
  Notas: 2.5, 3.0, 2.0
  Salida (Promedio): 2.5

  

4. Saludo personalizado
Pide un nombre y devuelve un mensaje de bienvenida.

Caso de prueba 1:
  Nombre: Mateo
  Salida: Hola, Mateo. Bienvenid@ a algoritmia.`

  Caso de prueba 2:
  Nombre: Laura
  Salida: Hola, Laura. Bienvenid@ a algoritmia.`
