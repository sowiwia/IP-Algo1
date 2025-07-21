from queue import Queue as Cola
#Ej 1 palabras_por_consonantes

# ejemplo:
# "Hola mi nombre es Sophi"
# res = { 2 : 1, 1 : 2, 4 : 1, 3 : 1 }

# Las claves del diccionario son un contador de cuántas consonantes tiene una palabra,
# los valores del diccionario son la cantidad de palabras en el texto que tienen la misma cantidad de consonantes

def texto_a_lista_de_palabras(texto: str) -> list[str]:
    res: list[str] = []
    espacio: str = " "
    palabra: str = ""

    for caracter in texto:
        if caracter != espacio:
            palabra += caracter
        else:
            if palabra != "":
                res.append(palabra)
                palabra = ""

    if palabra != "":
        res.append(palabra)

    return res

#hago un contador de consonantes, recibe una lista d palabras, una palabra y te dice cuantas consonantes tiene
def contador_de_consonantes(palabras_separadas: list[str], palabra: str) -> int:
    res: int = 0
    vocales: list[str] = ['a','e','i','o','u','A','E','I','O','U']

    for elemento in palabras_separadas:
        if elemento == palabra:
            for caracter in palabra:
                if caracter not in vocales:
                    res += 1
    return res

def palabras_por_consonantes(texto: str) -> dict[int,int]:
    res: dict[int,int] = {}
    palabras_separadas: list[int] = texto_a_lista_de_palabras(texto)

    for palabra in palabras_separadas:
        consonantes: int = contador_de_consonantes(palabras_separadas,palabra)
        if consonantes in res:
            res[consonantes] += 1
        else:
            res[consonantes] = 1

    return res


#Ej 2 cantidad_de_filas_valle

def indice_minimo(lista:list[int]) -> int:
    i_minimo: int = 0

    for i in range(len(lista)):
        if lista[i] < lista[i_minimo]:
            i_minimo = i
    
    return i_minimo            

def es_estrictamente_decreciente(lista:list[int]) -> bool:
    res: bool = True
    i_minimo: int = indice_minimo(lista)

    for i in range(i_minimo - 1):
        if lista[i] <= lista[i + 1]:
            res = False
    
    return res

def es_estrictamente_creciente(lista:list[int]) -> bool:
    res: bool = True
    i_minimo: int = indice_minimo(lista)

    for i in range(i_minimo, len(lista) -1):
        if lista[i] >= lista[i + 1]:
            res = False
    
    return res

def es_valle(v:list[int]) -> bool:
    res: bool = False
    i_minimo: int = indice_minimo(v)

    if i_minimo > 0 and i_minimo < len(v) -1:
        if es_estrictamente_decreciente(v) and es_estrictamente_creciente(v):
            res = True

    return res
            
def cantidad_de_filas_valle(A:list[list[int]]) -> int:
    res: int = 0
    
    for fila in A:
        if es_valle(fila):
            res+=1

    return res

print(cantidad_de_filas_valle([[1,2,3,4,5],[4,3,2,1,2,3],[5,7,2,6]]))

#Ej 3 aprobados_y_desaprobados

def aprobados_y_desaprobados(examenes: Cola[list[bool]], correctas: Cola[list[bool]]) -> None:
    aprobados: Cola = Cola()
    desaprobados: Cola = Cola()

    while not examenes.empty():
        examen = examenes.get()
        correcta = correctas.get()

        correctas_por_examen: int = 0
        for i in range(len(examen)):
            if examen[i] == correcta[i]:
                correctas_por_examen += 1

        if correctas_por_examen > (len(examen) / 2):
            aprobados.put(examen)

        else:
            desaprobados.put(examen)

    while not aprobados.empty():
        examenes.put(aprobados.get())

    while not desaprobados.empty():
        examenes.put(desaprobados.get())

    return


#Ej 4 geometrica2_mas_larga

def geometrica2_mas_larga (lista:list[int]) ->  tuple[int, int]:
    longitud_maxima:int = 1
    longitud_actual:int = 1 
    posicion_final:int = 0  

    for i in range(1,len(lista)):
        if lista[i] == (2 * lista[i - 1]):  
            longitud_actual += 1
            if longitud_actual > longitud_maxima:
                longitud_maxima = longitud_actual
                posicion_final = i
        else:
            longitud_actual = 1  

    res: tuple[int,int] = (longitud_maxima, posicion_final)

    return res

