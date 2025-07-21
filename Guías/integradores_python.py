from queue import Queue as Cola

# recibe una cola con tuplas tipo ("pepe","vip"), ("pablo","común"), ("ana", "vip")
# devuelve otra copa con sólo los nombres en orden de vips
# "pepe","ana","pablo"

def reordenar_cola_priorizando_vips(filaClientes:Cola[str,str]) -> Cola[str]:
    res: Cola[str] = Cola()
    vip: Cola[str] = Cola()
    no_vip: Cola [str] = Cola()

    while not filaClientes.empty():
        cliente = filaClientes.get()
        if cliente[1] == "vip":
            vip.put(cliente[0])
        else:
            no_vip.put(cliente[0])

    while not vip.empty():
        res.put(vip.get())

    while not no_vip.empty():
        res.put(no_vip.get())

    return res

colatest = Cola()
colatest.put(("pepe","vip"))
colatest.put(("lucho","común"))
colatest.put(("pau","vip"))
colatest.put(("sophi","común"))
colatest.put(("lisa","vip"))

call = reordenar_cola_priorizando_vips(colatest)

from queue import Queue as Cola

#1)
def orden_de_atencion(urgentes: Cola[str], postergables: Cola[str]) -> Cola[str]:
    res: Cola[str] = Cola()

    while not urgentes.empty() and not postergables.empty():
        paciente_urgente = urgentes.get()
        res.put(paciente_urgente)
        paciente_postergable = postergables.get()
        res.put(paciente_postergable)

    return res

urgentes = Cola()
urgentes.put("maria")
urgentes.put("pablo")
urgentes.put("lolo")

postergables = Cola()
postergables.put("mimi")
postergables.put("lucho")
postergables.put("eme")

call = orden_de_atencion(urgentes,postergables)

#2)
#registros es una tupla con (ID, enfermedad)
#infecciosas es una lista de enfermedades
#umbral es el porcentaje que se da entre 0 y 1 excluyente
#las claves del diccionario son las enfermedades infecciosas y su valor es la proporción y su valor es el porcentaje (sólo el que supera el umbral)

def supera_umbral(registros: list[tuple[int, str]], enfermedad: str, umbral: float) -> bool:
    res: bool = False
    cantidad_total = len(registros)
    cantidad_enfermedad = 0

    for _, e in registros:
        if e == enfermedad:
            cantidad_enfermedad += 1

    porcentaje = cantidad_enfermedad / cantidad_total

    if porcentaje > umbral:
        res = True

    return res

def alarma_epidemologica(registros:list[tuple[int,str]], infecciosas:list[str], umbral:float) -> dict[str,float]:
    res: dict[str,float] = {}

    for enfermedad in infecciosas:
        if supera_umbral(registros, enfermedad, umbral):
            cantidad_enfermedad = 0
            for _, e in registros:
                if e == enfermedad:
                    cantidad_enfermedad += 1

            porcentaje = cantidad_enfermedad / len(registros)
            res[enfermedad] = porcentaje

    return res

#3)
#devuelve la clave con mayor cantidad(total) de horas trabajadas 

def suma_lista(lista: list[int]) -> int:
    res: int = 0

    for numero in lista:
        res += numero

    return res
    
def empleados_del_mes(horas: dict[int, list[int]]) -> list[int]:
    res: list[int] = []
    maximo: int = 0

    for id_empleado,lista_horas in horas.items():
        suma_horas = 0
        suma_horas += suma_lista(lista_horas)
        if suma_horas > maximo:
            maximo = suma_horas
            res = [id_empleado]
        elif suma_horas == maximo:
            res.append(id_empleado)

    return res

horas = {
    1545: [8, 8, 15],      
    2234: [7, 9, 8],     
    3835: [6, 6, 19]      
}

call = empleados_del_mes(horas)

#4)

