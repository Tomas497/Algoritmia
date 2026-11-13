# Algoritmia 1 · Sesión 2 — Lógica y decisiones

Evidencia de la sesión: tablas de verdad/decisión y pruebas de escritorio de cada ejercicio.

| Archivo | Ejercicio |
|---|---|
| `ValidarRegistro.psc` | Ej. 1 · Registro con edad y términos |
| `ValidarEdad.psc` | Ej. 2 · Negar sin equivocarse (De Morgan) |
| `Parqueadero.psc` | Ej. 3 · El parqueadero |
| `Semaforo.psc` | Ej. 4 · Reto 1 |
| `Bisiesto.psc` | Ej. 4 · Reto 2 |

> Nota: las salidas de las tablas se verificaron con una simulación en Python de la misma lógica. Antes de entregar, ejecuta cada `.psc` en PSeInt y confirma las columnas OK/FALLA con tu propia corrida.

---

## 1. ValidarRegistro

Regla: te registras si tienes 14 años o más **Y** aceptas los términos.

### Tabla de verdad

| edad >= 14 | acepta | resultado |
|:-:|:-:|---|
| V | V | Registro exitoso |
| V | F | No puedes registrarte |
| F | V | No puedes registrarte |
| F | F | No puedes registrarte |

### Prueba de escritorio (edad = 13, respuesta = "s")

| Paso | edad | respuesta | condición | salida |
|---|:-:|:-:|---|---|
| Lee datos | 13 | s | | |
| Mayusculas | 13 | S | | |
| Evalúa | 13 | S | `13 >= 14` es F → F Y V = F | No puedes registrarte |

---

## 2. ValidarEdad

- Válida: `edad >= 0 Y edad <= 120`
- De Morgan: `NO (A Y B) = NO A O NO B`
- Inválida: `edad < 0 O edad > 120`
- HTML equivalente: `min="0" max="120"`

### Casos de prueba

| edad | edad < 0 | edad > 120 | inválida (O) | resultado | OK/FALLA |
|:-:|:-:|:-:|:-:|---|:-:|
| -1 | V | F | V | Edad inválida | OK |
| 0 | F | F | F | Edad válida | OK |
| 120 | F | F | F | Edad válida | OK |
| 121 | F | V | V | Edad inválida | OK |

### Prueba de escritorio (edad = 121)

| Paso | edad | edad < 0 | edad > 120 | resultado |
|---|:-:|:-:|:-:|---|
| Lee edad | 121 | | | |
| Evalúa `O` | 121 | F | V | F O V = V |
| Salida | 121 | | | Edad inválida |

---

## 3. Parqueadero

### Reglas del administrador
1. Carro: $4.000 por hora o fracción. Moto: $2.000.
2. Los primeros 15 minutos son gratis.
3. El cobro máximo del día es $30.000.
4. Con factura del centro comercial paga la mitad (después del máximo).
5. Tipo que no sea carro ni moto, o minutos negativos: error.

### Tabla de decisión

| Regla | Tipo | Minutos | Factura | Resultado |
|---|---|---|---|---|
| R1 | Cualquiera | Menos de 0 | Cualquiera | Error: minutos negativos |
| R2 | Ni 1 ni 2 | 0 o más | Cualquiera | Error: tipo no válido |
| R3 | Carro o moto | De 0 a 15 | Cualquiera | Gratis |
| R4 | Carro o moto | Más de 15 | No | Horas × tarifa, máximo $30.000 |
| R5 | Carro o moto | Más de 15 | Sí | Lo mismo que R4, dividido entre 2 |

### Casos borde

| # | Tipo | Min | Factura | Horas | Esperado | Obtenido | OK/FALLA |
|:-:|:-:|:-:|:-:|:-:|---|---|:-:|
| 1 | Carro | 15 | No | - | 0 | 0 | OK |
| 2 | Carro | 16 | No | 1 | 4.000 | 4.000 | OK |
| 3 | Carro | 60 | No | 1 | 4.000 | 4.000 | OK |
| 4 | Carro | 61 | No | 2 | 8.000 | 8.000 | OK |
| 5 | Moto | 61 | Sí | 2 | 2.000 | 2.000 | OK |
| 6 | Carro | 600 | No | 10 | 30.000 (tope) | 30.000 | OK |
| 7 | Carro | 600 | Sí | 10 | 15.000 | 15.000 | OK |
| 8 | 3 | 30 | No | - | Tipo no válido | Tipo no válido | OK |
| 9 | Carro | -5 | No | - | Minutos negativos | Minutos negativos | OK |

