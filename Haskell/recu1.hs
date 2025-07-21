--Ejercicio 1
cantidadDivisores :: Int -> Int
cantidadDivisores n = cantidadDivisoresAux n 1

cantidadDivisoresAux :: Int -> Int -> Int 
cantidadDivisoresAux n i
    | i > n = 0
    | mod n i == 0 = 1 + cantidadDivisoresAux n (i+1)
    | otherwise = cantidadDivisoresAux n (i+1)

esPrimo :: Int -> Bool
esPrimo n
    | n >= 2 && (cantidadDivisores n) == 2 = True
    | otherwise = False

valorAbsoluto :: Int -> Int
valorAbsoluto n
    | n < 0 = -n
    | otherwise = n

diferencia :: Int -> Int -> Int
diferencia 0 0 = 0
diferencia n m = valorAbsoluto (m - n)

sonPrimosGemelos :: Int -> Int -> Bool
sonPrimosGemelos p1 p2
    | esPrimo p1 && esPrimo p2 && (diferencia p1 p2 == 2) = True
    | otherwise = False

hayPrimosGemelos :: Int -> Int -> Bool
hayPrimosGemelos d h
    | d + 2 > h = False
    | sonPrimosGemelos d (d+2) = True 
    | otherwise = hayPrimosGemelos (d+1) h

-- Ejercicio 2

pertenece :: Int -> [Int] -> Bool
pertenece _ [] = False
pertenece hora (x:xs)
    | hora == x = True
    | otherwise = pertenece hora xs

materiasTurnoTarde :: [(String,String,Int,Int)] -> [String]
materiasTurnoTarde [] = []
materiasTurnoTarde ((materia,dia,hora_i,hora_f):xs)
    | hora_i <= 17 && hora_f >= 14 = materia : materiasTurnoTarde xs
    | otherwise = materiasTurnoTarde xs

-- Ejercicio 3
maximo :: Int -> Int -> Int
maximo n m
    | n > m = n
    | otherwise = m

maximaSumaDeTresConsecutivos :: [Int] -> Int
maximaSumaDeTresConsecutivos [] = 0
maximaSumaDeTresConsecutivos (x:y:z:xs) = maximo (x + y + z) (maximaSumaDeTresConsecutivos (y:z:xs))
maximaSumaDeTresConsecutivos _ = 0

-- Ejercicio 4
accederAColumna :: [Int] -> Int -> Int
accederAColumna [] _ = 0
accederAColumna (columna:columnas) 1 = columna
accederAColumna (columna:columnas) i = accederAColumna columnas (i-1)

extraerColumna :: [[Int]] -> Int -> [Int]
extraerColumna [] _ = []
extraerColumna (fila:filas) indice = accederAColumna fila indice : extraerColumna filas indice

sumarLista :: [Int] -> Int
sumarLista [] = 0
sumarLista [x] = x
sumarLista (x:xs) = x + sumarLista xs

sumaIesimaColumna :: [[Int]] -> Int -> Int
sumaIesimaColumna [] _ = 0
sumaIesimaColumna matriz i = sumarLista (extraerColumna matriz i)