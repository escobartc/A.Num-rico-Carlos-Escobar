# import math
import numpy as np
# from matplotlib import pyplot as plt

#   return x*np.cos(x**2)+1
# Ejemplo 1 del libro: x**3 + 4x**2 − 10
# Problema de la clase: Encontrar x donde x*cosx^2 + 1 = 0

def funcion(x):
    return x**3 + 4*(x**2) - 10
  

def biseccion(a,b,tolerancia):
 
    if (funcion(a) * funcion(b) >= 0):
        print("f(a)*f(b) no es menor a 0")
        return
  
    while ((b-a) > tolerancia):
 
        # Punto intermedio
        c = (a+b)/2
  
        # Revisar si el punto intermedio es la raiz
        if (funcion(c) == 0.0):
            break
  
        # Se decide el lado donde se continuará con los otros pasos
        if (funcion(c)*funcion(a) < 0):
            b = c
        else:
            a = c
             
    print("La raíz es : ","%.14f"%c)
     

a = 1
b = 2
tolerancia = 1*10**(-15)
biseccion(a, b,tolerancia)
 
