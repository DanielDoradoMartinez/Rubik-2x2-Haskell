-- IMPORTS
import Data.List
import Cubo
import Ejemplos
import RCaraB
import RCaraA
import RCapaM
import System.Process (system)




main :: IO()
main = menu




--- MENÚS ---

-- Menú principal
menu :: IO ()
menu = do
	putStrLn "=== MENU PRINCIPAL ==="
	putStrLn "1. RESOLVER EJEMPLOS DE CUBOS"
	putStrLn "2. ROTAR CUBO RESUELTO Y RESOLVER"
	putStrLn "3. SALIR"
	putStrLn "\nSelecciona una opcion:"
	opcion <- getLine
	case opcion of
		"1" -> do
			clear
			menuEjemplos
		"2" -> do
			clear
			menuRotarCuboResuelto
		"3" -> putStrLn "Saliendo..."
		_   -> do
			clear
			putStrLn "Opcion invalida, intenta de nuevo."
			menu

-- Menú de ejemplos			
menuEjemplos :: IO ()
menuEjemplos = do
	putStrLn "MENU DE EJEMPLOS"
	putStrLn "\n1. Ejemplo 1:"
	mostrarCubo cuboEjemplo1
	putStrLn "\n2. Ejemplo 2:"
	mostrarCubo cuboEjemplo2
	putStrLn "\n3. Ejemplo 3:"
	mostrarCubo cuboEjemplo3
	putStrLn "\n4. Ejemplo 4:"
	mostrarCubo cuboEjemplo4
	putStrLn "\n5. Ejemplo 5:"
	mostrarCubo cuboEjemplo5
	putStrLn "\n6. Volver al menu principal"
	putStrLn "\nSelecciona una opcion:"
	opcion <- getLine
	case opcion of
		"1" -> do
			clear
			resolverCubo cuboEjemplo1
			putStrLn "\nPresiona Enter para volver al menu..."
			_ <- getLine  -- Pausa para que el usuario presione Enter
			clear
			menuEjemplos
		"2" -> do
			clear
			resolverCubo cuboEjemplo2
			putStrLn "\nPresiona Enter para volver al menu..."
			_ <- getLine
			clear
			menuEjemplos
		"3" -> do
			clear
			resolverCubo cuboEjemplo3
			putStrLn "\nPresiona Enter para volver al menu..."
			_ <- getLine
			clear
			menuEjemplos
		"4" -> do
			clear
			resolverCubo cuboEjemplo4
			putStrLn "\nPresiona Enter para volver al menu..."
			_ <- getLine
			clear
			menuEjemplos
		"5" -> do
			clear
			resolverCubo cuboEjemplo5
			putStrLn "\nPresiona Enter para volver al menu..."
			_ <- getLine
			clear
			menuEjemplos
		"6" -> do
			clear
			menu
		_   -> do
			clear
			putStrLn "Opcion inválida, intenta de nuevo."
			menuEjemplos

-- Menú rotar cubo resuelto		
menuRotarCuboResuelto :: IO()
menuRotarCuboResuelto = do
	putStrLn "MENU ROTAR CUBO RESUELTO"
	putStrLn "Rotar cara de arriba horario -> U"
	putStrLn "Rotar cara de arriba antihorario -> U'"
	putStrLn "Rotar cara de abajo horario -> D"
	putStrLn "Rotar cara de abajo antihorario -> D'"
	putStrLn "Rotar cara de frente horario -> F"
	putStrLn "Rotar cara de frente antihorario -> F'"
	putStrLn "Rotar cara de atras horario -> B"
	putStrLn "Rotar cara de atras antihorario -> B'"
	putStrLn "Rotar cara izquierda horario -> L"
	putStrLn "Rotar cara izquierda antihorario -> L'"
	putStrLn "Rotar cara derecha horario -> R"
	putStrLn "Rotar cara derecha antihorario -> R'"
	putStrLn "\nSelecciona las rotaciones y movimientos que deseas aplicar:"
	putStrLn "Escribe la secuencia de movimientos separados por espacios (e.g., F L' D):"
	input <- getLine	-- Leer la secuencia de movimientos del usuario
	let movimientos = parsearMovimientos input	-- Separar los movimientos por espacios
	let cubo = aplicarListaMovimientos cuboResuelto movimientos
	putStrLn "\nCubo inicial:"
	mostrarCubo cubo
	resolverCubo cubo
	putStrLn "\nPresiona Enter para volver al menu principal..."
	_ <- getLine
	clear
	menu
	
	
	

