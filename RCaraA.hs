module RCaraA where
import Cubo




-- Caso 1: F R U R' U' F' (U)
caso1_1 :: [Movimiento]
caso1_1 = [F, R, U, R', U', F']

-- Capa superior rotada 90º en sentido horario
caso1_2 :: [Movimiento]
caso1_2 = U' : caso1_1

-- Capa superior rotada 180º
caso1_3 :: [Movimiento]
caso1_3 = [U, U] ++ caso1_1

-- Capa superior rotada 270º en sentido horario
caso1_4 :: [Movimiento]
caso1_4 = U : caso1_1



-- Caso 2: F R U R' U' R U R' U' F' (Pi)
caso2_1 :: [Movimiento]
caso2_1 = [F, R, U, R', U', R, U, R', U', F']

caso2_2 :: [Movimiento]
caso2_2 = U' : caso2_1

caso2_3 :: [Movimiento]
caso2_3 = [U, U] ++ caso2_1
			
caso2_4 :: [Movimiento]
caso2_4 = U : caso2_1


			
-- Caso 3: R2 U2 R U2 R2 (H) -> Solo tiene dos rotaciones ya que es simétrico
caso3_1 :: [Movimiento]
caso3_1 = [R, R, U, U, R, U, U, R, R]

caso3_2 :: [Movimiento]
caso3_2 = U : caso3_1



-- Caso 4: R U R' U R U2 R' (Sune)
caso4_1 :: [Movimiento]
caso4_1 = [R, U, R', U, R, U, U, R']

caso4_2 :: [Movimiento]
caso4_2 = U' : caso4_1

caso4_3 :: [Movimiento]
caso4_3 = [U, U] ++ caso4_1

caso4_4 :: [Movimiento]
caso4_4 = U : caso4_1



-- Caso 5: R U2 R' U' R U' R' (Antisune)
caso5_1 :: [Movimiento]
caso5_1 = [R, U, U, R', U', R, U', R']

caso5_2 :: [Movimiento]
caso5_2 = U' : caso5_1

caso5_3 :: [Movimiento]
caso5_3 = [U, U] ++ caso5_1

caso5_4 :: [Movimiento]
caso5_4 = U : caso5_1



-- Caso 6: R U R' U' R' F R F'
caso6_1 :: [Movimiento]
caso6_1 = [R, U, R', U', R', F, R, F']

caso6_2 :: [Movimiento]
caso6_2 = U' : caso6_1

caso6_3 :: [Movimiento]
caso6_3 = [U, U] ++ caso6_1

caso6_4 :: [Movimiento]
caso6_4 = U : caso6_1



-- Caso 7: F R U' R' U' R U R' F'
caso7_1 :: [Movimiento]
caso7_1 = [F, R, U', R', U', R, U, R', F']

caso7_2 :: [Movimiento]
caso7_2 = U' : caso7_1

caso7_3 :: [Movimiento]
caso7_3 = [U, U] ++ caso7_1

caso7_4 :: [Movimiento]
caso7_4 = U : caso7_1



todosLosCasos :: [[Movimiento]]
todosLosCasos = [caso1_1, caso1_2, caso1_3, caso1_4, caso2_1, caso2_2, caso2_3, caso2_4, caso3_1, caso3_2, caso4_1, caso4_2, caso4_3, caso4_4, caso5_1, caso5_2, caso5_3, caso5_4,
				caso6_1, caso6_2, caso6_3, caso6_4, caso7_1, caso7_2, caso7_3, caso7_4]




comprobarCaraAmarilla :: Cubo -> Bool
comprobarCaraAmarilla cubo 
    | all (== Amarillo) (getColoresCara (getCaraArriba cubo)) && all (== Blanco) (getColoresCara (getCaraAbajo cubo)) = True
    | otherwise   = False

-- Función que recorre una lista de listas de movimientos y devuelve la primera que complete la cara amarilla
recorrerCasos :: Cubo -> [[Movimiento]] -> [Movimiento]
recorrerCasos _ [] = []
recorrerCasos cubo (x:xs)
    | comprobarCaraAmarilla (aplicarListaMovimientos cubo x) = x	-- Si la cara amarilla está completa, devolvemos la lista de movimientos actual
    | otherwise = recorrerCasos cubo xs	-- Sino seguimos con la recursividad

resolverCaraAmarilla :: Cubo -> [Movimiento]
resolverCaraAmarilla cubo = recorrerCasos cubo todosLosCasos