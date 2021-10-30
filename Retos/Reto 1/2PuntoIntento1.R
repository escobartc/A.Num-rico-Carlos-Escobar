library(pracma)
library(readxl)
##UBICACIONES

#Itatira         X: 4.3 || Y: 9.50   
xItatira=4.3
yItatira=9.5
#Santa Quiteira  X: 3.7 || Y: 9.52
xSantaQuiteira=3.7
ySantaQuiteira=9.52
#Quixada         X: 4   || Y: 9.46
xQuixada=4
yQuixada=9.46
#Pentecoste      X: 4.7 || Y: 9.58
xPentecoste=4.7
yPentcoste=9.58
#Quixeramobin    X: 4.7 || Y: 9.42
xQuixeramobin=4.7
yQuixeramobin=9.42

distanciaSantanQuiteira = round(sqrt(((xItatira-xSantaQuiteira)*(xItatira-xSantaQuiteira))+(yItatira-ySantaQuiteira)*(yItatira-ySantaQuiteira)),2)
distanciaQuixada = round(sqrt(((xItatira-xQuixada)*(xItatira-xQuixada))+(yItatira-yQuixada)*(yItatira-yQuixada)),2)
distanciaPentecoste = round(sqrt(((xItatira-xPentecoste)*(xItatira-xPentecoste))+(yItatira-yPentcoste)*(yItatira-yPentcoste)),2)
distanciaQuixeramobin = round(sqrt(((xItatira-xQuixeramobin)*(xItatira-xQuixeramobin))+(yItatira-yQuixeramobin)*(yItatira-yQuixeramobin)),2)

#Se toman los datos de la temperatura interna de Itatira
datosTemperatura = read_excel("C:/Kamigueen/Octavo semestre/Análisis numerico/Parcial3/Reto clima/datosClima.xls", 
                              sheet = "Itatira")

tamHojaItatira = length(datosTemperatura$`Temp. Interna (ºC)`)
#Se almacena en el eje x los datos asociados al tiempo, ya que cada dato se toma cada hora.  
arreglo_x_Itatira = seq(1,length(datosTemperatura$`Temp. Interna (ºC)`),1)
# Como variable a graficar se toma la temperatura interna.
arreglo_y_Itatira = datosTemperatura$`Temp. Interna (ºC)`


#Se toman los datos de la temperatura interna de SantaQuiteria
datosTemperatura = read_excel("C:/Kamigueen/Octavo semestre/Análisis numerico/Parcial3/Reto clima/datosClima.xls", 
                              sheet = "Santa Quitéria")

tamHojaSantaQuiteria = length(datosTemperatura$`Temp. Interna (ºC)`)
#Se almacena en el eje x los datos asociados al tiempo, ya que cada dato se toma cada hora.  
arreglo_x_SantaQuiteria = seq(1,length(datosTemperatura$`Temp. Interna (ºC)`),1)
# Como variable a graficar se toma la temperatura interna.
arreglo_y_SantaQuiteria = datosTemperatura$`Temp. Interna (ºC)`


#Se toman los datos de la temperatura interna de Quixada
datosTemperatura = read_excel("C:/Kamigueen/Octavo semestre/Análisis numerico/Parcial3/Reto clima/datosClima.xls", 
                              sheet = "Quixadá")

tamHojaQuixada = length(datosTemperatura$`Temp. Interna (ºC)`)
#Se almacena en el eje x los datos asociados al tiempo, ya que cada dato se toma cada hora.  
arreglo_x_Quixada = seq(1,length(datosTemperatura$`Temp. Interna (ºC)`),1)
# Como variable a graficar se toma la temperatura interna.
arreglo_y_Quixada = datosTemperatura$`Temp. Interna (ºC)`

##Creacion de nuevo arreglo
nuevoY= c()
for(i in 1:tamHojaSantaQuiteria)
{
  nuevoY[i]=(arreglo_y_Quixada[i]+arreglo_y_SantaQuiteria[i])/2
}
for(i in tamHojaSantaQuiteria:tamHojaItatira)
{
  nuevoY[i]=arreglo_y_Quixada[i]
}

plot(arreglo_x_Itatira,arreglo_y_Itatira, type = "line", main = "Datos iniciales", ylab = "Temperaturas internas", xlab = "Horas transcurridas")

interpolacionSpline = spline(arreglo_x_Itatira, nuevoY)
lines(interpolacionSpline, col = "red")

######################################################

#Se calcula el error
errorRelativoSpline = c()
errorAbsolutoSpline =c()

maximoError=0
indiceMaximoError=-1
valorOriginalMaximoError=-1
valorSplineMaximoError=-1

minimoError=100
indiceMinimoError=-1
valorOriginalMinimoError=-1
valorSplineMinimoError=-1

minimoErrorAbsoluto=1000
maximoErrorAbsoluto=-1


for(i in 1:length(arreglo_x_Itatira))
{
  errorRelativoSpline[i] = round(abs(arreglo_y_Itatira[i] - nuevoY[i])/arreglo_y_Itatira[i],2)
  errorAbsolutoSpline[i] = round(abs(arreglo_y_Itatira[i] - nuevoY[i]),3)
  
  if(errorRelativoSpline[i]> maximoError)
  {
    maximoError=errorRelativoSpline[i]
    
  }
  if(errorRelativoSpline[i]<minimoError && errorRelativoSpline[i] != 0)
  {
    minimoError=errorRelativoSpline[i]
  }
  if(errorAbsolutoSpline[i] > maximoErrorAbsoluto)
  {
    maximoErrorAbsoluto=errorAbsolutoSpline[i]
  }
  if(errorAbsolutoSpline[i] < minimoErrorAbsoluto && errorAbsolutoSpline[i] != 0)
  {
    minimoErrorAbsoluto=errorAbsolutoSpline[i]
  }
}

#ERROR ABSOLUTO MINIMO
print(minimoErrorAbsoluto)
#ERROR ABSOLUTO MAXIMO
print(maximoErrorAbsoluto)
#ERROR RELATIVO MAXIMO
print("MAXIMO ERROR:")
print(maximoError)

#ERROR RELATIVO MINIMO
print("MINIMO ERROR")
print(minimoError)

##ERROR CUADRATICO MEDIO
sumatoriaDiferenciaCuadradaErrores=0
for(i in 1:length(tamHojaItatira))
{
  sumatoriaDiferenciaCuadradaErrores =sumatoriaDiferenciaCuadradaErrores + y[datosIncompletos[i]] - nuevoY[i]
}
sumatoriaDiferenciaCuadradaErrores=(sumatoriaDiferenciaCuadradaErrores*sumatoriaDiferenciaCuadradaErrores)/length(tamHojaItatira)

sumatoriaDiferenciaCuadradaErrores=round(sqrt(sumatoriaDiferenciaCuadradaErrores),2)

print(sumatoriaDiferenciaCuadradaErrores)

##ERROR ABSOLUTO MEDIO
errorAbsolutoMedio=0
for(i in 1:tamHojaItatira)
{
  errorAbsolutoMedio=errorAbsolutoMedio + abs(arreglo_y_Itatira[i]- nuevoY[i])
}
errorAbsolutoMedio=round(errorAbsolutoMedio/tamHojaItatira,2)

print(errorAbsolutoMedio)

#Indice de Jacard


interseccion = intersect(arreglo_y_Itatira,nuevoY)

tamInterseccion = length(interseccion)
jaccard = round((tamInterseccion/tamHojaItatira),2)
print(jaccard)



