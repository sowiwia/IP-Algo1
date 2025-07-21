from queue import Queue as Cola

# Ejercicio 1)
def cant_max_apariciones_conseq(v:list[int], numero: int) -> int:
    res: int = 0
    actual = 0

    for num in v:
        if num == numero:
            actual +=1
            if actual > res:
                res = actual
        else:
            actual = 0
        
    return res

def maximas_cantidades_consecutivos(v:list[int]) -> dict[int,int]:
    res: dict[int,int] = {}
    
    for numero in v:
        cant_apariciones_consecutivas = cant_max_apariciones_conseq(v,numero)
        if numero not in res:
            res[numero] = cant_apariciones_consecutivas

    return res

# Ejercicio 2)
def divisores(n:int) -> list[int]:
    res: list[int] = []
    i: int = 1

    while i <= n:
        if n % i == 0:
            res.append(i)
        i +=1

    return res

def es_primo(n:int) -> bool:
    res: bool = True
    
    if len(divisores(n)) != 2:
        res = False

    return res

def traspuesta(matriz: list[list[int]]) -> list[list[int]]:
    res: list[list[int]] = []

    for j in range(len(matriz[0])):
        nueva_fila: list[int] = []
        for i in range(len(matriz)):
            nueva_fila.append(matriz[i][j])
        res.append(nueva_fila)

    return res

def cant_primos_lista(lista: list[int]) -> int:
    res: int = 0

    for numero in lista:
        if es_primo(numero):
            res +=1
    return res

def maxima_cantidad_primos(A: list[list[int]]) -> int:
    columnas_a_filas: int = traspuesta(A)
    maximo: int = 0
    
    for fila in columnas_a_filas:
        cantidad_primos = cant_primos_lista(fila)
        if cantidad_primos > maximo:
            maximo = cantidad_primos

    return maximo

# Ejercicio 3)
def tuplas_positivas_y_negativas(c:Cola[int,int]):
    tuplas_positivas: Cola = Cola()
    tuplas_negativas: Cola = Cola()

    while not c.empty():
        tupla = c.get()
        if (tupla[0] * tupla[1]) > 0:
            tuplas_positivas.put(tupla)
        elif (tupla[0] * tupla[1]) < 0:
            tuplas_negativas.put(tupla)

    while not tuplas_positivas.empty():
        c.put(tuplas_positivas.get())

    while not tuplas_negativas.empty():
        c.put(tuplas_negativas.get())

    return

# Ejercicio 4)

def separar_terminos(s: str) -> list[str]:
    operaciones: str = '+-'

    terminos: list[str] = []
    termino_actual = ''

    for caracter in s:
        if caracter in operaciones:
            if termino_actual != '':
                terminos.append(termino_actual)
            termino_actual = caracter
        else:
            termino_actual += caracter

    if termino_actual != '':
        terminos.append(termino_actual)

    return terminos

def resolver_cuenta(s:str) -> float:
    return