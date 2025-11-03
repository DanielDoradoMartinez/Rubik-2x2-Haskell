module Cubo where
import Data.List





--- DEFINICIÓN DE DATOS ---

data Color = Blanco | Amarillo | Azul | Verde | Naranja | Rojo deriving (Eq, Show)

data Pieza = Pieza { colorPieza :: Color } deriving (Eq, Show)

data Cara = Cara {
	supIzq :: Pieza,
	infIzq :: Pieza,
	supDer :: Pieza,
	infDer :: Pieza
} deriving (Eq, Show)

data Cubo = Cubo {
	arriba :: Cara,
	abajo :: Cara,
	frente :: Cara,
	atras :: Cara,
	izquierda :: Cara,
	derecha :: Cara
} deriving (Eq, Show)

type Arbol = [(Cubo, Movimiento)]

data Movimiento = U
				| U'
				| D
				| D'
				| F
				| F'
				| B
				| B'
				| L
				| L'
				| R
				| R'
				| VueltaAbajo
				| VueltaIzquierda
				| VueltaDerecha
				| VueltaFrente
				| VueltaAtras
				deriving (Eq, Show)



-- Obtener color de una pieza 
getColorPieza :: Pieza -> Color
getColorPieza (Pieza color) = color

-- Obtener caras

getCaraArriba :: Cubo -> Cara
getCaraArriba (Cubo arriba _ _ _ _ _) = arriba

getCaraAbajo :: Cubo -> Cara
getCaraAbajo (Cubo _ abajo _ _ _ _) = abajo

getCaraFrente :: Cubo -> Cara
getCaraFrente (Cubo _ _ frente _ _ _) = frente

getCaraAtras :: Cubo -> Cara
getCaraAtras (Cubo _ _ _ atras _ _) = atras

getCaraIzquierda :: Cubo -> Cara
getCaraIzquierda (Cubo _ _ _ _ izquierda _) = izquierda

getCaraDerecha :: Cubo -> Cara
getCaraDerecha (Cubo _ _ _ _ _ derecha) = derecha

getColoresCara :: Cara -> [Color]
getColoresCara (Cara supIzq infIzq supDer infDer) = 
	[getColorPieza supIzq, getColorPieza infIzq, getColorPieza supDer, getColorPieza infDer]

mostrarCubo :: Cubo -> IO ()
mostrarCubo cubo = do
	putStrLn ("Arriba: " ++ show (getColoresCara (getCaraArriba cubo)))
	putStrLn ("Abajo: " ++ show (getColoresCara (getCaraAbajo cubo)))
	putStrLn ("Frente: " ++ show (getColoresCara (getCaraFrente cubo)))
	putStrLn ("Atras: " ++ show (getColoresCara (getCaraAtras cubo)))
	putStrLn ("Izquierda: " ++ show (getColoresCara (getCaraIzquierda cubo)))
	putStrLn ("Derecha: " ++ show (getColoresCara (getCaraDerecha cubo)))



--- MOVIMIENTOS ---

rotarArribaHorario :: Cubo -> Cubo
rotarArribaHorario (Cubo arriba abajo frente atras izquierda derecha) = Cubo arribaAux abajo frenteAux atrasAux izquierdaAux derechaAux
	where
		frenteAux = Cara { supIzq = supIzq derecha, infIzq = infIzq frente, supDer = supDer derecha, infDer = infDer frente }
		atrasAux = Cara { supIzq = supIzq izquierda, infIzq = infIzq atras, supDer = supDer izquierda, infDer = infDer atras }
		izquierdaAux = Cara { supIzq = supIzq frente, infIzq = infIzq izquierda, supDer = supDer frente, infDer = infDer izquierda }
		derechaAux = Cara { supIzq = supIzq atras, infIzq = infIzq derecha, supDer = supDer atras, infDer = infDer derecha }
		arribaAux = Cara { supIzq = infIzq arriba, infIzq = infDer arriba, supDer = supIzq arriba, infDer = supDer arriba }

rotarArribaAntihorario :: Cubo -> Cubo
rotarArribaAntihorario (Cubo arriba abajo frente atras izquierda derecha) = Cubo arribaAux abajo frenteAux atrasAux izquierdaAux derechaAux
	where
		frenteAux = Cara { supIzq = supIzq izquierda, infIzq = infIzq frente, supDer = supDer izquierda, infDer = infDer frente }
		atrasAux = Cara { supIzq = supIzq derecha, infIzq = infIzq atras, supDer = supDer derecha, infDer = infDer atras }
		izquierdaAux = Cara { supIzq = supIzq atras, infIzq = infIzq izquierda, supDer = supDer atras, infDer = infDer izquierda }
		derechaAux = Cara { supIzq = supIzq frente, infIzq = infIzq derecha, supDer = supDer frente, infDer = infDer derecha }
		arribaAux = Cara { supIzq = supDer arriba, infIzq = supIzq arriba, supDer = infDer arriba, infDer = infIzq arriba }

