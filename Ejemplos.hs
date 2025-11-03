module Ejemplos where

import Cubo

-- EJEMPLO 1

-- Cara de arriba
caraArriba1 :: Cara
caraArriba1 = Cara { supIzq = Pieza Amarillo, infIzq = Pieza Rojo, supDer = Pieza Blanco, infDer = Pieza Verde }

-- Cara de abajo
caraAbajo1 :: Cara
caraAbajo1 = Cara { supIzq = Pieza Rojo, infIzq = Pieza Amarillo, supDer = Pieza Naranja, infDer = Pieza Azul }

-- Cara de frente
caraFrente1 :: Cara
caraFrente1 = Cara { supIzq = Pieza Verde, infIzq = Pieza Blanco, supDer = Pieza Naranja, infDer = Pieza Azul }

-- Cara de atrás
caraAtras1 :: Cara
caraAtras1 = Cara { supIzq = Pieza Verde, infIzq = Pieza Amarillo, supDer = Pieza Rojo, infDer = Pieza Azul }

-- Cara izquierda
caraIzquierda1 :: Cara
caraIzquierda1 = Cara { supIzq = Pieza Verde, infIzq = Pieza Blanco, supDer = Pieza Blanco, infDer = Pieza Rojo }

-- Cara derecha
caraDerecha1 :: Cara
caraDerecha1 = Cara { supIzq = Pieza Amarillo, infIzq = Pieza Naranja, supDer = Pieza Naranja, infDer = Pieza Azul }

cuboEjemplo1 :: Cubo
cuboEjemplo1 = Cubo { arriba = caraArriba1, abajo = caraAbajo1, frente = caraFrente1, atras = caraAtras1, izquierda = caraIzquierda1, derecha = caraDerecha1 }



-- EJEMPLO 2

-- Cara de arriba
caraArriba2 :: Cara
caraArriba2 = Cara { supIzq = Pieza Verde, infIzq = Pieza Verde, supDer = Pieza Blanco, infDer = Pieza Amarillo }

-- Cara de abajo
caraAbajo2 :: Cara
caraAbajo2 = Cara { supIzq = Pieza Verde, infIzq = Pieza Naranja, supDer = Pieza Rojo, infDer = Pieza Naranja }

-- Cara de frente
caraFrente2 :: Cara
caraFrente2 = Cara { supIzq = Pieza Rojo, infIzq = Pieza Blanco, supDer = Pieza Azul, infDer = Pieza Amarillo }

-- Cara de atrás
caraAtras2 :: Cara
caraAtras2 = Cara { supIzq = Pieza Rojo, infIzq = Pieza Naranja, supDer = Pieza Blanco, infDer = Pieza Blanco }

-- Cara izquierda
caraIzquierda2 :: Cara
caraIzquierda2 = Cara { supIzq = Pieza Naranja, infIzq = Pieza Azul, supDer = Pieza Amarillo, infDer = Pieza Azul }

-- Cara derecha
caraDerecha2 :: Cara
caraDerecha2 = Cara { supIzq = Pieza Rojo, infIzq = Pieza Azul, supDer = Pieza Verde, infDer = Pieza Amarillo }

cuboEjemplo2 :: Cubo
cuboEjemplo2 = Cubo { arriba = caraArriba2, abajo = caraAbajo2, frente = caraFrente2, atras = caraAtras2, izquierda = caraIzquierda2, derecha = caraDerecha2 }



-- EJEMPLO 3
caraArriba3 :: Cara
caraArriba3 = Cara { supIzq = Pieza Blanco, infIzq = Pieza Rojo, supDer = Pieza Naranja, infDer = Pieza Verde }

-- Cara de abajo
caraAbajo3 :: Cara
caraAbajo3 = Cara { supIzq = Pieza Rojo, infIzq = Pieza Naranja, supDer = Pieza Naranja, infDer = Pieza Azul }

-- Cara de frente
caraFrente3 :: Cara
caraFrente3 = Cara { supIzq = Pieza Azul, infIzq = Pieza Blanco, supDer = Pieza Blanco, infDer = Pieza Amarillo }

-- Cara de atrás
caraAtras3 :: Cara
caraAtras3 = Cara { supIzq = Pieza Azul, infIzq = Pieza Verde, supDer = Pieza Verde, infDer = Pieza Verde }

-- Cara izquierda
caraIzquierda3 :: Cara
caraIzquierda3 = Cara { supIzq = Pieza Rojo, infIzq = Pieza Amarillo, supDer = Pieza Amarillo, infDer = Pieza Rojo }

-- Cara derecha
caraDerecha3 :: Cara
caraDerecha3 = Cara { supIzq = Pieza Naranja, infIzq = Pieza Azul, supDer = Pieza Blanco, infDer = Pieza Amarillo }

cuboEjemplo3 :: Cubo
cuboEjemplo3 = Cubo { arriba = caraArriba3, abajo = caraAbajo3, frente = caraFrente3, atras = caraAtras3, izquierda = caraIzquierda3, derecha = caraDerecha3 }



-- EJEMPLO 4

-- Cara de arriba
caraArriba4 :: Cara
caraArriba4 = Cara { supIzq = Pieza Rojo, infIzq = Pieza Blanco, supDer = Pieza Rojo, infDer = Pieza Rojo }

-- Cara de abajo
caraAbajo4 :: Cara
caraAbajo4 = Cara { supIzq = Pieza Naranja, infIzq = Pieza Azul, supDer = Pieza Blanco, infDer = Pieza Amarillo }

-- Cara de frente
caraFrente4 :: Cara
caraFrente4 = Cara { supIzq = Pieza Rojo, infIzq = Pieza Verde, supDer = Pieza Amarillo, infDer = Pieza Blanco }

-- Cara de atrás
caraAtras4 :: Cara
caraAtras4 = Cara { supIzq = Pieza Blanco, infIzq = Pieza Azul, supDer = Pieza Verde, infDer = Pieza Verde }

-- Cara izquierda
caraIzquierda4 :: Cara
caraIzquierda4 = Cara { supIzq = Pieza Amarillo, infIzq = Pieza Naranja, supDer = Pieza Verde, infDer = Pieza Naranja }

-- Cara derecha
caraDerecha4 :: Cara
caraDerecha4 = Cara { supIzq = Pieza Azul, infIzq = Pieza Naranja, supDer = Pieza Azul, infDer = Pieza Amarillo }

cuboEjemplo4 :: Cubo
cuboEjemplo4 = Cubo { arriba = caraArriba4, abajo = caraAbajo4, frente = caraFrente4, atras = caraAtras4, izquierda = caraIzquierda4, derecha = caraDerecha4 }



-- EJEMPLO 5

-- Cara de arriba
caraArriba5 :: Cara
caraArriba5 = Cara { supIzq = Pieza Amarillo, infIzq = Pieza Azul, supDer = Pieza Naranja, infDer = Pieza Blanco}

-- Cara de abajo
caraAbajo5 :: Cara
caraAbajo5 = Cara { supIzq = Pieza Blanco, infIzq = Pieza Verde, supDer = Pieza Blanco, infDer = Pieza Blanco}

-- Cara de frente
caraFrente5 :: Cara
caraFrente5 = Cara { supIzq = Pieza Amarillo, infIzq = Pieza Rojo, supDer = Pieza Naranja, infDer = Pieza Amarillo}

-- Cara de atras
caraAtras5 :: Cara
caraAtras5 = Cara { supIzq = Pieza Amarillo, infIzq = Pieza Verde, supDer = Pieza Rojo, infDer = Pieza Naranja}

-- Cara izquierda
caraIzquierda5 :: Cara
caraIzquierda5 = Cara { supIzq = Pieza Verde, infIzq = Pieza Azul, supDer = Pieza Rojo, infDer = Pieza Azul}

-- Cara derecha
caraDerecha5 :: Cara
caraDerecha5 = Cara { supIzq = Pieza Verde, infIzq = Pieza Naranja, supDer = Pieza Azul, infDer = Pieza Rojo}

cuboEjemplo5 :: Cubo
cuboEjemplo5 = Cubo { arriba = caraArriba5, abajo = caraAbajo5, frente = caraFrente5, atras = caraAtras5, izquierda = caraIzquierda5, derecha = caraDerecha5 }




-- CUBO RESUELTO

caraBlanca :: Cara
caraBlanca = Cara { supIzq = Pieza Blanco, infIzq = Pieza Blanco, supDer = Pieza Blanco, infDer = Pieza Blanco }

caraAmarilla :: Cara
caraAmarilla = Cara { supIzq = Pieza Amarillo, infIzq = Pieza Amarillo, supDer = Pieza Amarillo, infDer = Pieza Amarillo }

caraRoja :: Cara
caraRoja = Cara { supIzq = Pieza Rojo, infIzq = Pieza Rojo, supDer = Pieza Rojo, infDer = Pieza Rojo }

caraNaranja :: Cara
caraNaranja = Cara { supIzq = Pieza Naranja, infIzq = Pieza Naranja, supDer = Pieza Naranja, infDer = Pieza Naranja }

caraVerde :: Cara
caraVerde = Cara { supIzq = Pieza Verde, infIzq = Pieza Verde, supDer = Pieza Verde, infDer = Pieza Verde }

caraAzul :: Cara
caraAzul = Cara { supIzq = Pieza Azul, infIzq = Pieza Azul, supDer = Pieza Azul, infDer = Pieza Azul }

cuboResuelto :: Cubo
cuboResuelto = Cubo { arriba = caraBlanca, abajo = caraAmarilla, frente = caraRoja, atras = caraNaranja, izquierda = caraVerde, derecha = caraAzul }