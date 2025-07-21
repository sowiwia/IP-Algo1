from queue import LifoQueue as Pila
from queue import Queue as Cola
from typing import TextIO
import random

#RECORDAR
# p = Pila() Crea una pila
# p.put() Apila algo
# p.get() Desapila un elemento
# p.empty() Es un bool y devuelve True si la pila está vacía

# Del labo...)
def pertenece_pila (p: Pila, e) -> bool:
    res: bool = False
    pila_auxiliar = Pila()

    while not p.empty():
        elemento = p.get()
        if elemento == e:
            res = True
        pila_auxiliar.put(elemento)

    while not pila_auxiliar.empty():
        p.put(pila_auxiliar.get())

    return res

# 1)
def generar_nros_al_azar(cantidad: int, desde: int, hasta: int) -> Pila:
    res: Pila[int] = Pila()

    for elemento in range(cantidad):
        res.put(random.randint(desde,hasta))

    return res 

# 2)
def cantidad_elementos (p: Pila) -> int:
    res: int = 0
    pila_temporal = Pila() # esto porque cada vez que hago p.get saco un elemento de la pila original, entonces la pongo despues en la pila temporal para restaurar los elementos

    while not p.empty(): # mientras la pila original no esté vacía
        elemento = p.get() # saco un elemento (siempre saca el ultimo primero, hasta que se queda vacía la pila)
        res += 1 # sumo 1 al contador
        pila_temporal.put(elemento) # guardo ese elemento que saqué en la temporal

    while not pila_temporal.empty(): # mientras la pila temporal no esté vacía
        p.put(pila_temporal.get()) # pongo los elementos de la pila temporal en la pila original

    return res

# 3)
def buscar_el_maximo(p:Pila[int]) -> int:
    pila_auxiliar: Pila = Pila()
    maximo: int = p.get()
    pila_auxiliar.put(maximo)

    while not p.empty():
        elemento = p.get()
        if elemento > maximo:
            maximo = elemento
        pila_auxiliar.put(elemento)

    while not pila_auxiliar.empty():
        p.put(pila_auxiliar.get)

    return maximo

#4)
#supongo q es algo tipo... 
# [("fulanito",2)]
# [("pepe",8)] 
# [("asdasd", 5)]
# y devuelte la tupla con mayor nota, compara segundas componentes y coso

def buscar_nota_maxima(p: Pila[tuple[str, int]]) -> tuple[str, int]:
    pila_auxiliar: Pila = Pila()
    res: tuple[str, int] = p.get()
    pila_auxiliar.put(res)

    while not p.empty():
        otra_tupla: tuple [str,int] = p.get()

        if otra_tupla[1] > res[1]:
            res = otra_tupla
        pila_auxiliar.put(otra_tupla)    


    while not pila_auxiliar.empty():
        p.put(pila_auxiliar.get())

    return res

p = Pila()
p.put(("fulanito",2))
p.put(("pepe",8))
p.put(("asdasd", 5))


#5
def esta_bien_balanceada(s: str) -> bool:
    res: bool = True
    pila_parentesis: Pila = Pila()

    for letra in s:
        if letra == '(':
            pila_parentesis.put(letra)
        elif letra == ')':
            if pila_parentesis.empty():
                res = False
                break
            else:
                pila_parentesis.get()

    if not pila_parentesis.empty():
        res = False
    
    return res

#6
def str_a_tokens(s:str) -> list[str]:
    res: list[str] = []
    token: str = ""

    for caracter in s:
        if caracter != " ":
            token += caracter
        else:
            res.append(token)
            token = ""

    if token != "":
        res.append(token)

    return res

def evaluar_expresion(s: str) -> float:
    tokens_en_lista: list[str] = str_a_tokens(s)
    operadores_binarios : list[str] = ['+','-','*','/']
    pila_auxiliar: Pila = Pila()

    for elemento in tokens_en_lista:
        if elemento not in operadores_binarios:
            pila_auxiliar.put(float(elemento))
        else:
            segundo_elemento = pila_auxiliar.get()
            primer_elemento = pila_auxiliar.get()

            if elemento == '+':
                res: float = primer_elemento + segundo_elemento
            elif elemento == '-':
                res: float = primer_elemento - segundo_elemento
            elif elemento == '*':
                res: float = primer_elemento * segundo_elemento
            elif elemento == '/':
                res: float = primer_elemento / segundo_elemento

            pila_auxiliar.put(res)

    return pila_auxiliar.get()

