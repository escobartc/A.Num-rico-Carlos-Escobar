
from math import *
from numpy import sign
import numpy as np
from numpy.lib.scimath import sqrt
from matplotlib import pyplot as plt
import scipy as sci


tabla = []
errores = []

def f(x):
    
    return x**3 + 2*x + (1-(1/3))



def mostrarGrafica():
    x = np.linspace(-1,3,100)
    
    fx = []
    for i in range(len(x)):
         fx.append(x[i]**4 - 3*x[i]**3 + x[i]**2 + x[i] + 1)

    plt.plot(x, fx, "r")
    plt.grid()
    plt.axvline()
    plt.axhline()
    plt.show()
    
    
def mullerLibro(p0, p1, p2, tol, N0):
    absoluto = 0
    relativo = 0
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
            #print("E: ", E)
            
        h = -2 * f(p2)/E;
        p = p2 + h;
        absoluto = abs(p - raiz)
        
        if i == 3:
            errores.append(absoluto)
            tabla.append([raiz,p,absoluto])
            print("i: (", i,") " ,"(p_i) = ", formato.format(p), " F(p_i) = ", f(p), "Ei: ", formato.format(absoluto))
        else:
            errores.append(absoluto)
            relativo = absoluto/abs(errores[i-4])
            tabla.append([raiz,p,absoluto])
            print("i: (", i,") " ,"(p_i) = ", formato.format(p), " F(p_i) = ", f(p), "Ei: ", formato.format(absoluto), "Erelativo: ", formato.format(relativo))
        
        if abs (h) < tol:
            
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
   
    return p;
        
        
raiz = -0.317352616560206  #Valor de la raiz para comparar  
#mostrarGrafica();
#mullerLibro(-3, 0, 3, 10**-11, 10000)

print("Raíz: ", mullerLibro(0.5, -0.5, 0, 10**-11, 10000))
tabla = np.array(tabla)
n=len(tabla)

# SALIDA
print(['raiz', 'p', 'error'])
np.set_printoptions(precision = 4)
print(tabla)


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
plt.xlabel("Resultados Muller")
plt.ylabel("Error")
plt.show()
    

'''
print(muller(-1, -0.5, 0, 10**-64));
print(mullerLibro(-1, -0.5, 0, 10**-13, 50));
'''

