module RCapaM where
import Cubo




girarHastaAlinear :: Cubo->[Movimiento]
girarHastaAlinear cubo =
	if getColorPieza(infIzq(getCaraFrente(cubo))) == getColorPieza(supIzq(getCaraFrente(cubo)))	then []
	else [U] ++ (girarHastaAlinear(aplicarMovimiento cubo U))



resolverCapasMedio :: Cubo->[Movimiento]
resolverCapasMedio (Cubo arriba abajo frente atras izquierda derecha) =
	if getColorPieza(supIzq(frente)) == getColorPieza(supDer(frente)) &&
						getColorPieza(supIzq(derecha)) == getColorPieza(supDer(derecha)) &&
						getColorPieza(supIzq(izquierda)) == getColorPieza(supDer(izquierda)) &&
						getColorPieza(supIzq(atras)) == getColorPieza(supDer(atras))
							then do
							
								-- Caso Resuelto + No resuelto
								if getColorPieza(infIzq(frente)) /= getColorPieza(infDer(frente)) &&
									getColorPieza(infIzq(derecha)) /= getColorPieza(infDer(derecha)) &&
									getColorPieza(infIzq(izquierda)) /= getColorPieza(infDer(izquierda)) &&
									getColorPieza(infIzq(atras)) /= getColorPieza(infDer(atras))
										then [VueltaAbajo, F, R, U', R', U', R, U, R', F', R, U, R', U', R', F, R, F']
												
								-- Caso Resuelto + Bloque de dos
								else if getColorPieza(infIzq(derecha)) == getColorPieza(infDer(derecha))
									then [VueltaAbajo, R, U, R', U', R', F, R, R, U', R', U', R, U, R', F']
								else if getColorPieza(infIzq(frente)) == getColorPieza(infDer(frente))
									then [VueltaAbajo, U, R, U, R', U', R', F, R, R, U', R', U', R, U, R', F']
								else if getColorPieza(infIzq(izquierda)) == getColorPieza(infDer(izquierda))
									then [VueltaAbajo, U, U, R, U, R', U', R', F, R, R, U', R', U', R, U, R', F']
								else if getColorPieza(infIzq(atras)) == getColorPieza(infDer(atras))
									then [VueltaAbajo, U', R, U, R', U', R', F, R, R, U', R', U', R, U, R', F']
								else []
	else if getColorPieza(infIzq(frente)) == getColorPieza(infDer(frente)) &&
			getColorPieza(infIzq(derecha)) == getColorPieza(infDer(derecha)) &&
			getColorPieza(infIzq(izquierda)) == getColorPieza(infDer(izquierda)) &&
			getColorPieza(infIzq(atras)) == getColorPieza(infDer(atras))
				then do
				
					-- Caso Resuelto + No resuelto
					if getColorPieza(supIzq(frente)) /= getColorPieza(supDer(frente)) &&
						getColorPieza(supIzq(derecha)) /= getColorPieza(supDer(derecha)) &&
						getColorPieza(supIzq(izquierda)) /= getColorPieza(supDer(izquierda)) &&
						getColorPieza(supIzq(atras)) /= getColorPieza(supDer(atras))
							then [F, R, U', R', U', R, U, R', F', R, U, R', U', R', F, R, F']
									
					-- Caso Resuelto + Bloque de dos
					else if getColorPieza(supIzq(derecha)) == getColorPieza(supDer(derecha))
						then [U, U, R, U, R', U', R', F, R, R, U', R', U', R, U, R', F']
					else if getColorPieza(supIzq(frente)) == getColorPieza(supDer(frente))
						then [U, R, U, R', U', R', F, R, R, U', R', U', R, U, R', F']
					else if getColorPieza(supIzq(izquierda)) == getColorPieza(supDer(izquierda))
						then [R, U, R', U', R', F, R, R, U', R', U', R, U, R', F']
					else if getColorPieza(supIzq(atras)) == getColorPieza(supDer(atras))
						then [U', R, U, R', U', R', F, R, R, U', R', U', R, U, R', F']
					else []
					
	-- Caso Bloque de dos + Bloque de dos
	else if getColorPieza(supIzq(frente)) == getColorPieza(supDer(frente)) &&
			getColorPieza(infIzq(frente)) == getColorPieza(infDer(frente))
				then [R, R, U', B, B, U, U, R, R, U', R, R]
	else if getColorPieza(supIzq(frente)) == getColorPieza(supDer(frente)) &&
			getColorPieza(infIzq(derecha)) == getColorPieza(infDer(derecha))
				then [D', R, R, U', B, B, U, U, R, R, U', R, R]
	else if getColorPieza(supIzq(frente)) == getColorPieza(supDer(frente)) &&
			getColorPieza(infIzq(izquierda)) == getColorPieza(infDer(izquierda))
				then [D, R, R, U', B, B, U, U, R, R, U', R, R]
	else if getColorPieza(supIzq(frente)) == getColorPieza(supDer(frente)) &&
			getColorPieza(infIzq(atras)) == getColorPieza(infDer(atras))
				then [D, D, R, R, U', B, B, U, U, R, R, U', R, R]
	else if getColorPieza(infIzq(frente)) == getColorPieza(infDer(frente)) &&
			getColorPieza(supIzq(derecha)) == getColorPieza(supDer(derecha))
				then [U, R, R, U', B, B, U, U, R, R, U', R, R]
	else if getColorPieza(infIzq(frente)) == getColorPieza(infDer(frente)) &&
			getColorPieza(supIzq(izquierda)) == getColorPieza(supDer(izquierda))
				then [U', R, R, U', B, B, U, U, R, R, U', R, R]
	else if getColorPieza(infIzq(frente)) == getColorPieza(infDer(frente)) &&
			getColorPieza(supIzq(atras)) == getColorPieza(supDer(atras))
				then [U, U, R, R, U', B, B, U, U, R, R, U', R, R]
	else if getColorPieza(supIzq(derecha)) == getColorPieza(supDer(derecha)) &&
			getColorPieza(infIzq(derecha)) == getColorPieza(infDer(derecha))
				then [U, D, R, R, U', B, B, U, U, R, R, U', R, R]
	else if getColorPieza(supIzq(derecha)) == getColorPieza(supDer(derecha)) &&
			getColorPieza(infIzq(izquierda)) == getColorPieza(infDer(izquierda))
				then [U, D', R, R, U', B, B, U, U, R, R, U', R, R]
	else if getColorPieza(supIzq(derecha)) == getColorPieza(supDer(derecha)) &&
			getColorPieza(infIzq(atras)) == getColorPieza(infDer(atras))
				then [U, D, D, R, R, U', B, B, U, U, R, R, U', R, R]
	else if getColorPieza(infIzq(derecha)) == getColorPieza(infDer(derecha)) &&
			getColorPieza(supIzq(izquierda)) == getColorPieza(supDer(izquierda))
				then [U', D, R, R, U', B, B, U, U, R, R, U', R, R]
	else if getColorPieza(infIzq(derecha)) == getColorPieza(infDer(derecha)) &&
			getColorPieza(supIzq(atras)) == getColorPieza(supDer(atras))
				then [U', U', D, R, R, U', B, B, U, U, R, R, U', R, R]
	else if getColorPieza(supIzq(izquierda)) == getColorPieza(supDer(izquierda)) &&
			getColorPieza(infIzq(izquierda)) == getColorPieza(infDer(izquierda))
				then [U', D', R, R, U', B, B, U, U, R, R, U', R, R]
	else if getColorPieza(supIzq(izquierda)) == getColorPieza(supDer(izquierda)) &&
			getColorPieza(infIzq(atras)) == getColorPieza(infDer(atras))
				then [U', D, D, R, R, U', B, B, U, U, R, R, U', R, R]
	else if getColorPieza(infIzq(izquierda)) == getColorPieza(infDer(izquierda)) &&
			getColorPieza(supIzq(atras)) == getColorPieza(supDer(atras))
				then [D', U, U, R, R, U', B, B, U, U, R, R, U', R, R]
	else if getColorPieza(supIzq(atras)) == getColorPieza(supDer(atras)) &&
			getColorPieza(infIzq(atras)) == getColorPieza(infDer(atras))
				then [U', U', D, D, R, R, U', B, B, U, U, R, R, U', R, R]
						
	-- Caso Nada + Dos
	else if getColorPieza(supIzq(frente)) /= getColorPieza(supDer(frente)) &&
			getColorPieza(supIzq(derecha)) /= getColorPieza(supDer(derecha)) &&
			getColorPieza(supIzq(izquierda)) /= getColorPieza(supDer(izquierda)) &&
			getColorPieza(supIzq(atras)) /= getColorPieza(supDer(atras))
				then do
					if getColorPieza(infIzq(derecha)) == getColorPieza(infDer(derecha))
						then [D', VueltaAbajo, R, U', R, F, F, R', U, R']
					else if getColorPieza(infIzq(frente)) == getColorPieza(infDer(frente))
						then [VueltaAbajo, R, U', R, F, F, R', U, R']
					else if getColorPieza(infIzq(izquierda)) == getColorPieza(infDer(izquierda))
						then [D, VueltaAbajo, R, U', R, F, F, R', U, R']
					else if getColorPieza(infIzq(atras)) == getColorPieza(infDer(atras))
						then [D', D', VueltaAbajo, R, U', R, F, F, R', U, R']
					else []
	else if getColorPieza(infIzq(frente)) /= getColorPieza(infDer(frente)) &&
			getColorPieza(infIzq(derecha)) /= getColorPieza(infDer(derecha)) &&
			getColorPieza(infIzq(izquierda)) /= getColorPieza(infDer(izquierda)) &&
			getColorPieza(infIzq(atras)) /= getColorPieza(infDer(atras))
				then do
					if getColorPieza(supIzq(derecha)) == getColorPieza(supDer(derecha))
						then [U, R, U', R, F, F, R', U, R']
					else if getColorPieza(supIzq(frente)) == getColorPieza(supDer(frente))
						then [R, U', R, F, F, R', U, R']
					else if getColorPieza(supIzq(izquierda)) == getColorPieza(supDer(izquierda))
						then [U', R, U', R, F, F, R', U, R']
					else if getColorPieza(supIzq(atras)) == getColorPieza(supDer(atras))
						then [U, U, R, U', R, F, F, R', U, R']
					else []
	else girarHastaAlinear((Cubo arriba abajo frente atras izquierda derecha)) ++ [R, R, F, F, R, R]