#7)
def intercalar(p1: Pila, p2: Pila) -> Pila:
    pila_intercalada: Pila = Pila()

    while not p1.empty() or not p2.empty:
        if not p1.empty():
            elemento1 = p1.get()
            pila_intercalada.put(elemento1)
        if not p2.empty():
            elemento2 = p2.get()
            pila_intercalada.put(elemento2)

    return invertir_pila(pila_intercalada)

def invertir_pila (p: Pila) -> Pila:
    pila_invertida: Pila = Pila()

    while not p.empty():
        elemento = p.get()
        pila_invertida.put(elemento)

    return pila_invertida

# COOOLAAAAAS
#8) este es igual xd
def generar_nros_al_azar_cola(cantidad: int, desde: int, hasta: int) -> Cola:
    res: Cola = Cola()

    for elemento in range(cantidad):
        res.put(random.randint(desde,hasta))

    return res

#9)
def cantidad_elementos_cola(c:Cola) -> int:
    res: int = 0
    cola_aux: Cola = Cola()

    while not c.empty():
        elemento = c.get()
        res += 1
        cola_aux.put(elemento)

    while not cola_aux.empty():
        c.put(cola_aux.get())

    return res

c = Cola()
c.put(1)
c.put(2)
c.put(3)

#10)
#recordar colas es FIFO First In First Out
# si tengo una cola (1,2,3,4) se evalúa en orden (1,2,3,4)
# en esta funcion queda literal igual que la de pilas xd
def buscar_el_maximo(c: Cola[int]) -> int:
    cola_aux: Cola = Cola()

    maximo = c.get()
    cola_aux.put(maximo)

    while not c.empty():
        elemento = c.get()
        if elemento > maximo:
            maximo = elemento
        cola_aux.put(elemento)

    while not cola_aux.empty():
        c.put(cola_aux.get())

    return maximo

c = Cola()
c.put(1)
c.put(2)
c.put(5)
c.put(1)

#11)
def buscar_nota_minima(c:Cola[tuple[str,int]]) -> tuple[str,int]:
    cola_auxiliar: Cola = Cola()
    minimo: tuple[str,int] = c.get()
    cola_auxiliar.put(minimo)
    
    while not c.empty():
        candidato = c.get()
        if candidato[1] < minimo[1]:
            minimo = candidato
            cola_auxiliar.put(candidato)

    while not cola_auxiliar.empty():
        c.put(cola_auxiliar.get())

    return minimo

c = Cola()

c.put(("pepe",8))
c.put(("fulanito",2))
c.put(("asdasd", 5))

#12)

def intercalar(c1: Cola, c2: Cola) -> Cola:
    cola_intercalada: Cola = Cola()

    while not c1.empty() or not c2.empty():
        if not c1.empty():
            elemento1 = c1.get()
            cola_intercalada.put(elemento1)
        if not c2.empty():
            elemento2 = c2.get()
            cola_intercalada.put(elemento2)
    
    return cola_intercalada

c1 = Cola()
c2 = Cola()

c1.put(4)
c1.put(3)
c1.put(5)
c2.put(1)
c2.put(1)


#13)

def armar_secuencia_de_bingo() -> Cola[int]:
    res: Cola = Cola()

    for numero in range(100):
        res.put(random.randint(0,99))
    
    return quitar_repetidos(res)

def es_repetido(c: Cola[int], elemento: int) -> bool:
    res: bool = False
    cola_aux: Cola[int] = Cola()

    while not c.empty():
        coso = c.get()
        if coso == elemento:
            res = True
        cola_aux.put(coso)

    while not cola_aux.empty():
        c.put(cola_aux.get())

    return res

