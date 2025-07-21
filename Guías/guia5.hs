--Ejercicio 1)

--1.1
longitud :: [t] -> Integer
longitud [x] = 1
longitud (x:xs) = 1 + longitud xs

--1.2
ultimo :: [t] -> t
ultimo [x] = x
ultimo (x:xs) = ultimo xs

--1.3
principio :: [t] -> [t]
principio [x] = [x]
principio (x:xs) = principio [x]

--1.4
reverso :: [t] -> [t]
reverso [] = []
reverso [x] = [x]
reverso (x:xs) = reverso xs ++ [x]

--Ejercicio 2
--2.1
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece e (x:xs) = e == x || pertenece e xs

--2.2
todosIguales :: (Eq t) => [t] -> Bool
todosIguales [] = True
todosIguales [x] = True
todosIguales (x:y:xs)
    | x == y = todosIguales xs
    | otherwise = False

--2.3
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos (x:xs)
    | pertenece x xs = False   --si el primer elem de la lista pertenece a alguno de los siguientes entonces es falso porque se repite
    | otherwise = todosDistintos xs

--2.4
hayRepetidos ::  (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos (x:xs)
    | pertenece x xs = True    --hayRepetidos y todosDistintos casi iguales wtf??
    | otherwise = hayRepetidos xs

--2.5
quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar e (x:xs)
    | e == x = xs --si el e es igual al primer elemento de la lista, retorna solo la cola, sin el primer elemento
    |otherwise = x : quitar e xs -- si e no es igual al primer elemento de la lista, entonces se conserva y se lo agregamos a la función llamada recursivamente en xs

--2.6
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos e (x:xs)
    | e == x = quitarTodos e xs -- si e es igual al primer elemento de la lista, se descarta x y se llama a la función recursivamente evaluando e con el resto de la lista
    | otherwise = x : quitarTodos e xs --si e es distinto a x, se conserva x y se le agrega la función recursiva evaluando e con el resto de la lista xs

--2.7
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos [x] = [x]
eliminarRepetidos (x:y:xs)
    | x == y = eliminarRepetidos (y:xs) -- si el primer elemento es igual al segundo elemento, entonces se descarta el primero y se llama la función recursivamente con el segundo y el resto de la lista
    | otherwise = x : eliminarRepetidos (y:xs) -- si el primer elemento es distinto al segundo elemento, entonces el primero se conserva y se le agrega la función recursiva evaluando el segundo elemento con el resto de la lista

-- 2.8 (este me dio desarrollo de personaje)
mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos _ [] = True
mismosElementos [] _ = True
mismosElementos xs ys = contieneTodos xs ys && contieneTodos ys xs -- verdadero si ys está contenido en xs e ys está contenido en xs, doble contención!! son iguales yayyy

contiene :: (Eq t) => t -> [t] -> Bool -- funcion aux para ver si un elemento está contenido en una lista
contiene e [] = False
contiene e (x:xs)
    | e == x = True
    | otherwise = contiene e xs

contieneTodos :: (Eq t) => [t] -> [t] -> Bool -- funcion aux para ver si todos los elementos de una lista están contenidos en otra lista
contieneTodos [] _ = True
contieneTodos (x:xs) ys
    | contiene x ys = contieneTodos xs ys -- si x está contenido en ys, entonces llamo a la función recursivamente para ver si todo xs está contenido en ys
    | otherwise = False

--2.9
capicua :: (Eq t) => [t] -> Bool
capicua [] = True
capicua xs = xs == reverso xs

--Ejercicio 3
--3.1
sumatoria :: [Integer] -> Integer
sumatoria [x] = x
sumatoria (x:xs) = x + sumatoria xs

--3.2
productoria :: [Integer] -> Integer
productoria [x] = x
productoria (x:xs) = x * productoria xs

--3.3
maximo :: [Integer] -> Integer
maximo [x] = x
maximo (x:y:xs)
    | x > y = maximo (x:xs) -- si el primer elemento es estrictamente mayor al segundo, se llama a la función recursivamente omitiendo el segundo elmento
    | otherwise = maximo (y:xs) -- si el primer elemento es menor o igual al segundo elemento, se llama a la función recursivamente omitiendo el primer elemento

--3.4
sumarN :: Integer -> [Integer] -> [Integer]
sumarN n [] = [n]
sumarN n [x] = [n + x]
sumarN n (x:xs) = n + x : sumarN n xs -- suma n al primer elemento de la lista y se lo agrega al llamado recursivo de n sumado al resto de la lista

--3.5
sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero [] = []
sumarElPrimero [x] = [x + x]
sumarElPrimero (x:xs) = sumarN x (x:xs) -- suma el primer elemento x a todos los elementos de la lista recursivamente

--3.6
sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo [] = []
sumarElUltimo [x] = [x + x]
sumarElUltimo (x:xs) = sumarN (ultimo xs) (x:xs) -- suma el último elemento x a todos los elementos de la lista recursivamente

--3.7
pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs)
    | esPar x  = x : pares xs -- si el primer elemento es par, conserva el primer elemento y se le agrega la función recursivamente con el resto de la lista
    | otherwise = pares xs -- si el primer elemento no es par, se omite y se llama la función recursivamente con el resto de la lista 

