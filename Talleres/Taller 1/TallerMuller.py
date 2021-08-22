# -*- coding: utf-8 -*-
"""
np.cos(x)**2 + x**2
 fx.append(cos(x[i])**2 - x[i]**2)

e**x - x - 1
 fx.append(e**x[i] - x[i] - 1)

x**3-2*x**2+ 4/3*x - 8/27
 fx.append(x[i]**3-2*x[i]**2+ 4/3*x[i] - 8/27)

x**3 -2*x - 5
 fx.append(x[i]**3 -2*x[i] - 5)

(667.38/x)*(1-e**(-0.146843*x))-40
fx.append((667.38/x[i])*(1-e**(-0.146843*x[i]))-40)

 if x == 0:
        x = x + 10**-8




"""
from math import *
from numpy import sign
import numpy as np
from numpy.lib.scimath import sqrt
from matplotlib import pyplot as plt

def f(x):
    if x == 0:
        x = x + 10**-8
    return e**x - x - 1



def mostrarGrafica():
    x = np.linspace(-3,3,100)
    
    fx = []
    for i in range(len(x)):
        fx.append(e**x[i] - x[i] - 1)

    plt.plot(x, fx, "r")
    plt.grid()
    plt.axvline()
    plt.axhline()
    plt.show()
    
    
def muller( x0, x1, x2, tol):
    error = 1e3
    x3 = 0
    while error > tol:
        c = f(x2)
        b = ((x0 - x2)**2 * (f(x1) - f(x2)) - (x1 - x2)**2 *
             (f(x0) - f(x2))) / ((x0 - x2) * (x1 - x2) * (x0 - x1))
        a = ((x1 - x2) * (f(x0) - f(x2)) - (x0 - x2) *
             (f(x1) - f(x2))) / ((x0 - x2) * (x1 - x2) * (x0 - x1))
        x3 = x2 - (2 * c) / (b + sign(b) * sqrt(b**2 - 4 * a * c))
        error = abs(x3 - x2)
        x0 = x1
        x1 = x2
        x2 = x3
    return x3

def mullerLibro(p0, p1, p2, tol, N0):
    formato = "{:."+str(tol).split('-')[1]+"f}"
    h1 = p1 - p0;
    h2 = p2 - p1;
    if h1 == 0:
        h1 = h1+tol
        
    delta1 = (f(p1) - f(p0))/h1;
    if h2 == 0:
        h2 = h2 + tol
    delta2 = (f(p2) - f(p1))/h2;
    d=(delta2 - delta1)/(h2 + h1);
    i=3;
    while(i <= N0):
        b = delta2 + h2*d;
        D = (b**2 - 4*f(p2)*d)**(1/2);
        
        if abs(b - D) < abs(b + D):
            E = b + D;
        else:
            E = b - D;
        h = -2 * f(p2)/E;
        p = p2 + h;
        
        if abs (h) < tol:
            print("iteraciones:",i);
            return formato.format(p)
        
        p0 = p1;
        p1 = p2;
        p2 = p;
        h1 = p1 - p0;
        h2 = p2 - p1;
        if h1 == 0:
            h1 = h1 + tol
        delta1 = (f(p1) - f(p0))/h1;
        if h2 == 0:
            h2 = h2 + tol
        delta2 = (f(p2) - f(p1))/h2;
        if (h2+h1) == 0:
            d = (delta2 - delta1)/(h2 + h1)
        else: 
            d = (delta2 - delta1)/(h2 + h1 + tol)
        i = i + 1;
    
    print("Superado el numero de iteraciones");
    print("iteraciones:",i)
    return p;
        
        
    
mostrarGrafica();

raices = set()

for i in range(-3,3):
    print("Intervalo: ", -3+i, -1+i, -2+i)
    raices.add(mullerLibro(-3+i, -1+i, -2+i, 10**-8, 10000))
    #print("raíz: ", mullerLibro(-3+i, -1+i, -2+i, 10**-56, 10000))
    
print("Las raíces de la funcion son: ", raices)

'''
print(muller(-1, -0.5, 0, 10**-64));
print(mullerLibro(-1, -0.5, 0, 10**-13, 50));
'''