def nivel_de_ocupacion_por_piso(camas: list[bool]) -> float:
    camas_ocupadas: int = 0
    camas_totales: int = len(camas)

    for cama in camas:
        if cama == True:
            camas_ocupadas += 1

    porcentaje: float = camas_ocupadas / camas_totales

    return porcentaje

def nivel_de_ocupacion(camas_por_piso: list[list[bool]]) -> list[float]:
    res: list[float] = []
    
    for piso in camas_por_piso:
        res.append(nivel_de_ocupacion_por_piso(piso))

    return res

testcamas = [[True,False,False,False],
             [True,True,True,True],
             [True,True,False,False]
             ]

call = nivel_de_ocupacion(testcamas)

# 1 )
# si ambos chocan, -5 pts cada uno
# si ambos se desvían -10 pts cada uno
# si uno se descría y el otro sí, -15 pts para el que se desvía y +10pts para el que no

estrategias = {
    "pepe" : "me desvio siempre",
    "ana" : "me la banco y no me desvío",
    "pablo" : "me la banco y no me desvío",
    "maria" : "me desvio siempre",
    "lucho" : "me desvio siempre",
    "pau" : "me la banco y no me desvío",
    "sophi" : "me la banco y no me desvío"
}

def diccionario_a_lista_de_tuplas(diccionario:dict[str,str]) -> list[tuple[str,str]]:
    res: list[tuple[str,str]] = []
    
    for clave,valor in diccionario.items():
        tupla = (clave,valor)
        res.append(tupla)

    return res

def asignar_puntaje_individual(estrategias_lista:list[tuple[str,str]], jugador:str) -> int:
    res: int = 0

    for nombre,estrategia in estrategias_lista:
        if nombre == jugador:
            estrategia_jugador = estrategia
            
    for nombre,estrategia in estrategias_lista:
        if nombre != jugador:
            if estrategia_jugador == "me desvio siempre" and estrategia == "me desvio siempre":
                res -= 10
            elif estrategia_jugador == "me la banco y no me desvío" and estrategia == "me la banco y no me desvío":
                res -= 5
            elif estrategia_jugador == "me desvio siempre" and estrategia == "me la banco y no me desvío":
                res -= 15
            elif estrategia_jugador ==  "me la banco y no me desvío" and estrategia == "me desvio siempre":
                res += 10
    
    return res

def torneo_de_gallinas(estrategias:dict[str,str]) -> dict[str,int]:
    res: dict[str,int] = {}

    for nombre,_ in estrategias.items():
        jugador = nombre

        res[jugador] = asignar_puntaje_individual(diccionario_a_lista_de_tuplas(estrategias),jugador)

    return res

call = torneo_de_gallinas(estrategias)

print(call)

from queue import LifoQueue as Pila

def separar_palabras(texto:str) -> list[str]:
    res: list[str] = []
    palabra: str = ""
    espacio: str = " "

    for caracter in texto:
        if caracter != espacio:
            palabra+=caracter
        else:
            if palabra != "":
                res.append(palabra)
            palabra = ""

    if palabra != "":
        res.append(palabra)

    return res

def lista_sufijos(texto: str) -> list[str]:
    lista_palabras = separar_palabras(texto)
    res = []

    for palabra in lista_palabras:
        for indice in range(len(palabra)):
            sufijo = ""
            posicion = indice
            while posicion < len(palabra):
                sufijo += palabra[posicion]
                posicion += 1
            res.append(sufijo)

    return res

def invertir(palabra:str) -> list[str]:
    res: list[str] = []
    pila: Pila = Pila()

    for caracter in palabra:
        pila.put(caracter)
    
    while not pila.empty():
        letra = pila.get()
        res.append(letra)

    return res

def lista_a_str(lista:list[str]) -> str:
    res: str = ""

    for letra in lista:
        res += letra

    return res

def es_palindromo(palabra:str) -> bool:
    res: bool = True
    palabra_invertida: str = lista_a_str(invertir(palabra))

    if palabra != palabra_invertida:
        res = False

    return res

