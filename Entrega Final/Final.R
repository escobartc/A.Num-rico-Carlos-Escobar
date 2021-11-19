rm(list = ls())
gc()

library(rgl) 
library (ggplot2)
library(PolynomF)

"""
1. Solucionar el sistema de ecuaciones utilizando el método de rk con 
paso variable (h) , las condiciones iniciales se establecieron en I (0) =100/N, 
S (0) =N-I(0), R (0) =0 y N=450000, en consonancia con los datos reportados por 
el Instituto Nacional de Salud (INS) de Colombia para el periodo entre el 
20 de marzo y el 20 de mayo de 2020. Los parámetros del modelo 
son β=0,06, C=4 y γ=0,021, fueron ajustados numéricamente hasta que los casos 
(infectados más recuperados) estimados se aproximaran a con error <0.05 de los 
casos reportados.

2.	Con base en la solución anterior, realice una gráfica de la proyección 
del porcentaje de susceptibles, infectados y recuperados de un año de 
pandemia
"""

SIR.model <- function(t, b, g){
  require(deSolve) 
  N = 450000
  condIni <- c(S = 1 - (100 / N), I = 100 / N, R = 0)
  parametros <- c(beta = b,gamma = g) 
  tiempo <- seq(0, t, by = t / (2 * length(1:t)))
  ecuacion <- function(tiempo, estado, parametros){
    with(as.list(c(estado, parametros)),{
      dS <- -beta * S * I
      dI <- beta * S * I - gamma * I
      dR <- gamma * I 
      return(list(c(dS,dI,dR)))})
  }
  
  salida <- ode(y = condIni, time = tiempo, ecuacion, parms = parametros, method = "rk4") 
  salida.df<-as.data.frame(salida) 
  
  require(ggplot2) 
  tema <- theme_minimal()
  theme_set(tema) 
  subtit <- bquote(list(beta==.(parametros[1]), ~gamma==.(parametros[2]))) 
  lineas <- ggplot(salida.df, aes(x = tiempo)) + ggtitle(bquote(atop(bold(.(title)), atop(bold(.(subtit)))))) + 
    geom_line(aes(y = S, colour = "Susceptibles")) + geom_line(aes(y = I, colour = "Infectados")) + 
    geom_line(aes(y = R, colour = "Recuperados")) + ylab(label = "Proporción") + xlab(label = "Tiempo (días)") + 
    theme(legend.justification = c(1, 0), legend.position = c(1, 0.5)) + 
    theme(legend.title = element_text(size = 12, face = "bold"), 
          legend.background = element_rect(fill = '#FFFFFF', size = 0.5, linetype = "solid"), 
          legend.text = element_text(size = 10), 
          legend.key = element_rect(colour = "#FFFFFF", fill = '#C2C2C2', size = 0.25, linetype = "solid")) +
    scale_colour_manual("Referencia", breaks = c("Susceptibles", "Infectados", "Recuperados"),
                        values = c("orange", "black", "yellow"))
  print(lineas)
  ggsave(plot = lineas, filename = paste0("SIRplot_", "tiempo", t, "beta", b, "gamma", g, ".png"), width = 5.75, height = 4, dpi = 120) 
  getwd() 
  indiceControl = g / (b * c)
  c <- which(salida.df[['S']] < indiceControl) - 1
  cat("\n\nApartir del día ", c[1] ," (se estima que la epidemia estará controlada.")
}

SIR.model(365,0.06,0.021)

# Parametros
Beta <- 0.06
c <- 4
gama <- 0.021
N1 <- 450000

# Condiciones iniciales 
I0 <- 100 / N1
S0 <- 1 - I0
R0 <- 0
h <- 1

# Numero de pasos (dias)
dias <- 365

S <- function(x,y,z,t) -Beta * x * y
I <- function(x,y,z,t) Beta * x * y - gama * y
R <- function(x,y,z,t) gama * y

vecS <- replicate(dias + 1, 0)
vecI <- replicate(dias + 1, 0)
vecR <- replicate(dias + 1, 0)

vecS[1] <- S0
vecI[1] <- I0
vecR[1] <- R0


