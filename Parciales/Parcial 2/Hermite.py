# Parcial punto 1 

import numpy as np
import sympy as sym
import matplotlib.pyplot as plt
from sympy import *

'''
# INGRESO , Datos de prueba de tiempo y distancia
xi = np.array([0, 3, 5, 8])
fi = np.array([0, 255, 383, 623])

'''

def posicion(x):
    
    return 37*x**3/40 - 58*x**2/5 + 4459*x/40
    
def velocidad(x):
    return -13*x**3/120 + 31*x**2/30 - 35*x/24 + 75 


def ace(x):
    return 31/15*x**14/15 - 13/40*x**39/40 - 35/24

def aceleracion():
    for i in range (0,50):
        if(ace(i)>55):
            print("La aceleración supera en t= ", i)
        
            
         
    
# INGRESO , Datos de prueba de tiempo y velocidad
xi = np.array([0, 3, 5, 8])
fi = np.array([75, 77, 80, 74])

# PROCEDIMIENTO
# Polinomio de Hermite
n = len(xi)
x = sym.Symbol('x')
polinomio = 0
divisorL = np.zeros(n, dtype = float)
for i in range(0,n,1):
    
    numerador = 1
    denominador = 1
    for j  in range(0,n,1):
        if (j!=i):
            numerador = numerador*(x-xi[j])
            denominador = denominador*(xi[i]-xi[j])
    terminoLi = numerador/denominador

    polinomio = polinomio + terminoLi*fi[i]
    divisorL[i] = denominador

# simplifica el polinomio
polisimple = polinomio.expand()

# para evaluación numérica
px = sym.lambdify(x,polisimple)

# Puntos para la gráfica
muestras = 101
a = np.min(xi)
b = np.max(xi)
pxi = np.linspace(a,b,muestras)
pfi = px(pxi)

# SALIDA
print('    valores de entrada: ',fi)
print('    Instantes de tiempo: ',xi)
print()

# Distancia en t=10
print(" Posición cuando t=10  es: ", posicion(10), "Pies")
# Velocidad en t=10
print("Velocidad en t=10 es: ", velocidad(10), "Pies por segundo")
# Gráfica
plt.plot(xi,fi,'o', label = 'Puntos')
plt.plot(pxi,pfi, label = 'Polinomio')
plt.legend()
plt.xlabel('Tiempo')
plt.ylabel('Velocidad')
plt.title('Interpolación')
plt.show()