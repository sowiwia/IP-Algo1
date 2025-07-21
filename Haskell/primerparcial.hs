
-- Ejercicio 1)
esDivisorPropio :: Integer -> Integer -> Bool
esDivisorPropio n i 
    | mod n i == 0 && i < n = True
    | otherwise = False

sumaDivisoresDesde :: Integer -> Integer -> Integer
sumaDivisoresDesde n i
    | i >= n = 0
    | esDivisorPropio n i = i + sumaDivisoresDesde n (i+1)
    | otherwise = sumaDivisoresDesde n (i+1)

sumaDivisores :: Integer -> Integer
sumaDivisores n = sumaDivisoresDesde n 1

esAbundante :: Integer -> Bool
esAbundante 0 = False
esAbundante 1 = False
esAbundante n
    | (sumaDivisores n) > n = True
    | otherwise = False

cantidadNumerosAbundantes :: Integer -> Integer -> Integer
cantidadNumerosAbundantes n i 
    | n > i = 0
    | esAbundante n = 1 + cantidadNumerosAbundantes (n+1) i
    | otherwise = cantidadNumerosAbundantes (n+1) i

-- Ejercicio 2)
-- le das una lista de tuplas tal que cada tupla es algo así:
-- ("Fisica",2020,0)
-- 0: curso de verano
-- 1: primer cuatri
-- 2: segundo cuatri
-- res devuelve el nombre de las materias vencidas (aprobadas antes de
-- cuatrimestre 1 de 2021 incluyente)
-- res no tiene elementos repetidos!

materiaVencida :: (String, Integer, Integer) -> Bool
materiaVencida (materia,anio,cuatri)
    | anio < 2021 = True
    | anio <= 2021 && cuatri < 2 = True
    | otherwise = False

pertenece :: String -> [String] -> Bool
pertenece _ [] = False
pertenece e (x:xs)
    | e == x = True
    | otherwise = pertenece e xs

quitarRepe :: [String] -> [String]
quitarRepe [] = []
quitarRepe (x:xs)
    | pertenece x xs = xs
    | otherwise = x : quitarRepe xs

cursadasVencidas :: [(String, Integer, Integer)] -> [String]
cursadasVencidas [] = []
cursadasVencidas ((materia,anio,cuatri):xs)
    | materiaVencida (materia,anio,cuatri) = quitarRepe(materia : cursadasVencidas xs)
    | otherwise = quitarRepe(cursadasVencidas xs)

-- Ejercicio 3)
saturarEnUmbralHastaNegativo :: [Integer] -> Integer -> [Integer]
saturarEnUmbralHastaNegativo [] _ = []
saturarEnUmbralHastaNegativo (x:xs) u
    | x < 0 = []
    | x <= u = x : saturarEnUmbralHastaNegativo xs u
    | otherwise = u : saturarEnUmbralHastaNegativo xs u

-- Ejercicio 4)
esPar :: Integer -> Bool
esPar 1 = False
esPar n
    | mod n 2 == 0 = True
    | otherwise = False

elementoEnColumna :: [Integer] -> Integer -> Integer
elementoEnColumna (x:xs) indiceColumna
    | indiceColumna == 1 = x
    | otherwise = elementoEnColumna xs (indiceColumna - 1)

cantidadParesColumna :: [[Integer]] -> Integer -> Integer
cantidadParesColumna [] _ = 0
cantidadParesColumna (fila:xs) indiceColumna
    | esPar (elementoEnColumna fila indiceColumna) = 1 + cantidadParesColumna xs indiceColumna
    | otherwise = cantidadParesColumna xs indiceColumna
