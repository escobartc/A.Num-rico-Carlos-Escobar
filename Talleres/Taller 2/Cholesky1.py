# -*- coding: utf-8 -*-
"""
Created on Wed Sep  8 16:08:48 2021

@author: juank
"""

import pprint
import scipy
import scipy.linalg   # SciPy Linear Algebra Library

#COn el metodo linalg.cholesky podemos descomponer la matriz por L y L traspuesta.
A = scipy.array([[1, 3, -1], [4, -1 , 1], [1, 1, 7]])
# El parametro lower indica que se produce una matriz triangular superior o inferior.
L = scipy.linalg.cholesky(A, lower=False)


print ("A:")
pprint.pprint(A)

print ("L:")
pprint.pprint(L)