Detalle clave: el caso 1 (15 min) debe ser gratis, por eso la condición es `minutos <= 15` y no `< 15`.

### Prueba de escritorio — Caso 4 (carro, 61 min, sin factura)

| Paso | tipo | minutos | factura | tarifa | horas | valor |
|---|:-:|:-:|:-:|:-:|:-:|:-:|
| Lee datos | 1 | 61 | N | | | |
| Según | 1 | 61 | N | 4000 | | |
| Calcula horas = trunc((61+59)/60) | 1 | 61 | N | 4000 | 2 | |
| Calcula valor = 2 × 4000 | 1 | 61 | N | 4000 | 2 | 8000 |
| Aplica tope (8000 > 30000 es F) | 1 | 61 | N | 4000 | 2 | 8000 |
| Aplica factura (N) | 1 | 61 | N | 4000 | 2 | **8000** |

### Prueba de escritorio — Caso 5 (moto, 61 min, con factura)

| Paso | tipo | minutos | factura | tarifa | horas | valor |
|---|:-:|:-:|:-:|:-:|:-:|:-:|
| Lee datos | 2 | 61 | S | | | |
| Según | 2 | 61 | S | 2000 | | |
| Calcula horas = trunc((61+59)/60) | 2 | 61 | S | 2000 | 2 | |
| Calcula valor = 2 × 2000 | 2 | 61 | S | 2000 | 2 | 4000 |
| Aplica tope (4000 > 30000 es F) | 2 | 61 | S | 2000 | 2 | 4000 |
| Aplica factura (4000 / 2) | 2 | 61 | S | 2000 | 2 | **2000** |

---

## 4. Reto 1 · Semaforo

| Condición | Color | Mensaje |
|---|---|---|
| unidades < 0 | Error | Unidades negativas |
| unidades = 0 | Rojo | Agotado |
| 1 a 10 | Amarillo | Pedir |
| > 10 | Verde | Todo bien |

### Casos de prueba

| unidades | Esperado | Obtenido | OK/FALLA |
|:-:|---|---|:-:|
| -3 | Error | Error | OK |
| 0 | Rojo | Rojo | OK |
| 1 | Amarillo | Amarillo | OK |
| 10 | Amarillo | Amarillo | OK |
| 11 | Verde | Verde | OK |
| 15 | Verde | Verde | OK |

### Prueba de escritorio (unidades = 10, frontera)

| Paso | unidades | `< 0` | `= 0` | `<= 10` | salida |
|---|:-:|:-:|:-:|:-:|---|
| Lee | 10 | | | | |
| Evalúa | 10 | F | F | V | AMARILLO: pedir |

---

## 5. Reto 2 · Bisiesto

Un año es bisiesto si es divisible entre 4 **Y** no entre 100, **O** divisible entre 400.

`(anio MOD 4 = 0 Y anio MOD 100 <> 0) O anio MOD 400 = 0`

### Tabla de verdad

| Año | ÷ 4 | ÷ 100 | ÷ 400 | ¿Bisiesto? |
|:-:|:-:|:-:|:-:|:-:|
| 2024 | V | F | F | Sí |
| 1900 | V | V | F | No |
| 2000 | V | V | V | Sí |
| 2026 | F | F | F | No |
| 2100 | V | V | F | No |

### Prueba de escritorio (anio = 1900)

| Paso | anio | MOD 4 = 0 | MOD 100 <> 0 | (A Y B) | MOD 400 = 0 | resultado |
|---|:-:|:-:|:-:|:-:|:-:|---|
| Lee anio | 1900 | | | | | |
| Evalúa | 1900 | V | F | F | F | F O F = F |
| Salida | 1900 | | | | | 1900 no es bisiesto |