esPar :: Integer -> Bool
esPar x = mod x 2 == 0

--3.8
multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN _ [] = []
multiplosDeN n (x:xs)
    | esMultiplo x n = x : multiplosDeN n xs -- si el primer elemento de la lista es multiplo de n, conserva el primer elemento de la lista y se le agrega el llamado recursivo de la función 
    | otherwise = multiplosDeN n xs
  where
    esMultiplo :: Integer -> Integer -> Bool
    esMultiplo _ 0 = False
    esMultiplo x y = mod x y == 0

--3-9
ordenar :: [Integer] -> [Integer]
ordenar [x] = [x]
ordenar xs = minimo xs : ordenar (quitar (minimo xs) xs) -- calcula el minimo de toda la lista y se le agrega eL llamado recursivo de la función que evalúa el resto de la lista sin el minimo (porque ya se agregó)

minimo :: [Integer] -> Integer
minimo [x] = x
minimo (x:y:xs)
    | x >= y = minimo (y:xs)
    | otherwise = minimo (x:xs)

--Ejercicio 4)
type Texto = [Char]

--4.1
sacarBlancosRepetidos :: Texto -> Texto
sacarBlancosRepetidos [x] = [x]
sacarBlancosRepetidos (x:y:xs)
    | x == ' ' && x == y = sacarBlancosRepetidos (x:xs) -- si el primer elemento de la lista es un espacio, y además es igual al segundo elemento, entonces se llama a la función recursivamente conservando el primer espacio y descartando el segundo
    | otherwise = x : sacarBlancosRepetidos (y:xs) -- si ocurre lo contrario, se conserva el primer elemento y se concatena con el resultado de la función recursiva que evalua desde el segundo elemento hasta el resto de la lista

--4.2
contarPalabras :: Texto -> Integer
contarPalabras [] = 0
contarPalabras (' ':xs) = contarPalabras (quitarPrimerEspacio xs) -- si el texto comienza con un espacio, lo elimina y continúa evaluando el resto de la lista
contarPalabras xs = 1 + contarPalabras (quitarPrimeraPalabra xs) -- si encuentra una palabra, cuenta 1 y vuelve a llamar a la función con el texto restante después quitar esa palabra

quitarPrimerEspacio :: Texto -> Texto
quitarPrimerEspacio [] = []
quitarPrimerEspacio (x:xs)
    | x == ' '  = quitarPrimerEspacio xs -- si el primer caracter es un espacio, lo elimina y sigue evaluando el resto de la lista
    | otherwise = x:xs -- si el primer caracter no es un espacio, devuelve la misma lista

quitarPrimeraPalabra :: Texto -> Texto
quitarPrimeraPalabra [] = []
quitarPrimeraPalabra (x:xs)
    | x /= ' '  = quitarPrimeraPalabra xs -- si el primer caracter no es un espacio, sigue eliminando caracteres hasta encontrar un espacio
    | otherwise = quitarPrimerEspacio (x:xs) -- cuando encuentra un espacio, elimina cualquier espacio adicional al inicio del resto del texto

