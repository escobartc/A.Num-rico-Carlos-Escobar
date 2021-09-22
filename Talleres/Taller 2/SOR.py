import numpy as np

def sor_solver(A, b, omega, initial_guess, tol):
  """
  Implementacion del SOR
  Entradas:
    A: Matriz
    b: Vector 
    omega: factor de relajacion
    tol: tolerancia (1e-5)
    initial_guess: solucion inicial
  Salidas:
    phi: vector solución
  """
  phi = initial_guess[:]
  residual = np.linalg.norm(np.matmul(A, phi) - b) #residual
  itera = 1
  while residual > tol:
    print("iteracion: ", itera)
    for i in range(A.shape[0]):
      sigma = 0
      for j in range(A.shape[1]):
        if j != i:
          sigma += A[i][j] * phi[j]
      phi[i] = (1 - omega) * phi[i] + (omega / A[i][i]) * (b[i] - sigma)
    residual = np.linalg.norm(np.matmul(A, phi) - b)
    itera = itera + 1
    # print('Residual: {0:10.6g}'.format(residual))
    
    print(phi)
  return phi


#Adaptación del pesudo código de SOR
tol = 1e-5
formato = "{:."+str(tol).split('-')[1]+"f}"
omega = 1.3 # factor de relajación w

A = np.array([[4. , 3., 0.],
              [3., 4., -1.],
              [0., -1., 4.]])


b = np.array([0.254,-1.425,2.978])

initial_guess = np.array([0.,0.,0.])

phi = sor_solver(A, b, omega, initial_guess, tol)
print("Resultado: [ ", formato.format(phi[0]),", ",formato.format(phi[1]),", ",formato.format(phi[2]),"]")