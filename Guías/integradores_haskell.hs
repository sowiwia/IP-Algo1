--EJERCICIO 1
-- ejemplo:
-- hayQueCodificar 'a' [('a','b')]
-- True

hayQueCodificar :: Char -> [(Char, Char)] -> Bool
hayQueCodificar a [] = False
hayQueCodificar a ((x,y):xs)
    | a == x = True
    | otherwise = hayQueCodificar a xs

--EJERCICIO 2
-- ejemplo:
-- cuantasVecesHayQueCodificar 'a' ['h','o','l','a','a'] [('a','i')]
-- 2

cantidadDeRepeticiones :: Char -> String -> Int
cantidadDeRepeticiones _ [] = 0
cantidadDeRepeticiones caracter (x:xs)
    | caracter == x = 1 + cantidadDeRepeticiones caracter xs
    | otherwise = cantidadDeRepeticiones caracter xs

cuantasVecesHayQueCodificar :: Char -> String -> [(Char, Char)] -> Int
cuantasVecesHayQueCodificar caracter frase [] = 0
cuantasVecesHayQueCodificar caracter frase mapeo
    | hayQueCodificar caracter mapeo = cantidadDeRepeticiones caracter frase
    | otherwise = 0

--EJERCICIO 3
-- ejemplo:
-- laQueMasHayQueCodificar ['h','o','l','a','a'] [('a','i')]
-- 'a'

laQueMasSeRepite :: String -> Char
laQueMasSeRepite [] = ' '
laQueMasSeRepite [x] = x
laQueMasSeRepite (x:y:xs)
    | cantidadDeRepeticiones x (x:xs) >= cantidadDeRepeticiones y (y:xs) = x
    | otherwise = laQueMasSeRepite xs

laQueMasHayQueCodificar :: String -> [(Char, Char)] -> Char
laQueMasHayQueCodificar frase [] = ' '
laQueMasHayQueCodificar [f] mapeo = f
laQueMasHayQueCodificar (f:fs) mapeo
    | hayQueCodificar f mapeo = laQueMasSeRepite (f:fs)
    | otherwise = laQueMasHayQueCodificar fs mapeo

-- EJERCICIO 4
-- ejemplo:
-- codificarFrase ['h','o','l','a'] [('a','i')]
-- "holi"

codificarLetra :: Char -> [(Char,Char)] -> Char
codificarLetra letra [] = letra
codificarLetra letra ((x,y):xs)
    | letra == x = y
    | otherwise = codificarLetra letra xs

codificarFrase :: [Char] -> [(Char,Char)] -> [Char]
codificarFrase [] _ = []
codificarFrase (f:fs) mapeo = codificarLetra f mapeo : codificarFrase fs mapeo

-- Número natural perfecto:
-- Cuando la suma de sus divisores propios, (números
-- que lo dividen menores a él) es igual al mismo número.
-- Ejemplo : 6 es perfecto, sus divisores propios
-- son 1, 2 y 3.

-- Números naturales amigos:
-- Si cada uno de ellos se obtiene sumando los divisores
-- propios del otro, por ejemplo, 220 y 284  son amigos
-- porque los divisores propios de 220 son 1, 2, 4, 5,
-- 10, 11, 20, 22, 44, 55 y 110 que sumados dan 284.
-- Y los divisores propios de 284 son 1, 2, 4, 71, 142
-- que sumados dan 220.

-- EJERCICIO 1:
-- ejemplo:
-- divisoresPropios 8
-- [1,2,4]

divisoresPropios :: Int -> [Int]
divisoresPropios n = hallarDivisores n 1

hallarDivisores :: Int -> Int -> [Int]
hallarDivisores divisor numero
  | divisor >= numero = []
  | mod numero divisor == 0  = divisor : hallarDivisores (divisor + 1) numero
  | otherwise = hallarDivisores (divisor + 1) numero

-- EJERCICIO 2:
-- qvq sumaDeDivisoresPropios n = m && sumaDeDivisoresPropios m = n
-- ejemplo sonAmigos 284 220
-- True

sonAmigos :: Int -> Int -> Bool
sonAmigos n m
    | sumaDivisoresPropios n == m && sumaDivisoresPropios m == n = True
    | otherwise = False

