# -*- coding: utf-8 -*-


import numpy as np
import math
import sympy as sym
from matplotlib import pyplot as plt

#funcion para encontrar las raices del polinomio de grado dos que se crea por el metodo de Taylor
#se utiliza la tolerancia cuando hay una division por cero para evitar este problema ya que la tolerancia es lo minimo que puede tener como resultado
def cuadratica(a,b,c, tolerancia):
    if a==0:
        a=a+tolerancia
    primera= (-b + math.sqrt(b**2 - 2*a*c))/2*a
    segunda=(-b - math.sqrt(b**2 - 2*a*c))/2*a
    print(primera, segunda)


def mostrarGrafica():
    x = np.linspace(0,3,100)
    
    fx = []
    for i in range(len(x)):
         fx.append(-2*x[i]**2 + 4*x[i] -2)

    plt.plot(x, fx, "r")
    plt.grid()
    plt.axvline()
    plt.axhline()
    plt.show()

x=sym.Symbol('x')
#todas las funciones que se hacen pruebas
funcion = 2*sym.cos(x) - (x-2)**2
#math.e**x-x-1
#x**3- 2*x-5
#x**3 -2*x**2 + (4/3)*x-(8/27)
#sym.cos(x)*sym.cos(x) - x**2
#(2*math.cos(2*x) - (x-2)**2)


#Implementacion del metodo de Taylor 
x0=0
n=3
pa=0
pb=0
pc=0

k=0
polinomio=0
while k<3:
    derivada = funcion.diff(x,k)
    derivadax0 = derivada.subs(x,x0)
    divisor = np.math.factorial(k)
    terminok = (derivadax0 / divisor)* (x-x0)**k
    #print(terminok)
    if k==0:
        pc=terminok
    elif k==1:
        pb=terminok
    else:
        pa=terminok
    
    polinomio = polinomio + terminok
    k= k+1
    
print(polinomio)

print(pa,pb,pc)
a=np.longdouble(str(pa).split('*')[0])
b=np.longdouble(str(pb).split('*')[0])
c=np.longdouble(str(pc).split('*')[0])

print(a,b,c)
cuadratica(a,b,c,10**-8)
mostrarGrafica()

