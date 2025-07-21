-- Ejercicio 1)
hayQueCodificar :: Char -> [(Char,Char)] -> Bool
hayQueCodificar _ [] = False
hayQueCodificar c ((c1,c2):xs)
    | c == c1 = True
    | otherwise = hayQueCodificar c xs

-- Ejercicio 2)
-- recibe: caracter, frase, y mapeos
-- devuelve: si el caracter esta en el mapeo, devuelve la cantidad de veces que hay me mapearlo
cantApariciones :: Char -> [Char] -> Int
cantApariciones _ [] = 0
cantApariciones c (p:ps)
    | c == p = 1 + cantApariciones c ps
    | otherwise = cantApariciones c ps

cuantasVecesHayQueCodificar :: Char -> [Char] -> [(Char,Char)] -> Int
cuantasVecesHayQueCodificar _ _ [] = 0
cuantasVecesHayQueCodificar _ [] _ = 0
cuantasVecesHayQueCodificar c palabra mapeo
    | hayQueCodificar c mapeo = cantApariciones c palabra
    | otherwise = 0

-- Ejercicio 3)
masRepetido :: [Char] -> Char
masRepetido [] = ' '
masRepetido [x] = x
masRepetido (x:y:xs)
    | cantApariciones x xs >= cantApariciones y xs = masRepetido (x:xs)
    | otherwise = masRepetido (y:xs)

laQueMasHayQueCodificar :: [Char] -> [(Char,Char)] -> Char
laQueMasHayQueCodificar [] _ = ' '
laQueMasHayQueCodificar _ [] = ' '
laQueMasHayQueCodificar (p:ps) mapeo
    | hayQueCodificar p mapeo = masRepetido (p:ps)
    | otherwise = laQueMasHayQueCodificar ps mapeo

-- Ejercicio 4)
codificarLetra :: Char -> [(Char,Char)] -> Char
codificarLetra _ [] = ' '
codificarLetra letra ((c1,c2):xs)
    | letra == c1 = c2
    | otherwise = codificarLetra letra xs

codificarFrase :: [Char] -> [(Char,Char)] -> [Char]
codificarFrase [] _ = []
codificarFrase (p:ps) mapeo
    | hayQueCodificar p mapeo = codificarLetra p mapeo : codificarFrase ps mapeo
    | otherwise = p: codificarFrase ps mapeo