-- Ejercicio 1
cantRepe :: String -> [String] -> Int
cantRepe _ [] = 0
cantRepe e (x:xs)
    | e == x = 1 + cantRepe e xs
    | otherwise = cantRepe  e xs

quitarRepe :: String -> [String] -> [String]
quitarRepe _ [] = []
quitarRepe e (x:xs)
    | e == x = quitarRepe e xs
    | otherwise = x : quitarRepe e xs

generarStock :: [String] -> [(String, Int)]
generarStock [] = []
generarStock (x:xs) = (x, 1 + cantRepe x xs) : generarStock (quitarRepe x xs)

-- Ejercicio 2
stockDeProducto :: [(String, Int)] -> String -> Int
stockDeProducto [] _ = 0
stockDeProducto ((prod,stock):xs) producto
    | producto == prod = stock
    | otherwise = stockDeProducto xs producto

-- Ejercicio 3
--suma precios * stock de los productos

extraerPrecio :: String -> [(String, Float)] -> Float
extraerPrecio _ [] = 0
extraerPrecio producto ((prod,precio):xs)
    | producto == prod = precio
    | otherwise = extraerPrecio producto xs

dineroEnStock :: [(String, Int)] ->[(String, Float)] -> Float
dineroEnStock [] _ = 0
dineroEnStock _ [] = 0
dineroEnStock ((prod,stock):xs) precios = fromIntegral(stock) * extraerPrecio prod precios + dineroEnStock xs precios

-- Ejercicio 4
aplicarOferta :: [(String, Int)] ->[(String, Float)] ->[(String,Float)]
aplicarOferta [] _ = []
aplicarOferta _ [] = []
aplicarOferta stocks ((producto,precio):xs)
    | stockDeProducto stocks producto > 10 = (producto, precio * 0.80) : aplicarOferta stocks xs
    | otherwise = (producto, precio) : aplicarOferta stocks xs
    
-- Ejercicio 5
type Fila = [Int]
type Tablero = [Fila]
type Posicion = (Int, Int)
type Camino = [Posicion]

maximoFila :: Fila -> Int
maximoFila [] = 0
maximoFila [x] = x
maximoFila (x:y:xs)
    | y >= x = maximoFila (y:xs)
    | otherwise = maximoFila (x:xs)

maximo :: Tablero -> Int
maximo [] = 0
maximo [fila] = maximoFila fila
maximo (fila1:fila2:filas)
    | maximoFila fila2 >= maximoFila fila1 = maximo (fila2:filas)
    | otherwise = maximo (fila1:filas)

--Ejercicio 6
-- tmb se puede usar aplanando la matriz y trabajando con los nums como si fuera solo una fila

aplanar :: Tablero -> Fila
aplanar [] = []
aplanar (fila:filas) = fila ++ aplanar filas

--------------

cantRepeInt :: Int -> Fila -> Int
cantRepeInt _ [] = 0
cantRepeInt n (x:xs)
    | n == x = 1 + cantRepeInt n xs
    | otherwise = cantRepeInt n xs

masRepeFila :: Fila -> Int
masRepeFila [] = 0
masRepeFila [x] = x
masRepeFila (x:xs)
    | cantRepeInt x (x:xs) >= cantRepeInt (masRepeFila xs) (x:xs) = x
    | otherwise = masRepeFila xs
    
masRepetido :: Tablero -> Int 
masRepetido [] = 0
masRepetido [fila] = masRepeFila fila
masRepetido (fila1:fila2:filas)
    | cantRepeInt (masRepeFila fila1) fila1 >= cantRepeInt (masRepeFila fila2) fila2 = masRepetido (fila1:filas)
    | otherwise = masRepetido (fila2:filas)

-- Ejercicio 7
-- basicamente me da un tablero y una lista de posiciones y me devuelve los numeros del tablero con esas coordenadas
accederAFilaEnMatriz :: Int -> Tablero -> [Int]
accederAFilaEnMatriz _ [] = []
accederAFilaEnMatriz 1 (fila:filas) = x
accederAFilaEnMatriz n (fila:filas) = accederAFilaEnMatriz (n-1) filas

accederAElementoEnColumna :: Int -> [Int] -> Int
accederAElementoEnColumna _ [] = 0
accederAElementoEnColumna 1 (y:ys) = y
accederAElementoEnColumna n (y:ys) = accederAElementoEnColumna (n-1) ys

valoresDeCamino :: Tablero -> Camino -> [Int]
valoresDeCamino [] _ = []
valoresDeCamino _ [] = []
valoresDeCamino tablero ((i,j):indices) = accederAElementoEnColumna j (accederAFilaEnMatriz i tablero) : valoresDeCamino tablero indices

-- Ejercicio 8
-- 0 1 2 3 4 5 6 7
-- 0 1 1 2 3 5 8 13

fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

esCaminoFibo :: [Int] -> Int -> Bool
esCaminoFibo [] _ = False
esCaminoFibo (x:xs) i 
    | fibonacci i == x = True
    | otherwise = esCaminoFibo xs i

-- Ejercicio 9
-- ESTE ES RECONTRA IMPORTANTE!
-- numero perfecto cuando la suma de los divisores propios de n
-- (divisores menos n) es igual que n

divisoresPropios :: Int -> [Int]
divisoresPropios n = divisoresPropiosAux n 1

divisoresPropiosAux :: Int -> Int -> [Int]
divisoresPropiosAux n i
    | i >= n = []
    | mod n i == 0 = i : divisoresPropiosAux n (i+1)
    | otherwise = divisoresPropiosAux n (i+1)

-- Ejercicio 10
sumaLista :: [Int] -> Int
sumaLista [] = 0
sumaLista [x] = x 
sumaLista (x:xs) = x + sumaLista xs

sonAmigos :: Int -> Int -> Bool
sonAmigos 0 _ = False
sonAmigos _ 0 = False
sonAmigos n m 
    | n == m = False
    | sumaLista (divisoresPropios n) ==  m && sumaLista (divisoresPropios m)== n = True
    | otherwise = False

-- Ejercicio 11
esPerfecto :: Int -> Bool
esPerfecto 0 = False
esPerfecto 1 = False
esPerfecto n
    | sumaLista (divisoresPropios n) == n = True
    | otherwise = False

losPrimerosNPerfectos :: Int ->[Int]
losPrimerosNPerfectos n = losPrimerosNPerfectosAux n 1

losPrimerosNPerfectosAux :: Int -> Int -> [Int]
losPrimerosNPerfectosAux 0 _ = []
losPrimerosNPerfectosAux n i
    | esPerfecto i = i : losPrimerosNPerfectosAux (n-1) (i+1)
    | otherwise = losPrimerosNPerfectosAux n (i+1)

-- Ejercicio 12
listaDeAmigos :: [Int] -> [(Int,Int)]
listaDeAmigos [] = []
listaDeAmigos (x:xs) = amigosDeN x xs ++ listaDeAmigos xs
    
amigosDeN :: Int -> [Int] -> [(Int,Int)]
amigosDeN _ [] = []
amigosDeN n (x:xs)
    | sonAmigos n x = (n,x) : amigosDeN n xs
    | otherwise = amigosDeN n xs