--4.3
palabras :: Texto -> [Texto]
palabras [] = []
palabras (x:xs)
    | x == ' ' = palabras (quitarPrimerEspacio xs) -- si el primer elemento evaluado es un espacio, se omite y se llama a la funcion recursivamente que evalua el resto de la lista sin el primer espacio 
    | otherwise = sacarPalabra (x:xs) : palabras (quitarPrimeraPalabra (x:xs)) -- sino, se usa sacarPalabra en toda la lista para extraer a la primera palabra y se concatena a la funcion llamada recursivamente omitiendo la primera palabra (porque ya se le agregó)

sacarPalabra :: Texto -> Texto
sacarPalabra [] = []
sacarPalabra (x:xs)
    | x == ' '  = [] -- si el primer elemento es un espacio, devuelve la lista vacía (no es una palabra)
    | otherwise = x : sacarPalabra xs -- sino, se conserva y se evalúa lo mismo en el resto de la función

--4.4
palabraMasLarga :: Texto -> Texto
palabraMasLarga (x:xs) = cualEsMasLarga (palabras (x:xs)) -- le aplica la comparación de cuál es más larga a la función anteriormente definida que pickea palabras sin espacios, para toda la lista obvio

cualEsMasLarga :: Eq t => [[t]] -> [t] -- hago una función auxiliar que sí pueda usar Eq t para comparar las longitudes
cualEsMasLarga [] = []
cualEsMasLarga [x] = x
cualEsMasLarga (x:y:xs)
    | longitud x > longitud y = cualEsMasLarga (x:xs) -- si la longitud de la primera palabra es mayor a la segunda palabra, se omite la segunda y se llama recursivamente a la función al resto de la listaconservando la primera 
    | otherwise = cualEsMasLarga (y:xs) -- self explanatory, sino se omite x y se conserva y

--4.5
aplanar :: [Texto] -> Texto
aplanar [] = []
aplanar [x] = x
aplanar (x:xs) = x ++ aplanar xs -- devuelve el primer elemento de la lista y lo concatena con el resto, como una sola lista de caracteres sin espacios

--4.6
aplanarConBlancos :: [Texto] -> Texto
aplanarConBlancos [] = []
aplanarConBlancos [x] = x
aplanarConBlancos (x:xs) = x ++ " " ++ aplanarConBlancos xs -- concatena el primer elemento con un espacio y se le concatena la función llamada recursivamente para que lo haga con el resto de la lista

--4.7
aplanarConNBlancos :: [Texto] -> Integer -> Texto
aplanarConNBlancos [] _ = []
aplanarConNBlancos [x] _ = x
aplanarConNBlancos (x:xs) n = x ++ nBlancos n ++ aplanarConNBlancos xs n -- a la primera palabra se le concatenan los blancos indicados y a eso se le concatena el llamado recursivo de la función en el resto de la lista, con el mismo n

nBlancos :: Integer -> [Char]
nBlancos 0 = []
nBlancos n = " " ++ nBlancos (n - 1) -- dado un solo espacio, se le concatena la función llamada recursivamente del n - 1 (porque ya se contó el primer espacio), esta función devuelve la cant. de blancos que se le indique

--Ejercicio 5)

--5.1
sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [] = []
sumaAcumulada [x] = [x]
sumaAcumulada (x:y:xs) = x : sumaAcumulada (x + y : xs) -- deja el primer elemento igual y se le agrega el llamado recursivo de la función tomando como primer elemento la suma entre el primero y el segundo, y así con el resto de la lista

--5.2
descomponerEnPrimos :: [Integer] -> [[Integer]]
descomponerEnPrimos [] = []
descomponerEnPrimos (x:xs) = factoresPrimos x : descomponerEnPrimos xs -- se descompone el primer número en sus factores primos usando factoresPrimos, y se concatena el resultado con el llamado recursivo de la función en el resto de la lista

factoresPrimos :: Integer -> [Integer]
factoresPrimos n = factoresPrimosAux n 2 -- descompone en factores primos, comenzando con el número dado y el divisor inicial igual a 2

