-- Ejercicio 1
sumaPosicionesPares :: Int -> Int
sumaPosicionesPares n = sumaPosicionesParesAux n 1

sumaPosicionesParesAux :: Int -> Int -> Int
sumaPosicionesParesAux 0 _ = 0
sumaPosicionesParesAux n i
    | mod i 2 == 0 = mod n 10 + sumaPosicionesParesAux (div n 10) (i + 1)
    | otherwise = sumaPosicionesParesAux (div n 10) (i + 1)

mayorSumaPosicionPares :: Int -> Int -> Int
mayorSumaPosicionPares n m
    | sumaPosicionesPares n >= sumaPosicionesPares m = n
    | otherwise = m

-- Ejercicio 2
-- ("producto","codigo",stock)
productosAReponer :: [(String,Int,Int)] -> Int -> [(String,Int)]
productosAReponer [] _ = []
productosAReponer ((producto,codigo,stock):xs) cant
    | stock < cant = (producto,codigo) : productosAReponer xs cant
    | otherwise = productosAReponer xs cant

-- Ejercicio 3
accederAColumna :: [Int] -> Int -> Int
accederAColumna [] _ = 0
accederAColumna (x:xs) 1 = x
accederAColumna (x:xs) i = accederAColumna xs (i-1)

sumarColumna :: [[Int]] -> Int -> Int
sumarColumna [] _ = 0
sumarColumna (fila:filas) i = accederAColumna fila i + sumarColumna filas i

hayColumnaSumaCeroAux :: [[Int]] -> Int -> Bool
hayColumnaSumaCeroAux _ 0 = False
hayColumnaSumaCeroAux matriz j
    | sumarColumna matriz j == 0 = True
    | otherwise = hayColumnaSumaCeroAux matriz (j-1)

longitud :: [Int] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

hayColumnaSumaCero :: [[Int]] -> Bool
hayColumnaSumaCero (fila:filas)
    | hayColumnaSumaCeroAux (fila:filas) (longitud fila) = True
    | otherwise = False

--Ejercicio 4
-- primero hago lista de divisores de n
-- un i divide a n si mod n i == 0

esDivisor :: Int -> Int -> Bool
esDivisor _ 0 = False
esDivisor n i
    | mod n i == 0 = True
    | otherwise = False

divisoresDesde :: Int -> Int -> [Int]
divisoresDesde n i
    | i > n = []
    | esDivisor n i = i : divisoresDesde n (i+1)
    | otherwise = divisoresDesde n (i+1)

divisores :: Int -> [Int]
divisores n = divisoresDesde n 1

sumaDivisores :: [Int] -> Int
sumaDivisores [] = 0
sumaDivisores [x] = x
sumaDivisores (x:xs) = x + sumaDivisores xs

cantidadDivisores :: [Int] -> Int
cantidadDivisores [] = 0
cantidadDivisores (x:xs) = 1 + cantidadDivisores xs

esNumeroAritmetico :: Int -> Bool
esNumeroAritmetico 1 = True
esNumeroAritmetico n 
    | mod (sumaDivisores (divisores n)) (cantidadDivisores (divisores n)) == 0 = True
    | otherwise = False

primerosKAritmeticosAux :: Int -> Int -> [Int]
primerosKAritmeticosAux 0 _ = []
primerosKAritmeticosAux n i
    | esNumeroAritmetico i = i : primerosKAritmeticosAux (n-1) (i+1)
    | otherwise = primerosKAritmeticosAux n (i+1)

primerosKAritmeticos :: Int -> [Int]
primerosKAritmeticos k = primerosKAritmeticosAux k 1