"""
3.	Determine la cantidad máxima aproximada de infectados en relación con la 
población total y en que fecha aproximadamente se espera esto y compare esta 
solución con la solución exacta (analítica).
"""
a <- 2

while(a <= dias + 1){
  xi <- vecS[a - 1]
  yi <- vecI[a - 1]
  zi <- vecR[a - 1]
  
  k1 <- h * S(xi, yi, zi, ti)
  l1 <- h * I(xi, yi, zi, ti)
  m1 <- h * R(xi, yi, zi, ti)
  
  k2 <- h * S(xi + (1 / 2) * k1, yi + (1 / 2) * l1, zi + (1 / 2) * m1, ti + h / 2)
  l2 <- h * I(xi + (1 / 2) * k1, yi + (1 / 2) * l1, zi + (1 / 2) * m1, ti + h / 2)
  m2 <- h * R(xi + (1 / 2) * k1, yi + (1 / 2) * l1, zi + (1 / 2) * m1, ti + h / 2)
  
  k3 <- h * S(xi + (1 / 2) * k2, yi + (1 / 2) * l2, zi + (1 / 2) * m2, ti + h / 2)
  l3 <- h * I(xi + (1 / 2) * k2, yi + (1 / 2) * l2, zi + (1 / 2) * m2, ti + h / 2)
  m3 <- h * R(xi + (1 / 2) * k2, yi + (1 / 2) * l2, zi + (1 / 2) * m2, ti + h / 2)
  
  k4 <- h * S(xi + k3, yi + l3, zi + m3, ti + h)
  l4 <- h * I(xi + k3, yi + l3, zi + m3, ti + h)
  m4 <- h * R(xi + k3, yi + l3, zi + m3, ti + h)
  
  vecS[a] <- xi + (1 / 6) * (k1 + 2 * k2 + 2 * k3 + k4)
  vecI[a] <- yi + (1 / 6) * (l1 + 2 * l2 + 2 * l3 + l4)
  vecR[a] <- zi + (1 / 6) * (m1 + 2 * m2 + 2 * m3 + m4)
  
  a <- a + 1
}

MaximoInfec <- max(vecI)
MaximoInfec * N1
DiaMaximoInfec <- which.max(vecI)
DiaMaximoInfec

"""
4.	Determine el porcentaje de la población que llegaría a infectarse 
y el porcentaje de recuperación y compare esta solución con la solución 
exacta (analítica) 

"""
MaximoRecup <- max(vecR)
MaximoRecup * N1
DiaMaximoRecup <- which.max(vecR)
DiaMaximoRecup

PorcentajeInfectados <- MaximoInfec
PorcentajeInfectados
PorcentajeRecuperados <- MaximoRecup
PorcentajeRecuperados



"""
7. El número efectivo de reproducción R_e (t)=(βCS(t))/γN se define como la 
cantidad de individuos susceptibles que pueden llegar a ser infectados por un 
individuo en un momento específico cuando toda la población no es susceptible. 
Con base en la solución numérica de S(t) interpole, estime el valor total para 
los primeros 90 días y grafique  R_e (t) para los primeros 90 días
"""
vecRet <- integer(90)
for(i in 1 : 90){
  vecRet[i] <- Beta * c * vecS[i] / (gama *  N1)  
}

max(vecRet)

plot(vecRet, type = "p")


"""
9.	Simular el progreso de la pandemia en Santa Marta (para el periodo entre el
20 de marzo y el 30 de mayo de 2020) suponiendo un margen de error al inicio de 
la pandemia tal que el número de infectados y recuperados en ese momento fuera 
I (0) =14, R (0) =0 y considere esta solución exacta.
"""
dias <- 71
vecSS <- replicate(dias + 1, 0)
vecII <- replicate(dias + 1, 0)
vecRR <- replicate(dias + 1, 0)

vecSS[1] <- 1
vecII[1] <- 14
vecRR[1] <- 0

a <- 2