rotarAbajoHorario :: Cubo -> Cubo
rotarAbajoHorario (Cubo arriba abajo frente atras izquierda derecha) = Cubo arriba abajoAux frenteAux atrasAux izquierdaAux derechaAux
	where
		frenteAux = Cara { supIzq = supIzq frente, infIzq = infIzq izquierda, supDer = supDer frente, infDer = infDer izquierda }
		atrasAux = Cara { supIzq = supIzq atras, infIzq = infIzq derecha, supDer = supDer atras, infDer = infDer derecha }
		izquierdaAux = Cara { supIzq = supIzq izquierda, infIzq = infIzq atras, supDer = supDer izquierda, infDer = infDer atras }
		derechaAux = Cara { supIzq = supIzq derecha, infIzq = infIzq frente, supDer = supDer derecha, infDer = infDer frente }
		abajoAux = Cara { supIzq = infIzq abajo, infIzq = infDer abajo, supDer = supIzq abajo, infDer = supDer abajo }

rotarAbajoAntihorario :: Cubo -> Cubo
rotarAbajoAntihorario (Cubo arriba abajo frente atras izquierda derecha) = Cubo arriba abajoAux frenteAux atrasAux izquierdaAux derechaAux
	where
		frenteAux = Cara { supIzq = supIzq frente, infIzq = infIzq derecha, supDer = supDer frente, infDer = infDer derecha }
		atrasAux = Cara { supIzq = supIzq atras, infIzq = infIzq izquierda, supDer = supDer atras, infDer = infDer izquierda }
		izquierdaAux = Cara { supIzq = supIzq izquierda, infIzq = infIzq frente, supDer = supDer izquierda, infDer = infDer frente }
		derechaAux = Cara { supIzq = supIzq derecha, infIzq = infIzq atras, supDer = supDer derecha, infDer = infDer atras }
		abajoAux = Cara { supIzq = supDer abajo, infIzq = supIzq abajo, supDer = infDer abajo, infDer = infIzq abajo }

rotarFrenteHorario :: Cubo -> Cubo
rotarFrenteHorario (Cubo arriba abajo frente atras izquierda derecha) = Cubo arribaAux abajoAux frenteAux atras izquierdaAux derechaAux
	where
		arribaAux = Cara { supIzq = supIzq arriba, infIzq = infDer izquierda, supDer = supDer arriba, infDer = supDer izquierda }
		abajoAux = Cara { supIzq = supIzq abajo, infIzq = supIzq derecha, supDer = supDer abajo, infDer = infIzq derecha }
		izquierdaAux = Cara { supIzq = supIzq izquierda, infIzq = infIzq izquierda, supDer = infDer abajo, infDer = infIzq abajo }
		derechaAux = Cara { supIzq = infIzq arriba, infIzq = infDer arriba, supDer = supDer derecha, infDer = infDer derecha }
		frenteAux = Cara { supIzq = infIzq frente, infIzq = infDer frente, supDer = supIzq frente, infDer = supDer frente }

rotarFrenteAntihorario :: Cubo -> Cubo
rotarFrenteAntihorario (Cubo arriba abajo frente atras izquierda derecha) = Cubo arribaAux abajoAux frenteAux atras izquierdaAux derechaAux
	where
		arribaAux = Cara { supIzq = supIzq arriba, infIzq = supIzq derecha, supDer = supDer arriba, infDer = infIzq derecha }
		abajoAux = Cara { supIzq = supIzq abajo, infIzq = infDer izquierda, supDer = supDer abajo, infDer = supDer izquierda }
		izquierdaAux = Cara { supIzq = supIzq izquierda, infIzq = infIzq izquierda, supDer = infDer arriba, infDer = infIzq arriba }
		derechaAux = Cara { supIzq = infIzq abajo, infIzq = infDer abajo, supDer = supDer derecha, infDer = infDer derecha }
		frenteAux = Cara { supIzq = supDer frente, infIzq = supIzq frente, supDer = infDer frente, infDer = infIzq frente }

