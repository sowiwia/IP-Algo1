#1.1
#Usando if...
def pertenece(s:list[int], e:int) -> bool:
    res: bool = False
    if e in s:
        return True
    else:
        return False

#Usando while...
def pertenece2(s:list[int], e:int) -> bool:
    res: bool = False
    i = 0
    while i < len(s):
        if s[i] == e:
            return True
        i += 1
    return False

#Usando for...
def pertenece3(s:list[int], e:int) -> bool:
    res: bool = False
    for i in s:
        if e == i:
            return True
    return False

#1.2
def divide_a_todos(s:list[int], e:int) -> bool:
    res: bool = False
    i = 0
    while i < len(s):
        if e % s[i] != 0:
            return False
        i += 1
    return True

#1.3
def suma_res(s:list[int]) -> int:
    res: int = 0
    i: int = 0
    while i < len(s):
        res += s[i]
        i += 1
    return res

#1.4
def maximo(s:list[int]) -> int:
    res: int = 0
    i: int = 0
    while i < len(s):
        if s[i] > res:
            res = s[i]
        i+=1
    return res

#1.5
def minimo(s:list[int]) -> int:
    res: int = 0
    i: int = 0
    while i < len(s):
        if s[i] < res:
            res = s[i]
        i+=1
    return res

#1.6
def ordenados(s: list[int]) -> bool:
    res: bool = True
    i: int = 0
    while i < len(s) - 1:
        if s[i] > s[i+1]:
            res = False
        i+=1
    return res

#1.7
def pos_maximo(s:list[int]) -> int:
    res: int = 0
    i: int = 0
    if len(s) == 0:
        return -1
    else:
        while i < len(s):
            if s[i] >= s[res]:
                res = i
            i +=1
        return res

#1.8
def pos_minimo(s:list[int]) -> int:
    res: int = 0
    i: int = 0
    if len(s) == 0:
        return -1
    else:
        while i < len(s):
            if s[i] <= s[res]:
                res = i
            i += 1
        return res
    
#1.9
def long_mayorASiete(s:list[str]) -> bool:
    res: bool = False
    i: int = 0
    while i < len(s):
        if len(s[i]) > 7:
            res = True
        i += 1
    return res

#1.10
def es_palindroma(s: str) -> bool:
    res: bool = True
    primero: int = 0
    ultimo: int = len(s) - 1
    while primero < ultimo:
        if s[primero] != s[ultimo]:
            res = False
        primero+=1
        ultimo-=1
    return res

#1.11
def iguales_consecutivos(s:list[int]) -> bool:
    res: bool = False
    i: int = 0
    while i < len(s)-2:
        if s[i] ==  s[i+1] == s[i+2]:
            res = True
        i+=1
    return res

#1.12
def vocales_distintas(s: str) -> bool:
    res: bool = False
    vocales: list[str] = ['a', 'e', 'i', 'o', 'u']
    contador: int = 0
    for vocal in vocales:
        if vocal in s:
            contador += 1
    if contador >= 3:
        res = True
    return res

#1.13
def pos_secuencia_ordenada_mas_larga(s: list[int]) -> int:
    indice_actual: int = 0
    longitud_actual: int = 1
    indice_maximo: int = 0
    longitud_maxima: int = 1
    res: int = 0
    for i in range(len(s) - 1):
        if s[i] <= s[i + 1]:
            longitud_actual += 1
        else:
            if longitud_actual > longitud_maxima:
                indice_maximo = indice_actual
                longitud_maxima = longitud_actual
            indice_actual = i + 1
            longitud_actual = 1
    if longitud_actual > longitud_maxima:
        indice_maximo = indice_actual
        longitud_maxima = longitud_actual
    res = indice_maximo
    return res

#1.14
def cantidad_digitos_impares(s:list[int]) -> int:
    res: int = 0
    for numero in s:
        while numero > 0:
            digito = numero % 10
            if digito % 2 != 0:
                res += 1
            numero = numero // 10
    return res


#2.1
def CerosEnPosicionesPares(s:list[int]):
    i: int = 0
    for numero in s:
        if i % 2 == 0:
            s[i] = 0
        i += 1
    return s

