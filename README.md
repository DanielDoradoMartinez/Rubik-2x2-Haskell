# Cubo de Rubik 2x2 en Haskell

> Implementación educativa de un **cubo de Rubik 2x2** en Haskell, con tipos fuertes para colores/piezas/caras, movimientos básicos, y bocetos de **resolución por etapas** (cara blanca, capa media, cara amarilla). Incluye ejemplos de cubos y un `main` con menú interactivo.

## 🧩 Estructura

```
ProyectoRubic2x2/
├─ Cubo de Rubik 2x2.pptx         # Presentación del proyecto
└─ R/Modif3/
   ├─ Cubo.hs                      # Definición de tipos y movimientos del cubo (U, D, L, R, F, B y variantes ' / 2)
   ├─ RCaraB.hs                    # Búsqueda para resolver la cara Blanca
   ├─ RCapaM.hs                    # Algoritmos para la capa intermedia
   ├─ RCaraA.hs                    # Casuística para la última cara (amarilla)
   ├─ Ejemplos.hs                  # Estados de ejemplo de cubos
   └─ Main.hs                      # Entrada del programa (menú)
```
