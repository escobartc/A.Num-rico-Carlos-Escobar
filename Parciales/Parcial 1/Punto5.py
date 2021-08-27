import numpy as np
import sympy as sp
from sympy import Poly
import matplotlib.pyplot as plt

# Método de Newton-Raphson

# INGRESO se definen la función y su derivada
fx = lambda x: np.longdouble(np.exp(x) - x - 1)
dfx = lambda x: np.longdouble(np.exp(x) - 1)

x0 = 1
tolera = 1e-8

# PROCEDIMIENTO
# se crea una tabla para meter los valores que imprimiremos mas adelante, xi, xnuevo y su error
tabla = []
error = abs(2*tolera)
xi = x0
it = 0
#Se realiza el ciclo del metodo de newton
while (error>=tolera):
    xnuevo = xi - fx(xi)/dfx(xi)
    error = abs(xnuevo-xi)
    it = it + 1
    tabla.append([xi,xnuevo,error]) #Se agregan a la tabla los valores
    xi = xnuevo

# convierte la lista a un arreglo.
tabla = np.array(tabla)
n=len(tabla)

#Se hace el format de como queremos que se impriman las raíces usando la tolerancia
formato = "{:."+str(tolera).split('-')[1]+"f}"
# SALIDA
print(['xi', 'xnuevo', 'error'])
np.set_printoptions(precision = 4)
print(tabla)
print('raiz en: ', formato.format(xi))
print('con error de: ',error)


x = []
y = []
z = []
m = 0
while m < n:
    x.append(tabla[m][0])
    y.append(tabla[m][1])
    z.append(tabla[m][2])
    #print(x[m],"  ",y[m])
    m = m + 1
    
#Se procede a imprimir la gráfica
plt.plot(x, z, label = "xi")
plt.plot(y, z, label = "xnuevo")
plt.legend()  
plt.title("Orden de convergencia")
plt.xlabel("Resultados Newton Raphson")
plt.ylabel("Error")
plt.show()

