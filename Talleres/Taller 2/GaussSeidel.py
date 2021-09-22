# -*- coding: utf-8 -*-
"""
Created on Mon Sep 20 17:09:58 2021

@author: Acer
"""

import numpy as np


def dd(X):
    D = np.diag(np.abs(X)) # Find diagonal coefficients
    S = np.sum(np.abs(X), axis=1) - D # Find row sum without diagonal
    if np.all(D > S):
        print ("La matriz es diagonalmente dominante")
    else:
        print ("A no es diagonalmente dominante")
    return



# INGRESO
A = np.array([[4. , 3., 0.],
              [3., 4., -1.],
              [0., -1., 4.]])

B = np.array([0.254,-1.425,2.978])

X0  = np.array([0.,0.,0.])

tolera = 0.0000000000000001
iteramax = 100
formato = "{:."+str(tolera).split('-')[1]+"f}"

# PROCEDIMIENTO

# Gauss-Seidel
tamano = np.shape(A)
n = tamano[0]
m = tamano[1]
#  valores iniciales
X = np.copy(X0)
diferencia = np.ones(n, dtype=float)
errado = 2*tolera

itera = 0
while not(errado<=tolera or itera>iteramax):
    # por fila
    for i in range(0,n,1):
        # por columna
        suma = 0 
        for j in range(0,m,1):
            # excepto diagonal de A
            if (i!=j): 
                suma = suma-A[i,j]*X[j]
        
        nuevo = (B[i]+suma)/A[i,i]
        diferencia[i] = np.abs(nuevo-X[i])
        X[i] = nuevo
    errado = np.max(diferencia)
    print("iteracion: ", itera)
    print('respuesta X: ')
    print("[ ", formato.format(X[0]),", ",formato.format(X[1]),", ",formato.format(X[2]),"]")
    itera = itera + 1

# Respuesta X en columna
X = np.transpose([X])

# revisa si NO converge
if (itera>iteramax):
    print("no converge")
    X=0
# revisa respuesta
verifica = np.dot(A,X)

# SALIDA
"""
print("iteraciones: ", i)
print('respuesta X: ')
print(X)
"""
dd(A)
print('verificar A.X=B: ')
print(verifica)