factoresPrimosAux :: Integral t => t -> t -> [t]
factoresPrimosAux 1 _ = []
factoresPrimosAux m divisor
    | mod m divisor == 0 = divisor : factoresPrimosAux (div m divisor) divisor -- si el número es divisible por el divisor actual, éste se agrega a la lista de factores, y se llama recursivamente a la función con el cociente como nuevo número
    | otherwise = factoresPrimosAux m (divisor + 1) -- si no es divisible, se incrementa el divisor en 1 y se sigue buscando

--Ejercicio 6)
--type Texto = [Char]
type Nombre = Texto
type Telefono = Texto
type Contacto = (Nombre, Telefono)
type ContactosTel = [Contacto]

enLosContactos :: Nombre -> ContactosTel -> Bool
enLosContactos _ [] = False
enLosContactos nombre ((n,_):xs)
    | nombre == n = True -- si el nombre es igual al nombre del primer contacto de la lista, entonces devuelve true
    | otherwise = enLosContactos nombre xs --si no es igual, sigue chequeando con el resto de los nombres de la lista

agregarContacto :: Contacto -> ContactosTel -> ContactosTel
agregarContacto (n, t) [] = [(n, t)] --si se tiene un contacto y una lista vacía, se le agrega ese contacto a la lista vacía xd
agregarContacto (n, t) ((nombre, telefono):ys)
    | n == nombre = (nombre, t) : ys -- si el nombre del contacto que se quiere agregar es igual al primer nombre del primer contacto de la lista, conserva el nombre que estaba y reemplaza el telefono nuevo con el anterior, esto se le agrega al resto de la lista
    | otherwise = (nombre, telefono) : agregarContacto (n, t) ys -- sino, el primer contacto original se le agrega al llamado recursivo de la función evaluando de nuevo el 

eliminarContacto :: Nombre -> ContactosTel -> ContactosTel
eliminarContacto n [] = []
eliminarContacto n ((nombre,telefono):ys)
    | n == nombre = eliminarContacto n ys -- si el nombre dado coincide con el nombre del primer contacto en la lista, se omite este contacto y continua chequeando la lista recursivamente
    | otherwise = (nombre, telefono) : eliminarContacto n ys -- si no, se conserva el primer contacto de la lista y se llama a la función recursivamente para eliminar el contacto en el resto de la lista

--Ejercicio 7)
-- el código es bastante descriptivo y legible así que no lo comento porque me da flojera :D
type Identificacion = Integer
type Ubicacion = Texto
type Estado = (Disponibilidad, Ubicacion)
type Locker = (Identificacion, Estado)
type MapaDeLockers = [Locker]
type Disponibilidad = Bool

existeElLocker :: Identificacion -> MapaDeLockers -> Bool
existeElLocker _ [] = False
existeElLocker identificacion ((id,_):xs)
    | identificacion == id = True
    | otherwise = existeElLocker identificacion xs

ubicacionDelLocker :: Identificacion -> MapaDeLockers -> Ubicacion
ubicacionDelLocker _ [] = "No se pudo encontrar la ubicación."
ubicacionDelLocker identificacion ((id,(estado,ubicacion)):xs)
    | identificacion == id = ubicacion
    | otherwise = ubicacionDelLocker identificacion xs

estaDisponibleElLocker :: Identificacion -> MapaDeLockers -> Bool
estaDisponibleElLocker _ [] = False
estaDisponibleElLocker identificacion ((id,(estado,ubicacion)):xs)
    | identificacion == id = estado
    | otherwise = estaDisponibleElLocker identificacion xs

ocuparLocker :: Identificacion -> MapaDeLockers -> MapaDeLockers
ocuparLocker _ [] = []
ocuparLocker identificacion ((id, (disponible, ubicacion)):xs)
  | identificacion == id && disponible = (id, (False, ubicacion)) : xs
  | identificacion == id && not disponible = (id, (disponible, ubicacion)) : xs
  | otherwise = (id, (disponible, ubicacion)) : ocuparLocker identificacion xs

lockers :: MapaDeLockers
lockers =
    [ (100, (False, "ZD39I")),
      (101, (True, "JAH3I")),
      (103, (True, "IQSA9")),
      (105, (True, "QOTSA")),
      (109, (False, "893JJ")),
      (110, (False, "99292"))
    ]