rotarAtrasHorario :: Cubo -> Cubo
rotarAtrasHorario (Cubo arriba abajo frente atras izquierda derecha) = Cubo arribaAux abajoAux frente atrasAux izquierdaAux derechaAux
	where
		arribaAux = Cara { supIzq = supDer derecha, infIzq = infIzq arriba, supDer = infDer derecha, infDer = infDer arriba }
		abajoAux = Cara { supIzq = infIzq izquierda, infIzq = infIzq abajo, supDer = supIzq izquierda, infDer = infDer abajo }
		izquierdaAux = Cara { supIzq = supDer arriba, infIzq = supIzq arriba, supDer = supDer izquierda, infDer = infDer izquierda }
		derechaAux = Cara { supIzq = supIzq derecha, infIzq = infIzq derecha, supDer = supIzq abajo, infDer = supDer abajo }
		atrasAux = Cara { supIzq = infIzq atras, infIzq = infDer atras, supDer = supIzq atras, infDer = supDer atras }

rotarAtrasAntihorario :: Cubo -> Cubo
rotarAtrasAntihorario (Cubo arriba abajo frente atras izquierda derecha) = Cubo arribaAux abajoAux frente atrasAux izquierdaAux derechaAux
	where
		arribaAux = Cara { supIzq = infIzq izquierda, infIzq = infIzq arriba, supDer = supIzq izquierda, infDer = infDer arriba }
		abajoAux = Cara { supIzq = supDer derecha, infIzq = infIzq abajo, supDer = infDer derecha, infDer = infDer abajo }
		izquierdaAux = Cara { supIzq = supDer abajo, infIzq = supIzq abajo, supDer = supDer izquierda, infDer = infDer izquierda }
		derechaAux = Cara { supIzq = supIzq derecha, infIzq = infIzq derecha, supDer = supIzq arriba, infDer = supDer arriba }
		atrasAux = Cara { supIzq = supDer atras, infIzq = supIzq atras, supDer = infDer atras, infDer = infIzq atras }
		
rotarIzquierdaHorario :: Cubo -> Cubo
rotarIzquierdaHorario (Cubo arriba abajo frente atras izquierda derecha) = (Cubo arribaAux abajoAux frenteAux atrasAux izquierdaAux derecha)
	where
		arribaAux = Cara { supIzq = infDer atras, infIzq = supDer atras, supDer = supDer arriba, infDer = infDer arriba }
		abajoAux = Cara { supIzq = supIzq abajo, infIzq = infIzq abajo, supDer = infIzq frente, infDer = supIzq frente }
		frenteAux = Cara { supIzq = supIzq arriba, infIzq = infIzq arriba, supDer = supDer frente, infDer = infDer frente }
		atrasAux = Cara { supIzq = supIzq atras, infIzq = infIzq atras, supDer = supDer abajo, infDer = infDer abajo }
		izquierdaAux = Cara { supIzq = infIzq izquierda, infIzq = infDer izquierda, supDer = supIzq izquierda, infDer = supDer izquierda }

rotarIzquierdaAntihorario :: Cubo -> Cubo
rotarIzquierdaAntihorario (Cubo arriba abajo frente atras izquierda derecha) = Cubo arribaAux abajoAux frenteAux atrasAux izquierdaAux derecha
	where
		arribaAux = Cara { supIzq = supIzq frente, infIzq = infIzq frente, supDer = supDer arriba, infDer = infDer arriba }
		abajoAux = Cara { supIzq = supIzq abajo, infIzq = infIzq abajo, supDer = supDer atras, infDer = infDer atras }
		frenteAux = Cara { supIzq = infDer abajo, infIzq = supDer abajo, supDer = supDer frente, infDer = infDer frente }
		atrasAux = Cara { supIzq = supIzq atras, infIzq = infIzq atras, supDer = infIzq arriba, infDer = supIzq arriba }
		izquierdaAux = Cara { supIzq = supDer izquierda, infIzq = supIzq izquierda, supDer = infDer izquierda, infDer = infIzq izquierda }

rotarDerechaHorario :: Cubo -> Cubo
rotarDerechaHorario (Cubo arriba abajo frente atras izquierda derecha) = Cubo arribaAux abajoAux frenteAux atrasAux izquierda derechaAux
	where
		arribaAux = Cara { supIzq = supIzq arriba, infIzq = infIzq arriba, supDer = supDer frente, infDer = infDer frente }
		abajoAux = Cara { supIzq = supIzq atras, infIzq = infIzq atras, supDer = supDer abajo, infDer = infDer abajo }
		frenteAux = Cara { supIzq = supIzq frente, infIzq = infIzq frente, supDer = infIzq abajo, infDer = supIzq abajo }
		atrasAux = Cara { supIzq = infDer arriba, infIzq = supDer arriba, supDer = supDer atras, infDer = infDer atras }
		derechaAux = Cara { supIzq = infIzq derecha, infIzq = infDer derecha, supDer = supIzq derecha, infDer = supDer derecha }