resolverCubo :: Cubo -> IO()
resolverCubo cubo = do
	-- Resolver la cara blanca y ponerla abajo
	putStrLn "\nPaso 1: Resolver la cara blanca"
	let movimientosResolverCaraBlanca = head (resolverCaraBlanca cubo []) ++ [VueltaAbajo]
	putStrLn "Movimientos para resolver la cara blanca y ponerla en la parte inferior:"
	putStrLn (show movimientosResolverCaraBlanca)
	let cuboCaraBlanca = aplicarListaMovimientos cubo movimientosResolverCaraBlanca
	putStrLn "\nCubo despues de resolver la cara blanca y situarla abajo:"
	mostrarCubo cuboCaraBlanca
    
	if not(comCub2a2 cuboCaraBlanca) then do
        -- Resolver la cara amarilla y asegurarse de que esté en la parte superior
		putStrLn "\nPaso 2: Resolver la cara amarilla (asegurarse que este en la cara superior)"
		let movimientosResolverCaraAmarilla = resolverCaraAmarilla cuboCaraBlanca ++ [VueltaAbajo]
		putStrLn "Movimientos para resolver la cara amarilla:"
		putStrLn (show movimientosResolverCaraAmarilla)
		let cuboCaraBlancaAmarilla = aplicarListaMovimientos cuboCaraBlanca movimientosResolverCaraAmarilla
		putStrLn "\nCubo despues de resolver la cara amarilla y situarla debajo:"
		mostrarCubo cuboCaraBlancaAmarilla
		
        -- Resolver las capas medias
		putStrLn "\nPaso 3: Resolver las capas medias"
		let movimientosResolverCapasMedias = resolverCapasMedio cuboCaraBlancaAmarilla
		putStrLn "Movimientos para resolver las capas medias:"
		putStrLn (show movimientosResolverCapasMedias)
		let cuboRes = aplicarListaMovimientos cuboCaraBlancaAmarilla movimientosResolverCapasMedias
		putStrLn "\nCubo despues de resolver las capas medias:"
		mostrarCubo cuboRes
		
        -- Alinear las caras
		putStrLn "\nPaso 4: Alinear las caras"
		let movimientosFinales = girarHastaAlinear cuboRes
		putStrLn "Movimientos para alinear las caras:"
		putStrLn (show movimientosFinales)
		let cuboResFinal = aplicarListaMovimientos cuboRes movimientosFinales
		putStrLn "\nCubo resuelto final:"
		mostrarCubo cuboResFinal 
	else do
        -- Alinear las caras
		putStrLn "\nPaso 4: Alinear las caras"
		let movimientosFinales = girarHastaAlinear cuboCaraBlanca
		putStrLn "Movimientos para alinear las caras:"
		putStrLn (show movimientosFinales)
		let cuboResFinal = aplicarListaMovimientos cuboCaraBlanca movimientosFinales
		putStrLn "\nCubo resuelto final:"
		mostrarCubo cuboResFinal

	
	
-- Función para convertir un String en un Movimiento
stringAMovimiento :: String -> Movimiento
stringAMovimiento str = case str of
	"U"					-> U
	"U'"				-> U'
	"D"					-> D
	"D'"				-> D'
	"F"					-> F
	"F'"				-> F'
	"B"					-> B
	"B'"				-> B'
	"L"					-> L
	"L'"				-> L'
	"R"					-> R
	"R'"				-> R'
	"VueltaAbajo" 		-> VueltaAbajo
	"VueltaIzquierda"	-> VueltaIzquierda
	"VueltaDerecha"		-> VueltaDerecha
	"VueltaFrente"		-> VueltaFrente
	"VueltaAtras"		-> VueltaAtras

-- Función para convertir una entrada en una lista de movimientos
parsearMovimientos :: String -> [Movimiento]
parsearMovimientos entrada = map stringAMovimiento (words entrada)

-- Función para limpiar la pantalla
clear :: IO ()
clear = system "cls" >> return ()