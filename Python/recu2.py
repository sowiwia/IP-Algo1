from queue import Queue as Cola

# Ejercicio 1)
# (empleado,producto,cant)
# las claves del dic son los empleados
# los valores son el producto y la cantidad
# no hay repeticiones de product

def gestion_ventas(ventas_empleado_producto: list[tuple[str, str, int]]) -> dict[str, list[tuple[str, int]]]:
    res: dict[str, list[tuple[str, int]]] = {}
    
    for tupla in ventas_empleado_producto:
        empleado: str = tupla[0]
        producto: str = tupla[1]
        cantidad: int = tupla[2]

        if empleado not in res:
            res[empleado] = [(producto,cantidad)]
        else:
            encontrado: bool = False
            for item in res[empleado]:
                if item[0] == producto:
                    encontrado = True
            if not encontrado:
                res[empleado].append((producto,cantidad)) 
    return res

prueba = [("pau","zanahorias",10),("pau","tornillos",10),("lucho","papas",12),("pau","zanahorias",11),("sophi","tomates",9)]

# Ejercicio 2)
def numero_a_lista_de_digitos(numero:int) -> list[int]:
    res: list[int] = []

    while numero > 0:
        digito = numero % 10
        res.append(digito)
        numero = numero // 10

    return res

def filtrar_digitos_impares(numero: int) -> list[int]:
    res: list[int] = []
    digitos: list[int] = numero_a_lista_de_digitos(numero)

    for digito in digitos:
        if digito % 2 != 0:
            res.append(digito)

    return res

def cantidad_digitos_impares(numeros: list[int]) -> int:
    res: int = 0

    for numero in numeros:
        lista_impares: list[int] = filtrar_digitos_impares(numero)
        for digito in lista_impares:
            res += 1

    return res

prueba2 =  [57000, 2383, 812, 246]

# Ejercicio 3)
# (id_carpeta,numero_paginas)
# hay que reordenar la cola, en menor a mayor numero de paginas respetando el umbral

def reordenar_cola_primero_numerosas(carpetas: Cola[str,int], umbral: int) -> Cola[str,int]:
    res: Cola = Cola()
    mayores_al_umbral: Cola = Cola()
    menores_o_iguales_al_umbral: Cola = Cola()

    while not carpetas.empty():
        carpeta = carpetas.get()
        num_paginas: int = carpeta[1]
        if num_paginas >= umbral:
            mayores_al_umbral.put(carpeta)
        else:
            menores_o_iguales_al_umbral.put(carpeta)

    while not mayores_al_umbral.empty():
        res.put(mayores_al_umbral.get())

    while not menores_o_iguales_al_umbral.empty():
        res.put(menores_o_iguales_al_umbral.get())

    return res

carpetas = Cola ()

carpetas.put  (("aa" , 6 ))
carpetas.put (("ab" , 4))
carpetas.put  (("ac" , 5))
carpetas.put  (("ad" , 8))
carpetas.put  (("ae" , 60))
carpetas.put  (("af" , 25))
carpetas.put  (("ag", 23))
carpetas.put  (("ah" , 80))
carpetas.put  (("ai" , 20))

call = reordenar_cola_primero_numerosas(carpetas,20)

# Ejercicio 4)

def trasponer_matriz(matriz:list[list[int]]) -> list[list[int]]:
    res: list[list[int]] = []

    for j in range(len(matriz[0])):
        nueva_fila: list[int] = []
        for i in range(len(matriz)):
            nueva_fila.append(matriz[i][j])
        res.append(nueva_fila)

    return res

def maximo(lista: list[int]) -> int:
    maximo: int = lista[0]

    for elemento in lista:
        if elemento > maximo:
            maximo = elemento

    return maximo

def matriz_cuasi_decreciente(matriz:list[list[int]]) -> bool:
    res: bool = True
    columnas_a_filas: list[list[int]] = trasponer_matriz(matriz)

    for i in range(len(columnas_a_filas)-1):
        if maximo(columnas_a_filas[i]) <= maximo(columnas_a_filas[i+1]):
            res = False

    return res

matriz = [[12,1,3],
          [0,8,40],
          [1,2,2]]

print(matriz_cuasi_decreciente(matriz))