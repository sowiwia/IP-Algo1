-- Ejercicio 1)
fibonacci :: Integer -> Integer
fibonacci n
    | n == 0 = 0
    | n == 1 = 1
    | otherwise = fibonacci (n-1) + fibonacci (n-2)

-- Ejercicio 2)
{-
En el caso base n >= 0 && n < 1, esto cubre todos los números entre 0 y 1, por ejemplo 0.2 o 0.999, la parte entera devuelve 0

En el caso 2 cuando n es mayor o igual a 1, por ejemplo 3.5, 10.9, la función resta 1 recursivamente hasta llegar al caso base n<1  y en cada paso suma 1

parteEntera 3.5
= 1 + parteEntera 2.5
= 1 + (1 + parteEntera 1.5)
= 1 + (1 + (1 + parteEntera 0.5))
= 1 + (1 + (1 + 0))  -- porque 0.5 < 1
= 3

En el caso 3 n<0 (o el otherwise) el número es negativo (ej -2.3) la funcion suma 1 recursivamente acercándose al 0 y en cada paso resta 1

-}

parteEntera :: Float -> Integer
parteEntera n
  | n >= 0 && n < 1 = 0
  | n >= 1 = 1 + parteEntera (n - 1)
  | otherwise = (-1) + parteEntera (n + 1)

--Ejercicio 3)
esDivisible :: Int -> Int -> Bool
esDivisible n m
    | m < n     = False
    | m == n    = True
    | otherwise = esDivisible n (m - n)

--Ejercicio 4)
sumaImpares :: Integer -> Integer
sumaImpares n
  | n <= 0 = 0
  | esImpar n = n + sumaImpares (n - 1)
  | otherwise = sumaImpares (n - 1)

esImpar :: Integer -> Bool
esImpar n
  | n == 0 = False
  | n == 1 = True
  | otherwise = esImpar (n - 2)

--Ejercicio 5)
medioFact :: Integer -> Integer
medioFact n
  | n == 0 = 1
  | n == 1 = 1
  | n > 0 = n * medioFact ( n - 2 )

--Ejercicio 6)
todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n
  | n < 10 = True
  | mod n 10 /= mod (div n 10) 10 = False
  | otherwise = todosDigitosIguales (div n 10)

--Ejercicio 8)
sumaDigitos :: Integer -> Integer
sumaDigitos 0 = 0
sumaDigitos n = mod n 10 + sumaDigitos (div n 10)

--Ejercicio 9)
esCapicua :: Integer -> Bool
esCapicua n = n == invertir n
  where
    invertir :: Integer -> Integer
    invertir 0 = 0
    invertir x = invertir (div x 10) * 10 + (mod x 10)

--Ejercicio 10)
f1 :: Integer -> Integer
f1 0 = 1
f1 n = 2^n + f1 (n-1)

f2 :: Integer -> Float -> Float
f2 0 _ = 0
f2 n q = q ^ n + f2 (n-1) q

f3 :: Integer -> Float -> Float
f3 0 _ = 0
f3 n q = q ^ n + f3Aux (n-1) q
  where
    f3Aux 0 _ = 0
    f3Aux n q = q ^ n + f3Aux (n-1) q

f4 :: Integer -> Float -> Float
f4 n q
  | n > 2 * n = 0
  | otherwise = q ^ n + f4 (n-1) q

--Ejercicio 11)
eAprox :: Integer -> Float
eAprox 0 = 1
eAprox n = (1 / fromInteger (factorial n)) + eAprox (n - 1)

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

e :: Float
e = eAprox 10

--Ejercicio 12)
a :: Integer -> Float
a 1 = 2
a n = 2 + 1 / a (n - 1)

raizDe2Aprox :: Integer -> Float
raizDe2Aprox n = a n - 1

--Ejercicio 13)
sumaHp :: Integer -> Integer -> Integer
sumaHp i 0 = 0
sumaHp i j = i^j + sumaHp i (j-1)

sumaHpAfuera :: Integer -> Integer -> Integer
sumaHpAfuera 0 m = 0
sumaHpAfuera n m = sumaHp n m + sumaHpAfuera (n-1) m

--Ejercicio 14)
sumaPotencias :: Integer -> Integer -> Integer -> Integer
sumaPotencias q 0 m = 0
sumaPotencias q n 0 = 0
sumaPotencias q n m = q^(n+m) + sumaPotencias q (n-1) m + sumaPotencias q n (m-1) - sumaPotencias q (n-1) (m-1)

--Ejercicio 15)
sumaRacionales :: Integer -> Integer -> Float
sumaRacionales 0 m = 0
sumaRacionales n 0 = sumaRacionales (n-1) n
sumaRacionales n m = (fromIntegral n / fromIntegral m) + sumaRacionales n (m-1)

--Ejercicio 18)
mayorDigitoPar :: Integer -> Integer
mayorDigitoPar 0 = -1
mayorDigitoPar n = mayorDigitoParAux n (-1)

mayorDigitoParAux :: Integer -> Integer -> Integer
mayorDigitoParAux 0 maxPar = maxPar
mayorDigitoParAux n maxPar = mayorDigitoParAux (div n 10) (max (mod n 10) maxPar)

