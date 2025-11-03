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

> Nota: el ZIP incluye artefactos compilados (`.o`, `.hi`, `Main.exe`). Para el repositorio conviene ignorarlos (ver **.gitignore**).

## 🚀 Requisitos

- [GHC / GHCi](https://www.haskell.org/ghc/) 9.x (o compatible)
- Opcional: [Stack](https://docs.haskellstack.org/) o [Cabal](https://www.haskell.org/cabal/) para gestionar el proyecto

## 🛠️ Cómo ejecutar

### Opción A: con **GHCi**
Desde la carpeta `R/Modif3/`:

```bash
ghci
:load Main
main
```

El programa abre un **menú interactivo** (`main = menu`). También puedes cargar módulos sueltos y probar funciones como `mostrarCubo`, `aplicarMovimiento`, etc.

### Opción B: compilar con **GHC**
```bash
ghc -O2 -outputdir dist -o cubo Main.hs
./cubo
```

> Si compilas, asegúrate de que todos los imports (`Cubo`, `Ejemplos`, `RCaraB`, `RCaraA`, `RCapaM`) están en el mismo directorio y sin extensiones de ruta.

## 🏗️ Conceptos clave

- **Tipos** (`Cubo`, `Cara`, `Pieza`, `Color`): modelan el estado con precisión.
- **Movimientos**: rotaciones de caras (`U`, `D`, `L`, `R`, `F`, `B`) y sus inversos (`U'`, etc.), más **giros del cubo** (`VueltaArriba`, `VueltaAbajo`, `VueltaIzquierda`, `VueltaDerecha`, `VueltaFrente`, `VueltaAtras`).
- **Utilidades**:
  - `getCaraArriba/Abajo/Frente/Atras/Izquierda/Derecha`
  - `getColoresCara`, `mostrarCubo`
  - `aplicarMovimiento :: Cubo -> Movimiento -> Cubo`
- **Resolución por etapas**:
  - `RCaraB`: búsqueda en anchura restringida a {`U`, `R`, `L'`, `D'`} para **cara blanca**.
  - `RCapaM`: heurísticas y patrones para **capa media**.
  - `RCaraA`: catálogo de **casos de OLL/PLL** de la última cara.

## 📦 Ejemplos

`Ejemplos.hs` define varios `cuboEjemploN`. En GHCi:
