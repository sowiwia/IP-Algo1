-- a)

absoluto :: Integer -> Integer
absoluto x | x < 0     = -x
           | otherwise = x

-- b)

maximoAbsoluto :: Integer -> Integer -> Integer
maximoAbsoluto x y | absoluto x >= absoluto y = absoluto x
                   | otherwise                = absoluto y

--c)

maximo3 :: Integer -> Integer -> Integer -> Integer
maximo3 x y z | x >= y && x >= z = x
              | y >= x && y >= z = y
              | z >= x && z >= y = z

--d)

--con pattern matching

--algunoEsCero :: Float -> Float -> Bool
--algunoEsCero 0 y = True
--algunoEsCero x 0 = True
--algunoEsCero _ _ = False


--sin pattern matching


algunoEsCero :: Float -> Float -> Bool
algunoEsCero x y = x == 0 || y == 0

--e)

--con pattern matching

--ambosSonCero :: Float -> Float -> Bool
--ambosSonCero 0 0 = True
--ambosSonCero _ _ = False

--sin pattern matching

ambosSonCero :: Float -> Float -> Bool
ambosSonCero x y = x == 0 && y == 0

--f)

clase :: Float -> Integer 
clase x | x <= 3            = 1
        | x > 3 && x <= 7   = 2
        | x > 7             = 3

enMismoIntervalo :: Float -> Float -> Bool
enMismoIntervalo x y = clase x == clase y

-- g)

sumaDistintos :: Integer -> Integer -> Integer -> Integer
sumaDistintos x y z
    | x == y && x == z = 0
    | x == y = z 
    | x == z = y
    | y == z = x
    | otherwise = x + y + z 

-- h)

esMultiploDe :: Integer -> Integer -> Bool
esMultiploDe x y | y == 0           = False
                 | x `mod` y == 0   = True
                 | otherwise        = False

-- i)

digitoUnidades :: Integer -> Integer
digitoUnidades n = mod n 10

--j)

digitoDecenas :: Int -> Int
digitoDecenas n = mod (div (abs n) 10) 10

--a)
productoInterno :: (Float, Float) -> (Float, Float) -> Float
productoInterno (x1, y1) (x2, y2) = (x1 * x2) + (y1 * y2)

--b)
todoMenor :: (Float, Float) -> (Float, Float) -> Bool
todoMenor (a, b) (c, d) = a < c && b < d

--c)
distancia :: (Float, Float) -> (Float, Float) -> Float
distancia (x1, y1) (x2, y2) = sqrt((x2-x1)**2 + (y2-x2)**2)

--d)
sumaTerna :: (Integer, Integer, Integer) -> Integer
sumaTerna (x, y, z) = x + y + z

--e)

sumarSoloMultiplos :: (Int, Int, Int) -> Int -> Int
sumarSoloMultiplos (x, y, z) n = f x + f y + f z
    where
        f a 
          | mod a n == 0 = a
          | otherwise    = 0

--f)
posPrimerPar :: (Integer, Integer, Integer) -> Integer
posPrimerPar (x, y, z)
    | mod x 2 == 0 = 1
    | mod y 2 == 0 = 2
    | mod z 2 == 0 = 3
    | otherwise = 4

--g)
crearPar :: a -> b -> (a, b)
crearPar x y = (x, y)

--h)
invertir :: (a, b) -> (b, a)
invertir (x, y) = (y, x)

estanRelacionados :: Integer -> Integer -> Bool
estanRelacionados a b
    | a /= 0 && b /= 0
        && mod (-a) b == 0
        && div (-a) b /= 0 = True
    | otherwise = False
