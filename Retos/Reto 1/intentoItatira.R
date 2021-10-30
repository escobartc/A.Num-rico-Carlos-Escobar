library(pracma)
library(readxl)


#Se realiza la lectura del archivo xls con los datos originales, se indica en que hoja se leen los datos.
# Se guradan los datos en datosTemperatura
datosTemperatura = read_excel("C:/Kamigueen/Octavo semestre/Análisis numerico/Parcial3/Reto clima/datosClima.xls", 
                           sheet = "Itatira")

tamHoja = length(datosTemperatura$`Temp. Interna (ºC)`)
#Se almacena en el eje x los datos asociados al tiempo, ya que cada dato se toma cada hora.  
x = seq(1,length(datosTemperatura$`Temp. Interna (ºC)`),1)
# Como variable a graficar se toma la temperatura interna.
y = datosTemperatura$`Temp. Interna (ºC)`

plot(x,y, type = "line", main = "Datos iniciales", ylab = "Temperaturas internas", xlab = "Horas transcurridas")

#Eliminar 30% de los datos

set.seed(25)
#2
#25

#Se replica un valor de 1 720 veces y se almacena en un vector, representando que partes tienen los datos.
datosConocidos = rep(1, tamHoja)
#Se crea un vector con un tamaño equivalente al 30% de los datos y se llena con valores que estan entre 2 y 720
#De este modo se tienen valores de las diferentes horas...
datosIncompletos = sample.int(tamHoja,tamHoja*0.3)
datosIncompletos = sort(datosIncompletos)
for (incompleto in datosIncompletos) {
  if(incompleto == 1)
  {
    datosConocidos[incompleto+2] = 0
  }
  else if(incompleto == 721)
  {
    datosConocidos[incompleto-2] = 0 
  }
  else{
    datosConocidos[incompleto] = 0 
  }
    
}

Xincompleto = c()
Yincompleto = c()

i = 1
j = 1

for (k in datosConocidos)
{
  if(k == 1)
  {
    Xincompleto[i] = round(x[j],3)
    Yincompleto[i] = round(y[j],3)
    i = i + 1
  }
  j = j +1
}


##Generación de nuevas graficas 

#Interpolación con spline

#spline returns a list containing components x and y which give the ordinates where 
#interpolation took place and the interpolated values.
interpolacionSpline = spline(Xincompleto, Yincompleto)
#splinefun returns a function which will perform cubic spline interpolation of the given data points. 
#This is often more useful than spline.
interpolacionSpline2 = splinefun(Xincompleto, Yincompleto)

#Se agrega nuevamente la gráfica con los valore soriginales y se agrega la gráfica generada con spline.
plot(x,y, type = "line", main = "Comparación spline", ylab = "Temperaturas Internas", xlab = "Horas")
lines(interpolacionSpline, col = "red")

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


for(i in 1:length(datosIncompletos))
{
  errorRelativoSpline[i] = round(abs(y[datosIncompletos[i]] - interpolacionSpline2(x[datosIncompletos[i]]))/y[datosIncompletos[i]],2)
  errorAbsolutoSpline[i] = round(abs(y[datosIncompletos[i]] - interpolacionSpline2(x[datosIncompletos[i]])),2)
  if(errorRelativoSpline[i]> maximoError)
  {
    maximoError=errorRelativoSpline[i]
    indiceMaximoError=datosIncompletos[i]
    valorOriginalMaximoError = y[datosIncompletos[i]]
    valorSplineMaximoError = interpolacionSpline2(x[datosIncompletos[i]])
    
  }
  if(errorRelativoSpline[i]<minimoError && errorRelativoSpline[i] != 0)
  {
    minimoError=errorRelativoSpline[i]
    indiceMinimoError=datosIncompletos[i]
    valorOriginalMinimoError= y[datosIncompletos[i]]
    valorSplineMinimoError=interpolacionSpline2(x[datosIncompletos[i]])
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
print(indiceMaximoError)
print(valorOriginalMaximoError)
print(valorSplineMaximoError)

#ERROR RELATIVO MINIMO
print("MINIMO ERROR")
print(minimoError)
print(indiceMinimoError)
print(valorOriginalMinimoError)
print(valorSplineMinimoError)

##ERROR CUADRATICO MEDIO
sumatoriaDiferenciaCuadradaErrores=0
for(i in 1:length(datosIncompletos))
{
  sumatoriaDiferenciaCuadradaErrores =sumatoriaDiferenciaCuadradaErrores + y[datosIncompletos[i]] - interpolacionSpline2(x[datosIncompletos[i]])
}
sumatoriaDiferenciaCuadradaErrores=(sumatoriaDiferenciaCuadradaErrores*sumatoriaDiferenciaCuadradaErrores)/length(datosIncompletos)

sumatoriaDiferenciaCuadradaErrores=round(sqrt(sumatoriaDiferenciaCuadradaErrores),2)

print(sumatoriaDiferenciaCuadradaErrores)

##ERROR ABSOLUTO MEDIO
errorAbsolutoMedio=0
for(i in 1:length(datosIncompletos))
{
  errorAbsolutoMedio=errorAbsolutoMedio + abs(y[datosIncompletos[i]] -interpolacionSpline2(x[datosIncompletos[i]]))
}
errorAbsolutoMedio=round(errorAbsolutoMedio/length(datosIncompletos),2)

print(errorAbsolutoMedio)

#Indice de Jacard

ySpline=c()
for(i in 1:length(x))
{
  ySpline[i] = interpolacionSpline2(i)
}

interseccion = intersect(y,ySpline)

tamInterseccion = length(interseccion)
jaccard =round( (tamInterseccion/tamHoja),2)
print(jaccard)








