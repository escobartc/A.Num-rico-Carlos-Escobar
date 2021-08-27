import numpy as np
import sympy as sp
from sympy import Poly
import matplotlib.pyplot as plt

# Método de Newton-Raphson

# INGRESO
fx = lambda x: np.longdouble(np.exp(x) - x - 1)
dfx = lambda x: np.longdouble(np.exp(x) - 1)

x0 = 1
tolera = 1e-8

# PROCEDIMIENTO
tabla = []
error = abs(2*tolera)
xi = x0
it = 0
while (error>=tolera):
    xnuevo = xi - fx(xi)/dfx(xi)
    error = abs(xnuevo-xi)
    it = it + 1
    tabla.append([xi,xnuevo,error])
    xi = xnuevo

# convierte la lista a un arreglo.
tabla = np.array(tabla)
n=len(tabla)


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
    
    
plt.plot(x, z, label = "xi")
plt.plot(y, z, label = "xnuevo")
plt.legend()  
plt.title("Orden de convergencia")
plt.xlabel("Resultados Newton Raphson")
plt.ylabel("Error")
plt.show()