#2.2
def CerosEnPosicionesPares2(s:list[int]) -> list[int]:
    res: list[int] = []
    for i in range(len(s)):
        if i % 2 == 0:
            res.append(0)
        else:
            res.append(s[i])
    return res

#2.3
def sin_vocales(s:str) -> str:
    res: str = ""
    vocales: list[str] = ['a','e','i','o','u']
    for letra in s:
        if letra not in vocales:
            res += letra
    return res

#2.4
def reemplaza_vocales(s:str) -> str:
    res: str = ""
    vocales: list[str] = ['a','e','i','o','u']
    for letra in s:
        if letra in vocales:
            res += ' '
        else:
            res += letra
    return res
        
#2.5
def da_vuelta_str(s:str) -> str:
    res: str = ""
    for letra in s:
        res = letra + res
    return res

#2.6
def eliminar_repetidos(s:str) -> str:
    res: str = ""
    for letra in s:
        if letra not in res:
            res += letra
    return res

#3
# devuelve 1 si todas las notas son >= 4 y el promedio >=7
# devuelve 2 si todas las notas son >= 4 y el 4 <= promedio < 7
# devuelve 3 si alguna de las notas < 4 y el promedio < 4
    
def resultadoMateria(notas: list[int]) -> int:
    suma = 0
    aprobado = True

    for nota in notas:
        suma += nota
        if nota < 4:
            aprobado = False

    promedio = suma / len(notas)

    if aprobado and promedio >= 7:
        return 1
    elif aprobado and promedio >= 4:
        return 2
    else:
        return 3

#4
#R resta dinero del total
#I suma dinero al total
def saldoActual(movimientos:list[tuple[str, int]]) -> int:
    res: int = 0
    ingreso: str = "I"
    retiro: str = "R"
    for transaccion, monto in movimientos:
        if transaccion == ingreso:
            res += monto
        elif transaccion == retiro:
            res -= monto
    return res

#5.1
def pertenece_a_cada_uno_version_1(s:list[list[int]], e:int) -> list[bool]:
    res: list[bool] = []
    for lista in s:
        if pertenece(lista,e):
            res.append(True)
        else:
            res.append(False)
    return res

#5.2 y #5.3 no entiendo xd

#6.1
def esMatriz(s:list[list[int]]) -> bool:
    res: bool = True
    for fila in range(len(s)):
        if len(s[0]) != len(s[fila]):
            res = False
    return res

#6.2
def filas_ordenadas(m:list[list[int]]) -> list[bool]:
    res: list[bool] = []
    for fila in m:
        if ordenados(fila):
            res.append(True)
        else:
            res.append(False)
    return res

#6.3
def columna(m:list[list[int]], c:int) -> list[int]:
    res: list[int] = []
    for fila in m:
        res.append(fila[c])
    return res

#6.4
def columnas_ordenadas(m:list[list[int]]) -> list[bool]:
    res: list[bool] = []
    for i in range(len(m[0])):
        if ordenados(columna(m,i)):
            res.append(True)
        else:
            res.append(False)
    return res

#6.5
def transponer(m:list[list[int]]) -> list[list[int]]:
    res: list[list[int]] = []
    for i in range(len(m[0])):
        res.append(columna(m,i))
    return res

#6.6
# 


def quien_gana_tateti(m:list[list[str]]) -> int:
    res: int = 2
    i: int = 0
    for fila in m:
        if fila == ['X', 'X', 'X']:
            return 1
        if fila == ['O', 'O', 'O']:
            return 0
# veo columnas con i 
    for i in range(3):
        if m[0][i] == m[1][i] == m[2][i] == 'X':
            return 1
        if m[0][i] == m[1][i] == m[2][i] == 'O':
            return 0
# veo diagonales (war)
    if (m[0][0] == m[1][1] == m[2][2] == 'X') or (m[0][2] == m[1][1] == m[2][0] == 'X'):
        return 1
    if (m[0][0] == m[1][1] == m[2][2] == 'O') or (m[0][2] == m[1][1] == m[2][0] == 'O'):
        return 0

    return res

#7.1
