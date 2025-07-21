import math

# 1.1
def imprimir_hola_mundo():
    print("¡Hola mundo!")

# 1.2
def imprimir_un_verso():
    print("Verso1 blablabla \nVerso 2 blablabla \nVerso3 blablabla")

# 1.3
def raizDe2():
    print(round(math.sqrt(2), 4))

# 1.4
def factorial_2() -> float:
    res: float = 2 * 1
    return res
res = factorial_2()

# 1.5
def perimetro2() -> float:
    res: float = 2 * math.pi
    return res

# 2.1
def imprimir_saludo(nombre: str):
    print("Hola " + nombre)

# 2.2
def raiz_cuadrada_de(numero: int) -> float:
    res: float = math.sqrt(numero)
    return res

# 2.3
def fahrenheit_a_celcius(temp_far: float) -> float:
    res: float = (temp_far - 32) * 5 / 9
    return res

# 2.4
def imprimir_dos_veces(estribillo: str) -> str:
    res: str = (estribillo + "\n") * 2
    return res

# 2.5
def es_multiplo_de(n:int, m:int) -> bool:
    res: bool = n % m == 0
    return res

# 2.6
def es_par(numero:int) -> bool:
    res: bool = es_multiplo_de(numero, 2)
    return res

# 2.7
def cantidad_de_pizzas(comensales: int, min_cant_de_porciones: int) -> int:
    total_porciones: int = comensales * min_cant_de_porciones
    pizzas: int = math.ceil(total_porciones / 8)
    res: int = pizzas
    return res

# 3.1
def alguno_es_0(numero1:int, numero2:int) -> bool:
    res: bool = numero1 == 0 or numero2 == 0
    return res

# 3.2
def ambos_son_0(numero1:int, numero2:int) -> bool:
    res: bool = numero1 == 0 and numero2 == 0
    return res

# 3.3
def es_nombre_largo(nombre:str) -> bool:
    res: bool = 3 <= len(nombre) <= 8
    return res

# 3.4
def es_bisiesto(anio:int) -> bool:
    res: bool = es_multiplo_de(anio, 400) or (es_multiplo_de(anio, 4) and not es_multiplo_de(anio,100))
    return res

# 4.1
def peso_pino(altura_m:int) -> int:
    altura_cm = altura_m * 100
    hasta_3m = min(altura_cm, 300)
    sobre_3m = max(altura_cm - 300, 0)
    peso = hasta_3m * 3 + sobre_3m * 2
    return peso

#4.2
def es_peso_util(peso:int) -> bool:
    if 400 <= peso <= 1000:
        return True
    else:
        return False

#4.3
def sirve_pino(altura:int) -> bool:
    peso = peso_pino(altura)
    if 400 <= peso <= 1000:
        return True
    else:
        return False

#4.4
def sirve_pino2(altura:int) -> bool:
    return es_peso_util(peso_pino(altura))

#5.1
def devolver_el_doble_si_es_par(numero:int) -> int:
    if numero % 2 == 0:
        return numero * 2
    else:
        return numero
    
#5.2
def devolver_el_valor_si_es_par_si_no_el_que_sigue(numero:int) -> int:
    if numero % 2 == 0:
        return numero
    else:
        return numero + 1

#5.3
def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(numero:int) -> int:
    if numero % 9 == 0:
        return numero * 3
    elif numero % 3 == 0:
        return numero * 2
    else:
        return numero

#5.4
def lindo_nombre(nombre:str) -> str:
    if len(nombre) >= 5:
        return "Tu nombre tiene muchas letras!"
    else:
        return "Tu nombre tiene menos de 5 caracteres"

#5.5
def elRango(numero:int) -> str:
    if numero < 5:
        return "Menor a 5"
    if 10 <= numero <= 20:
        return "Entre 10 y 20"
    if numero > 20:
        return "Mayor a 20"

#5.6
def agarrini_la_palini(genero:str, edad:int) -> str:
    if (edad < 18) or (edad >= 60 and genero == 'F') or (edad >= 65 and genero == 'M'):
        return "Andá de vacaciones"
    else:
        return "Te toca trabajar"
    
#6.1
def del1_al10():
    numero = 1
    while numero <= 10:
        print(numero) 
        numero += 1

#7.1
def del1_al10_2():
    for numero in range(1,11):
        print(numero)

#6.2
def pares_entre10_y40():
    numero = 10
    while numero <= 40:
        if numero % 2 == 0:
            print(numero)
        numero += 1

#7.2
def pares_entre_10_y40_2():
    for numero in range(10,41,2):
        print(numero)

#6.3
def eco():
    eco = 0
    while eco < 10:
        print ("eco")
        eco += 1

#7.3
def eco_2():
    for eco in range(1,11):
        print("eco")

#6.4
def cuenta_regresiva(numero:int):
    while numero > 0:
        print (numero)
        numero -= 1
    print ("Despegue")

#7.4
def cuenta_regresiva_2(numero:int):
    for numero in range(numero,0,-1):
        print(numero)
    print ("Despegue")

#6.5
def viaje_tiempo(partida:int, llegada:int):
    while llegada < partida:
        partida -= 1
        print("Viajó un año al pasado, estamos en el año: ", partida)

#7.5
def viaje_tiempo(partida: int, llegada: int):
    for año in range(partida - 1, llegada - 1, -1):
        print("Viajó un año al pasado, estamos en el año: ", año)

#6.6
def viaje_tiempo2(partida:int, llegada:int):
    while (llegada >= 384) and (llegada < partida):
        partida -=1
        print("Viajó un año al pasado, estamos en el año: ", partida)

#7.6
def viaje_tiempo2(partida: int, llegada: int):
    if llegada >= 384:
        for año in range(partida - 1, llegada - 1, -1):
            print("Viajó un año al pasado, estamos en el año: ", año)