rotarDerechaAntihorario :: Cubo -> Cubo
rotarDerechaAntihorario (Cubo arriba abajo frente atras izquierda derecha) = Cubo arribaAux abajoAux frenteAux atrasAux izquierda derechaAux
	where
		arribaAux = Cara { supIzq = supIzq arriba, infIzq = infIzq arriba, supDer = infIzq atras, infDer = supIzq atras }
		abajoAux = Cara { supIzq = infDer frente, infIzq = supDer frente, supDer = supDer abajo, infDer = infDer abajo }
		frenteAux = Cara { supIzq = supIzq frente, infIzq = infIzq frente, supDer = supDer arriba, infDer = infDer arriba }
		atrasAux = Cara { supIzq = supIzq abajo, infIzq = infIzq abajo, supDer = supDer atras, infDer = infDer atras }
		derechaAux = Cara { supIzq = supDer derecha, infIzq = supIzq derecha, supDer = infDer derecha, infDer = infIzq derecha }

-- La cara de abajo se mueve arriba
darVueltaCuboAbajo :: Cubo -> Cubo
darVueltaCuboAbajo (Cubo arriba abajo frente atras izquierda derecha) = Cubo arribaAux abajoAux frenteAux atrasAux izquierdaAux derechaAux
	where
		arribaAux = Cara { supIzq = supIzq abajo, infIzq = infIzq abajo, supDer = supDer abajo, infDer = infDer abajo }
		abajoAux = Cara { supIzq = supIzq arriba, infIzq = infIzq arriba, supDer = supDer arriba, infDer = infDer arriba }
		frenteAux = Cara { supIzq = infDer frente, infIzq = supDer frente, supDer = infIzq frente, infDer = supIzq frente }
		atrasAux = Cara { supIzq = infDer atras, infIzq = supDer atras, supDer = infIzq atras, infDer = supIzq atras }
		izquierdaAux = Cara { supIzq = infDer derecha, infIzq = supDer derecha, supDer = infIzq derecha, infDer = supIzq derecha }
		derechaAux = Cara { supIzq = infDer izquierda, infIzq = supDer izquierda, supDer = infIzq izquierda, infDer = supIzq izquierda }

-- La cara izquierda se mueve arriba
darVueltaCuboIzquierda :: Cubo -> Cubo
darVueltaCuboIzquierda (Cubo arriba abajo frente atras izquierda derecha) = Cubo arribaAux abajoAux frenteAux atrasAux izquierdaAux derechaAux
  where
    arribaAux = Cara { supIzq = infIzq izquierda, infIzq = infDer izquierda, supDer = supIzq izquierda, infDer = supDer izquierda }
    abajoAux = Cara { supIzq = supIzq derecha, infIzq = infIzq derecha, supDer = supDer derecha, infDer = infDer derecha }
    frenteAux = Cara { supIzq = infIzq frente, infIzq = infDer frente, supDer = supIzq frente, infDer = supDer frente }
    atrasAux = Cara { supIzq = supDer atras, infIzq = supIzq atras, supDer = infDer atras, infDer = infIzq atras }
    izquierdaAux = Cara { supIzq = supDer abajo, infIzq = supIzq abajo, supDer = infDer abajo, infDer = infIzq abajo }
    derechaAux = Cara { supIzq = infIzq arriba, infIzq = infDer arriba, supDer = supIzq arriba, infDer = supDer arriba }

-- La cara derecha se mueve arriba
darVueltaCuboDerecha :: Cubo -> Cubo
darVueltaCuboDerecha (Cubo arriba abajo frente atras izquierda derecha) = Cubo arribaAux abajoAux frenteAux atrasAux izquierdaAux derechaAux
	where
		arribaAux = Cara { supIzq = supDer derecha, infIzq = supIzq derecha, supDer = infDer derecha, infDer = infIzq derecha }
		abajoAux = Cara { supIzq = infIzq izquierda, infIzq = infDer izquierda, supDer = supIzq izquierda, infDer = supDer izquierda }
		frenteAux = Cara { supIzq = supDer frente, infIzq = supIzq frente, supDer = infDer frente, infDer = infIzq frente }
		atrasAux = Cara { supIzq = supDer atras, infIzq = supIzq atras, supDer = infDer atras, infDer = infIzq atras }
		izquierdaAux = Cara { supIzq = supDer arriba, infIzq = supIzq arriba, supDer = infDer arriba, infDer = infIzq arriba }
		derechaAux = Cara { supIzq = infIzq abajo, infIzq = infDer abajo, supDer = supIzq abajo, infDer = supDer abajo }

