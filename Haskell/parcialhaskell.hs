-- Ejercicio 1
invertirLista :: [Int] -> [Int]
invertirLista [] = []
invertirLista [x] = [x]
invertirLista (x:xs) = invertirLista xs ++ [x]

longitud :: [Int] -> Int
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

primerosNNumeros :: [Int] -> Int -> [Int]
primerosNNumeros _ 0 = []
primerosNNumeros [] _ = []
primerosNNumeros (x:xs) n = x : primerosNNumeros xs (n-1)

maximo :: [Int] -> Int
maximo [] = 0
maximo [x] = x
maximo (x:y:xs)
    | y >= x = maximo (y:xs)
    | otherwise = maximo (x:xs)

maxMovilN :: [Int] -> Int -> Int
maxMovilN [] _ = 0
maxMovilN lista n = maximo (primerosNNumeros (invertirLista (lista)) n)

-- Ejercicio 2
-- promedio primo sera por ejemplo para 30 
-- lista de primos [5,3,2]
-- promedio (5+3+2) / 3


esDivisible :: Int -> Int -> Bool
esDivisible n 0 = False
esDivisible n i
    | mod n i == 0 = True
    | otherwise = False

divisoresDesde :: Int -> Int -> [Int]
divisoresDesde n i
    | i > n = []
    | esDivisible n i = i : divisoresDesde n (i+1)
    | otherwise = divisoresDesde n (i+1)

divisores :: Int -> [Int]
divisores n = divisoresDesde n 1

esPrimo :: Int -> Bool
esPrimo n
    | longitud (divisores n) == 2 = True
    | otherwise = False

-- ahora tengo que hacer una lista de factorizacion de primos jaja xd
-- basicamente tengo un n y un i y desde el 2 voy diviendo entre los primeros n numeros primos se agrega y el n se modifica y el i va subiendo hasta llegar a n

factorizacionPrimosAux :: Int -> Int -> [Int]
factorizacionPrimosAux n i
    | i > n = []
    | esPrimo i && mod n i == 0 = i : factorizacionPrimosAux (div n i) i
    | otherwise = factorizacionPrimosAux n (i+1)

factorizacionPrimos :: Int -> [Int]
factorizacionPrimos n = factorizacionPrimosAux n 2

sumaLista :: [Int] -> Int
sumaLista [] = 0
sumaLista [x] = x
sumaLista (x:xs) = x + sumaLista xs

promedio :: [Int] -> Float
promedio [] = 0
promedio lista =  fromIntegral (sumaLista lista) / fromIntegral (longitud lista)

promedioPrimo :: Int -> Float
promedioPrimo n = promedio (factorizacionPrimos n)

--Ejercicio 3)

pertenece :: Char -> [Char] -> Bool
pertenece _ [] = False
pertenece p (c:cs)
    | p == c = True
    | otherwise = pertenece p cs

eliminarRepe :: Char -> [Char] -> [Char]
eliminarRepe _ [] = []
eliminarRepe c (x:xs)
    | c == x = eliminarRepe c xs
    | otherwise = x : eliminarRepe c xs

letrasIguales :: [Char] -> Int
letrasIguales [] = 0
letrasIguales (x:xs)
    | x == ' ' = letrasIguales xs
    | pertenece x xs = 1 + letrasIguales (eliminarRepe x xs)
    | otherwise = letrasIguales xs

-- Ejercicio 4)
cuantosIguales :: [Char] -> [Char] -> Int
cuantosIguales [] _ = 0
cuantosIguales (x:xs) ys
    | x == ' ' = cuantosIguales xs ys
    | pertenece x xs = cuantosIguales xs ys
    | pertenece x ys = 1 + cuantosIguales xs ys
    | otherwise = cuantosIguales xs ys