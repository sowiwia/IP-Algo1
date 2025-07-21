from queue import Queue as Cola
#  otra vez esto

def intercambiar_e_invertir_columnas(A:list[list[int]], col1:int, col2:int):

    for i in range(len(A)):
        copia_col1 = A[i][col1]
        A[i][col1] = A[len(A)-1-i][col2]
        A[len(A)-1-i][col2] = copia_col1

#raro

def reflejar_si_mayor_que(A:list[list[int]], col:int, umbral: int):
    
    for i in range(len(A)):
        if A[i][col] > umbral and A[len(A)-1-i][col] > umbral:
            copia_col = A[i][col]
            A[i][col] = A[len(A)-1-i][col]
            A[len(A)-1-i][col] = copia_col

# eh

def cant_ceros_columna(matriz: list[list[int]], col:int) -> int:
    res: int = 0

    for i in range(len(matriz)):
        if matriz[i][col] == 0:
            res +=1

    return res

def matriz_escalonada_por_filas(matriz: list[list[int]]) -> bool:
    res: bool = True

    for j in range(len(matriz[0])-1):
        if cant_ceros_columna(matriz,j) <= cant_ceros_columna(matriz,j+1):
            res = False

    return res

matriz = [
    [1, 2, 3],           # 0 ceros al inicio
    [0, 5, 6],           # 1 cero al inicio
    [0, 0, 4]            # 2 ceros al inicio
]


# ejercicio raro
#(nombre,proyecto,hora)
# nombre :(proyecto,promediohoras)

def sumar_lista(lista: list[int]) -> int:
    suma: int = 0

    for elemento in lista:
        suma += elemento

    return suma

def promedio_horas_por_persona(registros: list[tuple[str,str,int]], persona: str, proy:str) -> float:
    contador = 0
    horas_lista: list[int] = []

    for nombre,proyecto,horas in registros:
        if nombre == persona:
            if proyecto == proy:
                contador +=1
                horas_lista.append(horas)

    promedio = sumar_lista(horas_lista) / contador

    return promedio

def promedio_horas_proyecto(registros: list[tuple[str,str,int]]) -> dict[str,list[str,float]]:
    res: dict[str, list[str, float]] = {}

    for nombre,proyecto,hora in registros:
        promedio = promedio_horas_por_persona(registros,nombre,proyecto)

        if nombre not in res:
            res[nombre] = [(proyecto,promedio)]

    return res

#ejercicio primos raros

def divisores(n: int) -> list[int]:
    res: list[int] = []
    i = 1
    while i <= n:
        if n % i == 0:
            res.append(i)
        i += 1

    return res

def es_primo(n:int) -> bool:
    res: bool = False
    
    if len(divisores(n)) == 2:
        res = True
    
    return res

def numero_a_lista_de_digitos(numero: int) -> list[int]:
    res: list[int] = []

    while numero > 0:
        digito = numero % 10
        res.append(digito)
        numero = numero // 10

    return res

def suma_de_digitos_primos(numeros: list[int]) -> int:
    digitos_primos: list[int] = []
    
    for numero in numeros:
        lista_digitos: list[int] = numero_a_lista_de_digitos(numero)
        for digito in lista_digitos:
            if es_primo(digito):
                digitos_primos.append(digito)

    res: int = sumar_lista(digitos_primos)

    return res

# otro rarooo
def reordenar_cola_por_paginas(carpetas: Cola[str,int], umbral_paginas:int) -> Cola[str,int]:
    res: Cola = Cola()
    supera_umbral = Cola()
    no_supera_umbral = Cola()

    while not carpetas.empty():
        carpeta = carpetas.get()
        paginas = carpeta[1]
        if paginas > umbral_paginas:
            supera_umbral.put(carpeta)
        else:
            no_supera_umbral.put(carpeta)

    while not supera_umbral.empty():
        res.put(supera_umbral.get())

    while not no_supera_umbral.get():
        res.put(no_supera_umbral.get())

    return res

# raruuu

def trasponer(matriz: list[list[int]]) -> list[list[int]]:
    res: list[list[int]] = []

    for j in range(len(matriz[0])):
        nueva_fila: list[int] = []
        for i in range(len(matriz)):
            nueva_fila.append(matriz[i][j])
        res.append(nueva_fila)

    return res

def maximo(lista:list[int]) -> int:
    maximo = lista[0]

    for elemento in lista:
        if elemento > maximo:
            maximo = elemento

    return maximo

def lista_de_maximos(matriz:list[list[int]]) -> list[int]:
    res: list[int] = []

    for fila in matriz:
        res.append(maximo(fila))

    return res

def es_lista_zig_zag(lista: list[int]) -> bool:
    res: bool = True

    for i in range(1, len(lista)):
        if i % 2 != 0:
            if lista[i] >= lista[i-1]:
                res = False
        else:
            if lista[i] <= lista[i-1]:
                res = False
    return res

def matriz_creciente_en_zigzag(matriz: list[list[int]]) -> bool:
    res: bool = True

    traspuesta: list[list[int]] = trasponer(matriz)
    maximos: list[int] = lista_de_maximos(traspuesta)

    if not es_lista_zig_zag(maximos):
        res = False

    return res


# subseq rara