-- La cara de frente se mueve arriba
darVueltaCuboFrente :: Cubo -> Cubo
darVueltaCuboFrente (Cubo arriba abajo frente atras izquierda derecha) = Cubo arribaAux abajoAux frenteAux atrasAux izquierdaAux derechaAux
	where
		arribaAux = Cara { supIzq = supIzq frente, infIzq = infIzq frente, supDer = supDer frente, infDer = infDer frente }
		abajoAux = Cara { supIzq = supIzq atras, infIzq = infIzq atras, supDer = supDer atras, infDer = infDer atras }
		frenteAux = Cara { supIzq = infDer abajo, infIzq = supDer abajo, supDer = infIzq abajo, infDer = supIzq abajo }
		atrasAux = Cara { supIzq = infDer arriba, infIzq = supDer arriba, supDer = infIzq arriba, infDer = supIzq arriba }
		izquierdaAux = Cara { supIzq = supDer izquierda, infIzq = supIzq izquierda, supDer = infDer izquierda, infDer = infIzq izquierda }
		derechaAux = Cara { supIzq = infIzq derecha, infIzq = infDer derecha, supDer = supIzq derecha, infDer = supDer derecha }

-- La cara de atrás se mueve arriba
darVueltaCuboAtras :: Cubo -> Cubo
darVueltaCuboAtras (Cubo arriba abajo frente atras izquierda derecha) = Cubo arribaAux abajoAux frenteAux atrasAux izquierdaAux derechaAux
	where
		arribaAux = Cara { supIzq = infDer atras, infIzq = supDer atras, supDer = infIzq atras, infDer = supIzq atras }
		abajoAux = Cara { supIzq = infDer frente, infIzq = supDer frente, supDer = infIzq frente, infDer = supIzq frente }
		frenteAux = Cara { supIzq = supIzq arriba, infIzq = infIzq arriba, supDer = supDer arriba, infDer = infDer arriba }
		atrasAux = Cara { supIzq = supIzq abajo, infIzq = infIzq abajo, supDer = supDer abajo, infDer = infDer abajo }
		izquierdaAux = Cara { supIzq = infIzq izquierda, infIzq = infDer izquierda, supDer = supIzq izquierda, infDer = supDer izquierda }
		derechaAux = Cara { supIzq = supDer derecha, infIzq = supIzq derecha, supDer = infDer derecha, infDer = infIzq derecha }

aplicarMovimiento :: Cubo -> Movimiento -> Cubo
aplicarMovimiento cubo movimiento =
	case movimiento of
			U -> rotarArribaHorario cubo
			U' -> rotarArribaAntihorario cubo
			D -> rotarAbajoHorario cubo
			D' -> rotarAbajoAntihorario cubo
			F -> rotarFrenteHorario cubo
			F' -> rotarFrenteAntihorario cubo
			B -> rotarAtrasHorario cubo
			B' -> rotarAtrasAntihorario cubo
			L -> rotarIzquierdaHorario cubo
			L' -> rotarIzquierdaAntihorario cubo
			R -> rotarDerechaHorario cubo
			R' -> rotarDerechaAntihorario cubo
			VueltaAbajo -> darVueltaCuboAbajo cubo
			VueltaIzquierda -> darVueltaCuboIzquierda cubo
			VueltaDerecha -> darVueltaCuboDerecha cubo
			VueltaFrente -> darVueltaCuboFrente cubo
			VueltaAtras -> darVueltaCuboAtras cubo

aplicarListaMovimientos:: Cubo -> [Movimiento] -> Cubo
aplicarListaMovimientos cubo [] = cubo
aplicarListaMovimientos cubo [x] = aplicarMovimiento cubo x
aplicarListaMovimientos cubo (x:xs) = aplicarListaMovimientos (aplicarMovimiento cubo x)  xs



-- Comprobar en una determinada cara si las piezas superiores son del mismo color y si las piezas inferiores son del mismo color
comCar2a2 :: Cara -> Bool
comCar2a2 (Cara supIzq infIzq supDer infDer) =
	getColorPieza supIzq == getColorPieza supDer &&
	getColorPieza infIzq == getColorPieza infDer
	
-- Comprobar si la función anterior se cumple para las caras frente, atras, izquierda y derecha de un cubo determinado
comCub2a2 :: Cubo -> Bool
comCub2a2 (Cubo arriba abajo frente atras izquierda derecha) =
	comCar2a2 frente &&
	comCar2a2 atras &&
	comCar2a2 izquierda &&
	comCar2a2 derecha