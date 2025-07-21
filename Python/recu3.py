from queue import Queue as Cola
from queue import LifoQueue as Pila

# Ejercicio 1)
def permutaciones_suma(numeros: list[int]) -> list[int]:
    res : list[int] = []

    for i in range(len(numeros)):
        for j in range(len(numeros)):
            if i < j:
                res.append(numeros[i] + numeros[j])
            
    return res

def cantidad_parejas_que_suman(s: list[int], n: int) -> int:
    res: int = 0
    sumas_parejas: list[int] = permutaciones_suma(s)

    for numero in sumas_parejas:
        if numero == n:
            res+=1
    
    return res

# Ejercicio 2)
# (nombre,metodo_de_pago,cant_productos)

def pasar_por_autoservicio(clientes: Cola[str,str,int]) -> str:
    cola_aux: Cola = Cola()

    while not clientes.empty():
        cliente = clientes.get()
        nombre: str = cliente[0]
        metodo_pago: str = cliente[1]
        cant_productos: str = cliente[2]
        
        if metodo_pago != "efectivo" and cant_productos <= 15:
            res: str = nombre
        else:
            cola_aux.put(cliente)

    while not cola_aux.empty():
        clientes.put(cola_aux.get())
    
    return res

c = Cola()

c.put(("Ana", "efectivo", 13))
c.put(("Juan", "qr", 22))
c.put(("Bruno", "tarjeta", 14))

# Ejercicio 3)
def trasponer_matriz(matriz: list[list[int]]) -> list[list[int]]:
    res: list[list[int]] = []

    for j in range(len(matriz[0])):
        nueva_fila: list[int] = []
        for i in range(len(matriz)):
            nueva_fila.append(matriz[i][j])
        res.append(nueva_fila)

    return res

def invertir_fila(fila:list[int]) -> list[int]:
    res:list[int] = []
    pila : Pila = Pila()

    for elemento in fila:
        pila.put(elemento)

    while not pila.empty():
        res.append(pila.get())

    return res

def intercambiar_e_invertir_columnas(A: list[list[int]], col1: int, col2: int) -> None:
    traspuesta: list[list[int]] = trasponer_matriz(A)

    # ACA INVIERTO
    fila_col1_invertida = invertir_fila(traspuesta[col1])
    fila_col2_invertida = invertir_fila(traspuesta[col2])

    # aca intercambio
    traspuesta[col1] = fila_col2_invertida
    traspuesta[col2] = fila_col1_invertida

    #vuelvo a trasponer????? AA
    A_final = trasponer_matriz(traspuesta)

    # aca modifico
    for i in range(len(A)):
        for j in range(len(A[0])):
            A[i][j] = A_final[i][j]

mat = [[1,2,3],[40,50,60], [-7,-8,-9]]
intercambiar_e_invertir_columnas(mat,1,2)
print(mat)

# Ejercicio 4)
def mantuvieron_residencia(censo1: dict[str,str], censo2: dict[str,str]):
    res: dict[str,int] = {}

    for persona in censo1:
        localidad = censo1[persona]
    
        if persona in censo2 and censo2[persona] == localidad:
            if localidad not in res:
                res[localidad] = 1
            else:
                res[localidad] +=1

    return res

print(mantuvieron_residencia({'Juan': 'Merlo', 'Ana': 'Merlo'}, {'Juan': 'Castelar', 'Ana': 'Merlo'}))