import pprint
import scipy
import scipy.linalg
import numpy as np

A = np.array([ [1, 3,-1], [4, -1, 1], [1, 1, 7] ])
#A = scipy.array([[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]])
P, L, U = scipy.linalg.lu(A)

print("A:")
pprint.pprint(A)

print("P:")
pprint.pprint(P)

print("L:")
pprint.pprint(L)

print("U:")
pprint.pprint(U)
