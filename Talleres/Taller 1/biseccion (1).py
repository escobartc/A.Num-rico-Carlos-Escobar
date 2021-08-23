# -*- coding: utf-8 -*-
"""
Created on Wed Aug  4 08:01:45 2021

@author: juank
"""

from  math import *
import numpy as np
from matplotlib import pyplot as plt
import sympy

#%%
def mostrarGrafica():
    x = np.arange(2*(-pi), 2*(pi), 0.1)
    y=np.cos(x)* np.cos(x) - x**2;
    plt.plot(x,y)
    plt.show()
    
def biseccion(a, b, tolerancia):
    x0=a
    x1=b
    x2=(x0+x1)/2
    n=0
    if funcion(a)*funcion(b) > 0:
        print("Se debe cambiar el intervalo.")
    while abs(x0-x1) > tolerancia :
        n = n+1
        if (funcion (x0) * funcion (x2) ) < 0:
            ##print("El signo cambia en el intervalo x0 a x2.")
            x1=x2            
            x2=(x0+x1)/2            
        else:
            ##print("El signo cambia en el intervalo x2 a x1.")
            x0=x2
            x2=(x0+x1)/2
    print("x: ",x2)
    print("f(x): ",funcion(x2))
    print("iteracion:",n)
    print("fin.")
#%%
def funcion(x):
    return np.cos(x)* np.cos(x) - x**2;

##x*np.cos(x**2)+1

#%%
mostrarGrafica();
biseccion(-1,0,10**(-64))