def cuantos_sufijos_son_palindromos(texto:str) -> int:
    res: int = 0
    sufijos: list[str] = lista_sufijos(texto)

    for palabra in sufijos:
        if es_palindromo(palabra):
            res += 1

    return res


from queue import Queue as Cola

# Ejercicio 1 (2,25 puntos)
# Implementar la función subsecuencia_mas_larga especificada (todos_consecutivos no es testeado)

# problema subsecuencia_mas_larga (in v: seq⟨Z⟩) : ZxZ {
#   requiere: { La longitud de v es distinto de 0 }
#   asegura: { Sea x la primera subsecuencia más larga en v tal que vale todos_consecutivos(x), la primera componente de res es igual a |x| y la segunda es igual al índice en v donde comenzaría x }
# }

# problema todos_consecutivos (in v: seq⟨Z⟩) : Bool {
#   asegura: { res == True <==> cada par de elementos adyacentes en v son números consecutivos, es decir, que su diferencia es igual a 1 }
# }

#le das una lista de numeros y te devuelve la longitud de la subsecuencia mas larga en la primera componente de la tupla, y la segunda componente es el indice donde comienza

def subsecuencia_mas_larga(v: list[int]) -> tuple[int, int]:
    inicio_secuencia_max: int = 0
    inicio_secuencia_actual: int = 0
    longitud_secuencia_max: int = 1
    longitud_secuencia_actual: int = 1

    for i in range(1, len(v)):
        diferencia = v[i] - v[i - 1]
        if diferencia == 1 or diferencia == -1:
            longitud_secuencia_actual += 1 #empieza a contar la longitud de la secuencia, el indice queda en 0
        else: #si llega el momento en el que la diferencia no es de 1...
            if longitud_secuencia_actual > longitud_secuencia_max: # queremos ver cuál es la más larga, entonces comparamos la actual con la máximoa
                longitud_secuencia_max = longitud_secuencia_actual
                inicio_secuencia_max = inicio_secuencia_actual # actualizamos todo pim pam

            longitud_secuencia_actual = 1 # la longitud se reinicia a 1
            inicio_secuencia_actual = i # el nuevo inicio es la posicion en la que se cortó la subsecuencia (mientras iba evaluando)

    if longitud_secuencia_actual > longitud_secuencia_max: # esto es para ver si la subseq más larga era justo la última
        longitud_secuencia_max = longitud_secuencia_actual
        inicio_secuencia_max = inicio_secuencia_actual

    tupla: tuple[int, int] = (longitud_secuencia_max, inicio_secuencia_max)
    return tupla


# Ejercicio 2 (2,25 puntos)
# Ana tiene exámenes de respuesta Verdadero ó Falso. Ella sabe que en cada examen la cantidad 
# de respuestas correctas cuyo valor es Falso es igual a la cantidad de respuestas correctas 
# cuyo valor es Verdadero. Tenemos el historial de las respuestas de cada exámen dados por Ana 
# en una cola. En cada uno Ana respondió todas las preguntas.

# problema mejor_resultado_de_ana (in examenes: Cola⟨ seq⟨Bool⟩ ⟩) : seq⟨Z⟩ {
#   requiere:{ Cada elemento de examenes es no vacío y tiene longitud par }
#   asegura: { res tiene la misma cantidad de elementos que examenes }
#   asegura: { res[i] es igual a la máxima cantidad de respuestas correctas que Ana podría haber respondido en el i-ésimo exámen resuelto en examenes, para 0 <= i < cantidad de elementos de examenes }
# }

def mejor_resultado_de_ana(examenes: Cola[list[bool]]) -> list[int]:
    res: list[int] = []
    cola_aux: Cola = Cola()

    while not examenes.empty():
        examen = examenes.get()
        cola_aux.put(examen)
        cant_verdaderos: int = 0
        cant_falsos: int = 0
        
        for choice in examen:
            if choice == True:
                cant_verdaderos += 1
            else:
                cant_falsos += 1

        if cant_verdaderos < cant_falsos:
            minimo = cant_verdaderos
        else:
            minimo = cant_falsos

        max_correctas = 2 * (minimo)
        res.append(max_correctas)

    while not cola_aux.empty():
        examenes.put(cola_aux.get())

    return res

