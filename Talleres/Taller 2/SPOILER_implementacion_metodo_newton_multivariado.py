# -*- coding: utf-8 -*-
"""

@author: samyf
"""
import numpy as np
from scipy import linalg
import math

def matrizFunciones(x,y):
    f1=-x**2-y**2+1
    f2=y-x
    return np.array([f1,f2])
    
def Jacobiano(x,y):
    return np.array([[2*x, 2*y],[-1 , 1]])



x=1 #valor inicial de x
y=1 #valor inicial de y 
tolerancia=10**-8
n=10 #numero de iteraciones que se deben hacer 
k=0
solucionAnterior=[x,y]
dispercion=1

while k < n or dispercion > tolerancia:
    
    print("iteracion ",k,":", solucionAnterior)
    J=Jacobiano(solucionAnterior[0], solucionAnterior[1])
    b=matrizFunciones(solucionAnterior[0], solucionAnterior[1])


    solucion= linalg.solve(J, b)

    solucionActual=solucionAnterior[0] +solucion[0],solucionAnterior[1] +solucion[1]  
    solucionAnterior=solucionActual
    
    k=k+1
    dispercion= abs(math.sqrt((solucionActual[0]-solucionAnterior[0])**2 + (solucionActual[1]-solucionAnterior[1])**2 ))
    


print("iteracion ",k,":", solucionAnterior)



