# -*- coding: utf-8 -*-

import numpy as np
from scipy import linalg
def Jacobi(A,b,vInit,n):
   D=[]
   L=[]
   U=[]
   invD=[]
   for i in range(len(A)):
       D.append([0]*len(A))
       L.append([0]*len(A))
       U.append([0]*len(A))
       invD.append([0]*len(A))
       
   
   #Se crea la matriz que solo contiene la diagonal
   for i in range (len(A)):
       for j in range(len(A)):
           if i==j:
               D[i][j]= A[i][j];
           else:
               D[i][j]= 0
    
   #Se crea la matriz triangular menor
   for i in range (1,len(A)):
       for j in range (int(len(A)/2)+1):
           if j != i :
               L[i][j]=-A[i][j]
          
                   
   #Se crea la matriz triangular superior
   for i in range (len(A)-1):
       for j in range (int(len(A)/2), len(A)):
           if j != i :
               U[i][j]=-A[i][j]

   #Se encuentra matriz inversa de D
   invD=np.linalg.inv(np.array(D))
   
   #Se debe hacer la formula invD*b + invD(L+U)x para realizar las formulas y encontrar los valores de las variables
   Db=np.dot(invD,b)
   LU=np.array(L)+ np.array(U)
   DLU=np.dot(invD, LU)
   
   #Se realizan la formulas
   solucionActual=[]
   solucionAnterior=vInit
   print("Respuesta usando implementacion de jacobi")
   for a in range(n+1):
       print("iteracion ",a,":", solucionAnterior)
       for i in range (len(Db)):
           valor=Db[i]
           #print(valor)
           for j in range(len(DLU)):
               valor=valor + DLU[i][j]*solucionAnterior[j]
              
           #print(valor)
           solucionActual.append(valor)
           
       #print(solucionActual)
       solucionAnterior=solucionActual
       solucionActual=[]
       

   
   #print(D)
   #print(L)
   #print(U)
   #print(invD)
   #print(Db)
   #print(LU)
   #print(DLU)
   #print(soluciones)
       

matriz=[[2,0,-1],[0,2,-1],[-1,1,3]]
b=[1,2,1]#respuestas de las funciones
valoresIniciales=[1,2,3]
Jacobi(matriz,b, valoresIniciales, 10)

print("Respuesta usando biblioteca  scipy")
print(linalg.solve(matriz, b))