c = Cola()
c.put([True,True,False,False]) # 4
c.put([True,False,False,False]) # 2
c.put([True,True,True,False]) # 2
c.put([True,False,True,False]) # 4
c.put([True,True,True,True]) # 0

call = mejor_resultado_de_ana(c)

# Ejercicio 3 (2,25 puntos)
# problema cambiar_matriz(inout A: seq⟨seq⟨Z⟩⟩) {
#   requiere: { Todas las filas de A tienen la misma longitud }
#   requiere: { El mínimo número que aparece en A es igual a 1 }
#   requiere: { El máximo número que aparece en A es igual a #filas de A por #columnas de A }
#   requiere: { No hay enteros repetidos en A }
#   requiere: { Existen al menos dos enteros distintos en A }
#   modifica: { A }
#   asegura: { A tiene exactamente las mismas dimensiones que A@pre }
#   asegura: { El conjunto de elementos que aparecen en A es igual al conjunto de elementos que aparecen en A@pre }
#   asegura: { A[i][j] != A@pre[i][j] para todo i, j en rango }
# }

def cambiar_matriz(A: list[list[int]]) -> None:
    cola_aux: Cola = Cola()
    total_filas: int = len(A)
    total_columnas: int = len(A[0])

    for fila in range(total_filas):
        for columna in range(total_columnas):
            cola_aux.put(A[fila][columna])

    primero = cola_aux.get()
    cola_aux.put(primero)

    for fila in range(total_filas):
        for columna in range(total_columnas):
            A[fila][columna] = cola_aux.get()


# Ejercicio 4 (2,25 puntos)
# Tenemos un texto que contiene palabras. Por simplicidad, las palabras están separadas únicamente por uno o más espacios.

# problema palabras_por_vocales (in texto: string): Diccionario⟨Z,Z⟩ {
#   requiere: { Si existe una letra vocal en texto, esta no lleva tildes, diéresis, ni ningún otro símbolo }
#   asegura: { Si existe una palabra en texto con x vocales en total, x es clave de res }
#   asegura: { Las claves de res representan la cantidad total de vocales de una palabra, y cada valor corresponde a la cantidad de palabras en texto con ese número de vocales. }
#   asegura: { Los valores de res son positivos }
# }

#ejemplo "hola como estas jejeje"

def texto_a_lista(texto:str) -> list[str]:
    res: list[str] = []
    espacio = " "
    palabra = ""

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

#esto va a dar las claves
def contar_vocales(texto: list[str], palabra: str) -> int:
    res: int = 0
    vocales: list[str] = ['a','e','i','o','u']

    for elemento in texto:
        if elemento == palabra:
            for caracter in elemento:
                if caracter in vocales:
                    res += 1
    return res

#esto va a dar los valores
def cant_palabras_con_misma_cant_vocales(texto: list[str], palabra: str) -> int:
    res: int = 0
    cant_vocales_palabra = contar_vocales(texto, palabra)

    for palabra2 in texto:
        if contar_vocales(texto, palabra2) == cant_vocales_palabra:
            res += 1

    return res

def palabras_por_vocales(texto: str) -> dict[int, int]:
    res: dict[int, int] = {}
    palabras_separadas: list[str] = texto_a_lista(texto)

    for palabra in palabras_separadas:
        cantidad_de_vocales: int = contar_vocales(palabras_separadas,palabra)
        palabras_con_igual_cant_vocales: int = cant_palabras_con_misma_cant_vocales(palabras_separadas,palabra)

        if cantidad_de_vocales not in res:
            res[cantidad_de_vocales] = palabras_con_igual_cant_vocales

    return res

