module RCaraB where
import Cubo

listaMovimientosCaraBlanca::[Movimiento]
listaMovimientosCaraBlanca = [U, R, L', D']

siguientesCaraBlanca :: Cubo -> Arbol
siguientesCaraBlanca cubo = [(aplicarMovimiento cubo mov, mov) | mov <-listaMovimientosCaraBlanca]

resolverCaraBlanca :: Cubo -> [Movimiento] -> [[Movimiento]]
resolverCaraBlanca cuboInicio movimiento = anchura [(movimiento, cuboInicio)]
  where
    anchura [] = []
    anchura ((movimiento, cubo):xs)
      | all(==Blanco) (getColoresCara(getCaraArriba(cubo))) =  [movimiento]
	  | all(==Blanco) (getColoresCara(getCaraAbajo(cubo))) = [movimiento++[VueltaAbajo]]
	  | all(==Blanco) (getColoresCara(getCaraIzquierda(cubo))) = [movimiento++[VueltaIzquierda]]
	  | all(==Blanco) (getColoresCara(getCaraDerecha(cubo))) =  [movimiento++[VueltaDerecha]]
	  | all(==Blanco) (getColoresCara(getCaraAtras(cubo))) =  [movimiento++[VueltaAtras]]
	  | all(==Blanco) (getColoresCara(getCaraFrente(cubo))) =  [movimiento++[VueltaFrente]]
	  -- Se generan todos los movimientos posibles y se obtienen los nuevos estados: (estado, movimiento). Esto se añade a la lista.
      | otherwise =  anchura (xs++[(movimiento ++ [movimiento2], cuboSiguiente) | (cuboSiguiente, movimiento2) <- siguientesCaraBlanca cubo] )