def quitar_repetidos(c: Cola[int]) -> Cola[int]:
    cola_sin_repetidos: Cola = Cola()
    cola_aux: Cola = Cola()

    while not c.empty():
        elemento = c.get()
        if not es_repetido(c,elemento):
            cola_sin_repetidos.put(elemento)
        cola_aux.put(elemento)

    while not cola_aux.empty():
        c.put(cola_aux.get())

    return cola_sin_repetidos

def gano_juego(carton: list[int], aciertos: list[int]) -> bool:
    return len(aciertos) == len(carton)


def jugar_carton_de_bingo(carton: list[int], bolillero: Cola[int]) -> int:
    cantidad: int = 0
    bolillero_aux: Cola[int] = Cola()
    aciertos: list[int] = []

    while not bolillero.empty():
        bola: int = bolillero.get()
        cantidad += 1
        bolillero_aux.put(bola)

        if bola in carton and bola not in aciertos:
            aciertos.append(bola)

        if gano_juego(carton, aciertos):
            break

    while not bolillero_aux.empty():
        bolillero.put(bolillero_aux.get())

    return cantidad

#14)

def pacientes_urgentes(c: Cola[tuple[int,str,str]]) -> int:
    cantidad: int = 0
    cola_aux: Cola = Cola()

    while not c.empty():
        paciente = c.get()
        if paciente[0] < 4:
            cantidad += 1
        cola_aux.put(paciente)

    while not cola_aux.empty():
        c.put(cola_aux.get())

    return cantidad

c = Cola()
c.put((2,"Ines","Nosedeespecialidades"))
c.put((10,"Pepe","sisiloquesea"))
c.put((4,"Balbla","ehhh"))

#16)

# .keys() es para manejarse con las claves, tipo for elemento in diccionario.keys()
# .values() es para manejarse con los valores de las claves
# .items() es para trabajar con las tuplas de los diccionarios, te puede devolver ciertas tuplas dependiendo de las condiciones que pongas
# .pop(clave) elimina la clave y el valor
# .clear() vacía todo el diccionario

def calcular_promedio(notas: list[tuple[str, float]]) -> list[tuple[str, float]]:
    res: list[tuple[str, float]] = []
    estudiantes: list[str] = []

    for estudiante, _ in notas:
        if estudiante not in estudiantes:
            estudiantes.append(estudiante)

    for estudiante in estudiantes:
        suma: int = 0
        cantidad: int = 0

        for nombre,nota in notas:
            if nombre == estudiante:
                suma += nota
                cantidad += 1

        promedio: float = suma / cantidad
        res.append(estudiante,promedio)

    return res
        

def calcular_promedio_por_estudiante(notas: list[tuple[str, float]]) -> dict[str, float]:
    res: dict[str,float] = {}
    promedios: list[tuple[str,float]] = calcular_promedio(notas)
    
    for estudiante,promedio in promedios:
        res[estudiante] = promedio
    return res

#17

historiales = {
    'sophi' : 'youtube.com'
}

def visitar_sitio(historiales: dict[str,Pila[str]], usuario: str, sitio: str):

    if usuario in historiales:
        sitios: Pila[str] = historiales[usuario]
        sitios.put(sitio)
        historiales[usuario] = sitios

    else:
        sitios: Pila[str] = Pila()
        sitios.put(sitio)
        historiales[usuario] = sitios

def navegar_atras(historiales: dict[str,Pila[str]], usuario:str):
    res: str = historiales[usuario].get()

    return res

#18)

def agregar_producto (inventario : dict[str,dict[str,int|float]], nombre : str , precio : float , cantidad : int) -> None:
    valores_prod = {
        "precio" : precio,
        "cantidad" : cantidad
    }
    inventario[nombre] = valores_prod

def actualizar_stock(inventario: dict[str,dict[str,int|float]], nombre: str, cantidad: float):

    inventario[nombre]["cantidad"] = cantidad

def actualizar_precio(inventario: dict[str,dict[str,int|float]], nombre: str, precio: float):

    inventario[nombre]["precio"] = precio

def calcular_valor_inventario(inventario: dict[str,dict[str,int|float]]) -> float:
    valor_total: float = 0

    for nombre in inventario:
        valor_total += inventario[nombre]["precio"] * inventario[nombre]["cantidad"]

    return valor_total