# Ejercicio 5 (1 punto)
# ¿Por qué en Paradigma Imperativo no existe la transparencia referencial?
# [ ] Utilizamos otro mecanismo de repetición de código, en lugar de recursión usamos la iteración (FOR, WHILE, DO WHILE).
# [X] Tenemos una nueva instrucción, la asignación, que nos permite cambiar el valor de una variable
# [ ] El orden en que se ejecutan las instrucciones del programa es diferente


# 2) Posición umbral [2 puntos]
# Durante una noche en un restaurant pasan varios grupos de diversa cantidad de
# personas. Para llevar control de esto, el dueño va anotando en su libreta
# cuánta gente entra y sale. Para hacerlo rápido decide que la mejor forma de
# llevarlo adelante es escribir un número al lado del otro, usando números
# positivos para los grupos que entran y negativos para los que salen. Gracias a
# estas anotaciones el dueño es capaz de hacer análisis del flujo de clientes.
# Por ejemplo, le interesa saber en qué momento de la noche superó una
# determinada cantidad de clientes totales que ingresaron (sin importar cuántos
# hay en el momento en el local).

# Implementar la función pos_umbral, que dada una secuencia de enteros (puede
# haber negativos) devuelve la posición en la cual se supera el valor de umbral,
# teniendo en cuenta sólo los elementos positivos. Se debe devolver -1 si el
# umbral no se supera en ningún momento

# problema pos_umbral (in s: seq<Z>, in u: Z) : Z {
#     requiere: u ≥ 0
#     asegura: {res=-1 si el umbral no se supera en ningún momento }
#     asegura: {Si el umbral se supera en algún momento, res es la primera
#     posición tal que la sumatoria de los primeros res+1 elementos
#     (considerando solo aquellos que son positivos) es estrictamente mayor que
#     el umbral u }
# Por ejemplo, dadas
# s = [1,-2,0,5,-7,3]
# u = 5
# se debería devolver res = 3

def pos_umbral(s:list[int], u:int) -> int:

    suma_positivos: int = 0

    for numero in range(len(s)):
        if numero > u:
            for numero in range(u,len(s)):
                if s[numero] > 0:
                    suma_positivos += s[numero]
            return suma_positivos
            
    return -1

# 3) Columnas repetidas [3 puntos]
# Implementar la función columnas_repetidas, que dada una matriz no vacía de m
# columnas (con m par y m ≥ 2) devuelve True si las primeras m/2 columnas son
# iguales que las últimas m/2 columnas. Definimos a una secuencia de secuencias
# como matriz si todos los elementos de la primera secuencia tienen la misma
# longitud.


# problema columnas_repetidas(in mat:seq<seq<Z>> ) : Bool {
#     requiere: {|mat| > 0}
#     requiere: {todos los elementos de mat tienen igual longitud m, con m > 0
#     (los elementos de mat son secuencias)}
#     requiere: {todos los elementos de mat tienen longitud par (la cantidad de
#     columnas de la matriz es par)}
#     asegura: {(res = true) <=> las primeras m/2 columnas de mat son iguales a
#     las últimas m/2 columnas}
# }

# Por ejemplo, dada la matriz
# m = [[1,2,1,2],
#    [-5,6,-5,6],
#    [0,1,0,1]]
# se debería devolver res = true

def traspuesta(mat:list[list[int]]) -> list[list[int]]:
    res: list[list[int]] = []
    total_filas: int = len(mat)
    total_columnas: int = len(mat[0])

    for columna in range(total_columnas):
        fila_traspuesta: list[int] = []
        for fila in range(total_filas):
            celda: int = mat[fila][columna]
            fila_traspuesta.append(celda)
        res.append(fila_traspuesta)

    return res

def columnas_repetidas(mat:list[list[int]]) -> bool:
    res: bool = True
    matriz_traspuesta: list[list[int]] = traspuesta(mat)
    mitad: list[list[int]] = len(matriz_traspuesta) // 2

    for fila in range(mitad):
        if matriz_traspuesta[fila] != matriz_traspuesta[fila + mitad]:
            res = False

    return res
