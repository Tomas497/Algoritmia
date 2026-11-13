# Algoritmia 1 · Sesión 3 — Repetir y descomponer

Evidencia de la sesión: trazas del cajero y de la pirámide, y árbol de componentes.

| Archivo | Ejercicio |
|---|---|
| `CajeroParqueadero.psc` | Ej. 1 · Cajero del parqueadero (`Mientras` + centinela) |
| `ValidarPIN.psc` | Ej. 2 · PIN del Robot (`Repetir`, intentos limitados) |
| `Calificaciones.psc` | Ej. 2 · Notas de 5 estudiantes (`Para`, acumulador, contador, máx/mín, bandera) |
| `Piramide.psc` | Ej. 3 · Ciclo dentro de otro ciclo |
| `FacturaRestaurante.psc` | Ej. 4 · SubProcesos |

> Nota: las salidas se verificaron con una simulación en Python de la misma lógica. Ejecuta cada `.psc` en PSeInt antes de entregar y confirma con tu propia corrida.

---

## Las cuatro partes de un ciclo

| Parte | En el caracol del pozo |
|---|---|
| Inicio | `altura <- 0` |
| Condición | ¿no ha salido? |
| Cuerpo | sube y resbala |
| Actualización | la altura cambia (sin ella, el ciclo nunca termina) |

---

## 1. CajeroParqueadero

Centinela: el cajero cobra hasta que ingresan `0`. Entradas de prueba: **4000, 8000, 2000 y 0**.

### Traza

| Vuelta | valor | total | carros | lee |
|---|:-:|:-:|:-:|:-:|
| Antes del ciclo | 4000 | 0 | 0 | - |
| 1 | 4000 | 4000 | 1 | 8000 |
| 2 | 8000 | 12000 | 2 | 2000 |
| 3 | 2000 | 14000 | 3 | 0 |
| Sale | 0 | 14000 | 3 | - |

Salida: `Carros atendidos: 3` · `Total recaudado: $14000`

Bug de la versión del Robot: faltaba el segundo `Leer valor` dentro del ciclo. La condición nunca cambiaba y el ciclo era infinito.

---

## 2. ValidarPIN

Bug de la versión del Robot: `Hasta Que acceso Y intentos = 3` nunca termina si el PIN es incorrecto (De Morgan, sesión 2). Corrección: `Hasta Que acceso O intentos = 3`, es decir, parar si aciertas **O** si se acabaron los intentos.

| acceso | intentos = 3 | `acceso O intentos = 3` | ¿Para? |
|:-:|:-:|:-:|:-:|
| Falso | Falso | Falso | No |
| Verdadero | Falso | Verdadero | Sí |
| Falso | Verdadero | Verdadero | Sí |
| Verdadero | Verdadero | Verdadero | Sí |

Patrones: `intentos <- intentos + 1` es el contador y `acceso <- Verdadero` es la bandera.

---

## 3. Calificaciones

Notas de prueba: 3.5, 2.8, 4.9, 3.0, 4.2

| Pregunta | Patrón | Resultado |
|---|---|---|
| Promedio | Acumulador | 3.68 |
| Cuántos aprobaron (3 o más) | Contador | 4 |
| Nota más alta y más baja | Máximo y mínimo | 4.9 y 2.8 |
| ¿Alguien perdió? | Bandera | Sí (hay refuerzo) |

---

## 4. Piramide

El error típico es `Hasta 2 * fila`, que dibuja una escalera en vez de una pirámide. Lo correcto es `Hasta 2 * fila - 1`.

### Traza — altura 4

| fila | espacios (`n - fila`) | asteriscos (`2*fila - 1`) | línea impresa |
|:-:|:-:|:-:|---|
| 1 | 3 | 1 | `   *` |
| 2 | 2 | 3 | `  ***` |
| 3 | 1 | 5 | ` *****` |
| 4 | 0 | 7 | `*******` |

Salida completa:

```
   *
  ***
 *****
*******
```

### Alturas 1 y 6

| Altura | Filas | Asteriscos en la última fila | Espacios en la última fila |
|:-:|:-:|:-:|:-:|
| 1 | 1 | 1 | 0 |
| 4 | 4 | 7 | 0 |
| 6 | 6 | 11 | 0 |

La última fila siempre tiene 0 espacios. Para `Para j <- 1 Hasta 0`, el ciclo no da ninguna vuelta.

---

## 5. FacturaRestaurante — SubProcesos

Problema grande, piezas pequeñas:

| SubProceso | Trabajo |
|---|---|
| `LeerPedido()` | Lee platos (precio y cantidad) hasta que el precio sea 0 y devuelve el subtotal |
| `CalcularPorcentaje(base, porcentaje)` | Una sola pieza para impuesto (8) y propina (10) |
| `ImprimirFactura(subtotal, impuesto, propina)` | Muestra subtotal, impuesto, propina y total |

Entradas de prueba: precio 25000 × 2, precio 12000 × 1 y precio 0.

| Concepto | Cálculo | Valor |
|---|---|:-:|
| Subtotal | 25000 × 2 + 12000 × 1 | 62.000 |
| Impuesto 8 % | 62000 × 8 / 100 | 4.960 |
| Propina 10 % | 62000 × 10 / 100 | 6.200 |
| **Total** | 62000 + 4960 + 6200 | **73.160** |

---

## Árbol de componentes (la página como árbol de cajas)

Ejemplo del video: la página de un restaurante. Cada caja es una pieza con su trabajo y es reutilizable. Las cajas marcadas con `(×N)` se repiten, es decir, son un ciclo.

```
Página
├── Encabezado
│   ├── Logo
│   └── Menú
├── Contenido
│   ├── Banner
│   └── Lista de platos
│       └── Tarjeta de plato  (×N, se repite)
│           ├── Imagen
│           ├── Nombre y precio
│           └── Botón Agregar
└── Pie de página
```

> Pendiente tuyo: el video pide escoger **una página real** (una tienda, una red social o la de Riwi), dibujar su árbol de componentes y marcar qué cajas se repiten. Reemplaza el árbol de arriba por el de la página que escojas.

---

## Extras de la sesión

### ¿Cuántas vueltas da cada ciclo?

| Ciclo | Valores de `i` | Vueltas |
|---|---|:-:|
| A · `Para i <- 1 Hasta 10` | 1 a 10 | 10 |
| B · `Para i <- 0 Hasta 10` | 0 a 10 | 11 |
| C · `i <- 1`, `Mientras i < 10 ... i <- i + 1` | 1 a 9 | 9 |

Una vuelta de diferencia es un error por uno. La defensa es hacer la traza.

### El caracol del pozo (10 m, sube 3 de día, resbala 2 de noche)

| Día | Arranca | Sube hasta | ¿Salió? | Resbala a |
|:-:|:-:|:-:|:-:|:-:|
| 1 | 0 | 3 | No | 1 |
| 2 | 1 | 4 | No | 2 |
| 3 | 2 | 5 | No | 3 |
| 4 | 3 | 6 | No | 4 |
| 5 | 4 | 7 | No | 5 |
| 6 | 5 | 8 | No | 6 |
| 7 | 6 | 9 | No | 7 |
| 8 | 7 | 10 | Sí | - |

Sale en **8 días**, no en 10: el avance neto es de 1 m por día, pero el último día ya no resbala.