sumaDivisoresPropios :: Int -> Int
sumaDivisoresPropios n = sumaDivisores n 1

sumaDivisores :: Int -> Int -> Int
sumaDivisores numero divisor
  | divisor >= numero = 0
  | mod numero divisor == 0 = divisor + sumaDivisores numero (divisor + 1) 
  | otherwise = sumaDivisores numero (divisor + 1)

-- EJERCICIO 3:

esPerfecto :: Int -> Bool
esPerfecto 0 = False
esPerfecto 1 = False
esPerfecto n
    | sumaDivisoresPropios n == n = True
    | otherwise = False

losPrimerosNPerfectos :: Int -> [Int]
losPrimerosNPerfectos n = hallarPerfectos n 2

hallarPerfectos :: Int -> Int -> [Int]
hallarPerfectos 0 _ = []
hallarPerfectos n m
  | esPerfecto m = m : hallarPerfectos (n - 1) (m + 1)
  | otherwise = hallarPerfectos n (m + 1)

-- EJERCICIO 4:

tuplaDeAmigos :: Int -> [Int] -> [(Int, Int)]
tuplaDeAmigos _ [] = []
tuplaDeAmigos n (x:xs)
  | sonAmigos n x = (n,x) : tuplaDeAmigos n xs
  | otherwise = tuplaDeAmigos n xs

listaDeAmigos :: [Int] -> [(Int, Int)]
listaDeAmigos [] = []
listaDeAmigos (x:xs) = tuplaDeAmigos x xs ++ listaDeAmigos xs

-- EJERCICIO 1

-- no es válida si se repite ("Ana","Ana")
-- no es válida si se duplica ("Ana","María")
-- ("María","María")

relacionPropia :: [(String,String)] -> Bool
relacionPropia [] = False
relacionPropia ((x,y):xs)
    | x == y = True
    | otherwise = relacionPropia xs

relacionesDuplicadas:: [(String,String)] -> Bool
relacionesDuplicadas [] = False
relacionesDuplicadas ((x,y):(m,n):xs)
    | ( x == n && y == m ) || (x == m && y == n) = True
    | otherwise = False

relacionesValidas :: [(String,String)] -> Bool
relacionesValidas [] = False
relacionesValidas (x:xs)
    | relacionPropia (x:xs) || relacionesDuplicadas (x:xs) = False
    | otherwise = True

-- EJERCICIO 2:
-- ejemplo:
-- personas [("Maria","Mimi"),("Maria","Pepe"),("Juan","Pepe")]
-- devuelve : ["Maria", "Mimi","Pepe","Juan"]

quitarRepe :: [String] -> [String]
quitarRepe [] = []
quitarRepe [x] = [x]
quitarRepe (x:xs)
    | pertenece x xs = quitarRepe xs
    | otherwise = x : quitarRepe xs

pertenece :: String -> [String] -> Bool
pertenece _ [] = False
pertenece e (x:xs)
    | e == x = True
    | otherwise = pertenece e xs

personas :: [(String, String)] -> [String]
personas [] = []
personas ((x, y):xs) = quitarRepe ([x, y] ++ personas xs)

-- EJERCICIO 3:

amigosDe :: String -> [(String,String)] -> [String]
amigosDe _ [] = []
amigosDe persona ((x,y):xs)
    | persona == x = y : amigosDe persona xs
    | persona == y = x : amigosDe persona xs
    | otherwise = amigosDe persona xs

-- EJERCICIO 4:

cantAmigos :: String -> [(String,String)] -> Int
cantAmigos _ [] = 0
cantAmigos persona ((x,y):xs)
    | persona == x = 1 + cantAmigos persona xs
    | persona == y = 1 + cantAmigos persona xs
    | otherwise = cantAmigos persona xs

comparoCantAmigos :: [String] -> [(String, String)] -> String
comparoCantAmigos [] _ = " "
comparoCantAmigos [x] relaciones = x
comparoCantAmigos (x:xs) relaciones
    | cantAmigos x relaciones >= cantAmigos (comparoCantAmigos xs relaciones) relaciones = x
    | otherwise = comparoCantAmigos xs relaciones

personaConMasAmigos :: [(String, String)] -> String
personaConMasAmigos relaciones = comparoCantAmigos (personas relaciones) relaciones

{-
La mercaderia es una secuencia de nombre de productos y pueden repetirse, el stock va a ser del tipo:
[(tornillos,2), (tuercas, 1)]

Hay una lista de precios del tipo:
[(tornillos, 1000), (tuercas, 500)] 

___________________

EJERCICIO 1:

Tengo una lista de productos tipo:
[manzana, pera, naranja, pera, naranja, pera]

La función me tendría que devolver
[(manzana, 1), (pera, 3), (naranja,2)]

Así que tendría que hacer una función que cuente la cantidad de apariciones de un elemento en una lista, y para que no se repitan usar otra función para quitar apariciones de un elemento en una lista
-}

generarStock :: [String] -> [(String, Int)]
generarStock [] = []
generarStock (x:xs) = (x, cantApariciones x (x:xs)) : generarStock (quitar x xs)

cantApariciones :: String -> [String] -> Int
cantApariciones _ [] = 0
cantApariciones producto (x:xs)
    | producto == x = 1 + cantApariciones producto xs
    | otherwise = cantApariciones producto xs

quitar :: String -> [String] -> [String]
quitar _ [] = []
quitar e (x:xs)
    | e == x = quitar e xs
    | otherwise = x : quitar e xs

{-

--EJERCICIO 2:

El enunciado tiene un error, le falta el dato de salida, debería ser:
stockDeProducto :: [(String, Int)] -> String -> Int

ejemplo:
[("manzana", 1), ("pera",3), ("naranja",2)] "pera"
devuelve: 3

-}

stockDeProducto :: [(String, Int)] -> String -> Int
stockDeProducto [] _ = 0
stockDeProducto ((prod, stock):xs) producto
    | producto == prod = stock
    | otherwise = stockDeProducto xs producto

{-

EJERCICIO 3:

A la función le das una lista de stock con (producto, stock) y una lista con precios (producto, precios), y te tiene que devolver el valor total de los productos en stock (precios x stock)

[("manzana", 2), ("pera", 4), ("naranja", 3)] [("manzana", 1200.75), ("pera", 800.50), ("naranja", 500.25)]

devuelve: 6102.50

"manzana": 2 × 1200.75 = 2401.50
"pera": 4 × 800.50 = 3202.00
"naranja": 3 × 500.25 = 1500.75

=> 2401.50 + 3202.00 + 1500.75 = 6102.50

-}

dineroEnStock :: [(String, Int)] -> [(String, Float)] -> Float
dineroEnStock [] _ = 0
dineroEnStock ((producto, stock):xs) precios =
    (fromIntegral stock * verPrecio producto precios) + dineroEnStock xs precios

verPrecio :: String -> [(String, Float)] -> Float
verPrecio _ [] = 0
verPrecio producto ((p, precio):xs)
    | producto == p = precio
    | otherwise = verPrecio producto xs

{-

EJERCICIO 4:

Si compras más de 10 productos, multiplico el precio por 0.80 para hacer un descuento
si compras 10 productos o menos, se queda igual :)

ejemplo:

[("manzana", 6), ("pera", 6)] [("manzana", 1200.75), ("pera", 800.50)]

devuelve : [("manzana", 960.6), ("pera", 640.4)]

-}

aplicarOferta :: [(String, Int)] -> [(String, Float)] -> [(String, Float)]
aplicarOferta [] precios = precios
aplicarOferta stock [] = []
aplicarOferta stock ((producto, precio):xs)
    | stockDeProducto stock producto > 10 = (producto, precio * 0.80) : aplicarOferta stock xs
    | otherwise = (producto, precio) : aplicarOferta stock xs

-- Sistema Universitario
-- La info del alumno es del tipo ["María Jimenez",[6,10,4]]
-- Nombre y notas

-- EJERCICIO 1

-- ejemplo:
-- aproboMasDeNMaterias [("Maria Jimenez",[5,7,3,2]),("Marcos Gil",[2,5,8,10])] "Maria Jimenez" 3
-- False

aprobado :: Integer -> Bool
aprobado n
    | n >= 4 = True
    | otherwise = False

cuantasMateriasAprobo :: [Integer] -> Integer
cuantasMateriasAprobo [] = 0
cuantasMateriasAprobo (x:xs)
    | aprobado x = 1 + cuantasMateriasAprobo xs
    | otherwise = cuantasMateriasAprobo xs

aproboMasDeNMaterias :: [(String, [Integer])] -> String -> Integer -> Bool
aproboMasDeNMaterias [] _ _ = False
aproboMasDeNMaterias ((nombre,notas):xs) alumno n
    | cuantasMateriasAprobo notas >= n = True
    | otherwise = False

-- EJERCICIO 2:

promedio :: [Integer] -> Float
promedio [] = 0
promedio notas = fromIntegral (sumaNotas notas) / fromIntegral (longitud notas)

sumaNotas :: [Integer] -> Integer
sumaNotas [] = 0
sumaNotas [x] = x
sumaNotas (x:xs) = x + sumaNotas xs

longitud :: [Integer] -> Integer
longitud [] = 0
longitud [x] = 1
longitud (x:xs) = 1 + longitud xs

buenPromedio :: [Integer] -> Bool
buenPromedio [] = False
buenPromedio notas
    | promedio notas >= 8 = True
    | otherwise = False

sinAplazos :: [Integer] -> Bool
sinAplazos [] = True
sinAplazos notas
    | cuantasMateriasAprobo notas == longitud notas = True
    | otherwise = False

buenosAlumnos :: [(String, [Integer])] -> [String]
buenosAlumnos [] = []
buenosAlumnos ((nombre,nota):xs)
    | sinAplazos nota && buenPromedio nota = nombre : buenosAlumnos xs
    | otherwise = buenosAlumnos xs

-- EJERCICIO 3:

mejorPromedio :: [(String,[Integer])] -> String
mejorPromedio [(alumno, _)] = alumno
mejorPromedio ((alumno1, nota1):(alumno2, nota2):xs)
    | promedio nota1 >= promedio nota2 = mejorPromedio ((alumno1, nota1):xs)
    | otherwise = mejorPromedio ((alumno2, nota2):xs)

-- EJERCICIO 4:

type CantidadDeMateriasDeLaCarrera = Integer

buscarNotas :: String -> [(String,[Integer])] -> [Integer]
buscarNotas _ [] = []
buscarNotas alumno ((alumnoGuardado, nota):registro)
    | alumno == alumnoGuardado = nota

seGraduoConHonores :: [(String, [Integer])] -> CantidadDeMateriasDeLaCarrera -> String -> Bool
seGraduoConHonores registro cantMaterias alumno
    | aproboMasDeNMaterias registro alumno (cantMaterias - 1) && pertenece alumno (buenosAlumnos registro) && promedio (buscarNotas alumno registro) >= promedio (buscarNotas (mejorPromedio registro) registro) - 1 = True
    | otherwise = False
    
-- renombres de tipo:
type Fila = [Int]
type Tablero = [Fila]
type Posicion = (Int, Int)
type Camino = [Posicion]

{-
EJERCICIO 1)

maximo [[1,0,0,4],[6,0,0,0]]

devuelve: 6

primero debería hacer una función que busque el máximo de una fila por separado
-}

maximoFila :: Fila -> Int
maximoFila [x] = x
maximoFila (x:y:xs)
    | x >= y = maximoFila (x:xs)
    | otherwise = maximoFila (y:xs)

maximo :: Tablero -> Int
maximo [x] = maximoFila x
maximo (x:xs)
    | maximoFila x >= maximo xs = maximoFila x
    | otherwise = maximo xs

{-
EJERCICIO 2:

ejemplo:
masRepetido [[1,0,0,4],[6,0,0,0],[1,1,0,0]]
devuelve: 0
-}

repeticiones :: Int -> Fila -> Int
repeticiones _ [] = 0
repeticiones n (x:xs)
    | n == x = 1 + repeticiones n xs 
    | otherwise = repeticiones n xs

masRepetidoFilas :: Fila -> Int
masRepetidoFilas [x] = x
masRepetidoFilas (x:xs)
    | repeticiones x (x:xs) >= repeticiones (masRepetidoFilas xs) xs = x
    | otherwise = masRepetidoFilas xs

aplanarTablero :: Tablero -> Fila
aplanarTablero [] = []
aplanarTablero [x] = x
aplanarTablero (x:xs) = x ++ aplanarTablero xs

masRepetido :: Tablero -> Int
masRepetido x = masRepetidoFilas (aplanarTablero x)

{-
EJERCICIO 3:
recordar que el camino es la lista de la posicion dada por (Int,Int)

es básicamente mapear los valores de todas las posiciones que forman parte de un camino en la matriz
si tengo un tablero:
[[1,2,3,4],
[1,5,7,8],
[6,8,3,5]]

valoresDeCamino [[1,2,3,4], [1,5,7,8], [6,8,3,5]] [(1,1), (2,2), (3,2)]
devuelve: [1,5,8]
-}

valoresDeCamino :: Tablero -> Camino -> [Int]
valoresDeCamino _ [] = []
valoresDeCamino tablero (x:xs) = valorEnPosicion tablero x : valoresDeCamino tablero xs

valorEnPosicion :: Tablero -> Posicion -> Int
valorEnPosicion tablero (i, j) = obtenerElemento (obtenerFila tablero i) j

obtenerFila :: Tablero -> Int -> Fila
obtenerFila (x:xs) 1 = x
obtenerFila (_:xs) i = obtenerFila xs (i - 1)

obtenerElemento :: Fila -> Int -> Int
obtenerElemento (x:xs) 1 = x
obtenerElemento (_:xs) j = obtenerElemento xs (j - 1)

-- Las tuplas [(String, String)] van a ser tipo
-- [("Presidente","Vicepresidente")]

-- Si la lista de fórmulas es [("Juan","Susana"),("María","Pablo")]
-- y la lista de votos [34, 56], representa los votos de cada una.

--EJERCICIO 1

-- ejemplo:
-- porcentajeDeVotosAfirmativos [("Juan","Susana"),("María","Pablo")] [34,56] 90
-- 100%
-- calcula el porcentaje de votos que no fueron en blanco

porcentajeDeVotosAfirmativos :: [(String, String)] -> [Int] -> Int -> Float
porcentajeDeVotosAfirmativos formula votos totales = division (votosAfirmativos votos * 100) totales

votosAfirmativos :: [Int] -> Int
votosAfirmativos [] = 0
votosAfirmativos (x:xs) = x + votosAfirmativos xs

division :: Int -> Int -> Float
division a b = fromIntegral a / fromIntegral b

-- EJERCICIO 2:
-- ejemplo:
-- formulasInvalidas [("Pepe","Pepe")]
-- True

-- formulasInvalidas [("Pepe","Epep"),("Pepe","Papa")]
-- True

candidatoDoble :: [(String,String)] -> Bool
candidatoDoble [] = False
candidatoDoble ((x,y):xs)
    | x == y = True
    | otherwise = candidatoDoble xs

candidatoRepe :: [(String,String)] -> Bool
candidatoRepe [] = False
candidatoRepe ((x,y):(m,z):xs)
    | x == m || y == z || y == m || x == z = True
    | otherwise = candidatoRepe xs

formulasInvalidas :: [(String,String)] -> Bool
formulasInvalidas formula = candidatoDoble formula || candidatoRepe formula

-- EJERCICIO 3:

votosVice :: String -> [(String, String)] -> [Int] -> Int
votosVice vice [] votos = 0
votosVice vice formula [] = 0
votosVice vice ((_,v):xs) (y:ys)
    | vice == v = y
    | otherwise = votosVice vice xs ys

porcentajeDeVotos :: String -> [(String, String)] -> [Int] -> Float
porcentajeDeVotos vice formulas votos = division (votosVice vice formulas votos) (votosAfirmativos votos) * 100

-- EJERCICIO 4:

menosVotado :: [(String, String)] -> [Int] -> (String,String)
menosVotado [x] [_] = x
menosVotado (presi1:presi2:xs) (votos1:votos2:vs)
    | votos1 < votos2 = menosVotado (presi1:xs) (votos1:vs)
    | otherwise = menosVotado (presi2:xs) (votos2:vs)