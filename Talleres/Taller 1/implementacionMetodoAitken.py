# -*- coding: utf-8 -*-
"""
Created on Wed Aug 11 21:26:53 2021

@author: samyf
"""
import numpy as np
import math
from matplotlib import pyplot as plt

iteraciones=[]
tolerancia = [10**-8, 10**-16,10**-32,10**-56] 
#Diferentes funciones 
def f(x):
    #return np.longdouble(math.cos(x)*math.cos(x) - x**2)
    #return np.longdouble(math.e**x-x-1)
    #return x**3 -2*x**2 + (4/3)*x-(8/27)
    #return x**3- 2*x-5
    return (667.38/x)*(1-math.e**(-0.146843*x))-40

#Para utilizar la funcion del metodo de Aitken solo se debe dar un punto y la tolerancia que se va a tener
#se utiliza la tolerancia cuando hay una division por cero para evitar este problema ya que la tolerancia es lo minimo que puede tener como resultado
def metodoAitken(p0,tol):
    formato="{:."+str(tol).split('-')[1]+"f}"

    maxIt=100
    i=1
    while i<=maxIt:
        p1=np.longdouble(p0+f(p0))
        p2=np.longdouble(p1+f(p1))
        
        if (p2- 2*p1 +p0) !=0:
            p=np.longdouble(p0- (p1-p0)**2 / (p2- 2*p1 +p0))
        else:
            p=np.longdouble(p0- (p1-p0)**2 / ((p2- 2*p1 +p0)+tol))
        
        
        if abs(p-p0)<tol:
            print("iteraciones", i)
            print("Raiz", p)
            iteraciones.append(i)
            
            return formato.format(p)
        i=i+1
        p0=p
    return "No se encontro raiz"
    
raices=set([])
x=[]
y=[]

#se prueba el metodo con diferentes puntos de entrada pero con una misma tolerancia 
for i in range(1, 3):
    x.append(f(i))
    y.append(i)
    resultado=metodoAitken(i,10**-56)
    if resultado !="No se encontro raiz":
        raices.add(resultado)
    
print (raices)
"""
plt.plot(y,x)
plt.show()

print(metodoAitken(0.66667,10**-8))

for i in tolerancia:
    print(i)
    print(metodoAitken(0.5,i))
    
plt.plot(iteraciones,tolerancia)
plt.show()
"""