while(a <= dias + 1){
  xi <- vecS[a - 1]
  yi <- vecI[a - 1]
  zi <- vecR[a - 1]
  
  k1 <- h * S(xi, yi, zi, ti)
  l1 <- h * I(xi, yi, zi, ti)
  m1 <- h * R(xi, yi, zi, ti)
  
  k2 <- h * S(xi + (1 / 2) * k1, yi + (1 / 2) * l1, zi + (1 / 2) * m1, ti + h / 2)
  l2 <- h * I(xi + (1 / 2) * k1, yi + (1 / 2) * l1, zi + (1 / 2) * m1, ti + h / 2)
  m2 <- h * R(xi + (1 / 2) * k1, yi + (1 / 2) * l1, zi + (1 / 2) * m1, ti + h / 2)
  
  k3 <- h * S(xi + (1 / 2) * k2, yi + (1 / 2) * l2, zi + (1 / 2) * m2, ti + h / 2)
  l3 <- h * I(xi + (1 / 2) * k2, yi + (1 / 2) * l2, zi + (1 / 2) * m2, ti + h / 2)
  m3 <- h * R(xi + (1 / 2) * k2, yi + (1 / 2) * l2, zi + (1 / 2) * m2, ti + h / 2)
  
  k4 <- h * S(xi + k3, yi + l3, zi + m3, ti + h)
  l4 <- h * I(xi + k3, yi + l3, zi + m3, ti + h)
  m4 <- h * R(xi + k3, yi + l3, zi + m3, ti + h)
  
  vecSS[a] <- xi + (1 / 6) * (k1 + 2 * k2 + 2 * k3 + k4)
  vecII[a] <- yi + (1 / 6) * (l1 + 2 * l2 + 2 * l3 + l4)
  vecRR[a] <- zi + (1 / 6) * (m1 + 2 * m2 + 2 * m3 + m4)
  
  a <- a + 1
}

plot(vecSS, type = "l", col = "orange", axes = F, xlab = "Dias", ylab = "Porcentaje")
par(new = TRUE)
plot(vecII, type = "l", col = "black",axes = F, xlab = "Dias", ylab = "Porcentaje")
par(new = TRUE)
plot(vecRR, type = "l", col = "yellow", xlab = "Dias", ylab = "Porcentaje")
legend(x = "right", legend = c("Susceptibles", "Infectados", "Recuperados"), fill = c("orange", "black","yellow"), box.lty=0)
"""
10.	Con base de la solución aproximada (ejercicio 1), determine los errores 
para cuando  R_e (t)=1.001;1.5;1.9;2.5;  el error relativo en los primeros 10 
días, el error absoluto medio (EAM) y la estabilidad numérica de la solución 
asumiendo que la solución exacta (ejercicio 9) 
"""

Punto10<-matrix(0:0, nrow=10, ncol=12)
Punto10<-data.frame(Punto10)
colnames(Punto10)<-c("SusceptibleReal","SusceptibleAprox", "ErrorRelativoS","ErrorAbsolutoS",
                     "InfectadosReal", "InfectadosAprox", "ErrorRelativoI","ErrorAbsolutoI",
                     "RecuperadosReal","RecuperadosAprox", "ErrorRelativoR", "ErrorAbsolutoR")

Punto10$SusceptibleReal<-vecSS[1:10]
Punto10$SusceptibleAprox<-vecS[1:10]
Punto10$InfectadosReal<-vecII[1:10]
Punto10$InfectadosAprox<-vecI[1:10]
Punto10$RecuperadosReal<-vecRR[1:10]
Punto10$RecuperadosAprox<-vecR[1:10]

for (i in 1:10){ 
  Punto10$ErrorAbsolutoS[i]<-abs(vecS[i]-vecSS[i])
  Punto10$ErrorRelativoS[i]<-Punto10$ErrorRelativoS[i]/vecS[i]
  Punto10$ErrorAbsolutoI[i]<-abs(vecI[i]-vecII[i])
  Punto10$ErrorRelativoI[i]<-Punto10$ErrorRelativoI[i]/vecI[i]
  Punto10$ErrorAbsolutoR[i]<-abs(vecR[i]-vecRR[i])
  Punto10$ErrorRelativoR[i]<-Punto10$ErrorRelativoR[i]/vecR[i]
}

View(Punto10)




