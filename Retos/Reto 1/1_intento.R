library(pracma)
library(readxl)

#Se realiza la lectura del archivo xls con los datos originales, se indica en que hoja se leen los datos.
# Se guradan los datos en datosTemperatura
datosTemperatura = read_excel("C:/Kamigueen/Octavo semestre/Análisis numerico/Parcial3/Reto clima/datosClima.xls", 
                           sheet = "Itatira")

#Se almacena en el eje x los datos asociados al tiempo, ya que cada dato se toma cada hora.  
x = seq(1,length(datosTemperatura$`Temp. Interna (ºC)`),1)
# Como variable a graficar se toma la temperatura interna.
y = datosTemperatura$`Temp. Interna (ºC)`

plot(x,y, type = "line", main = "Datos iniciales", ylab = "Temperaturas", xlab = "Indices Ideales")

#Eliminar 30% de los datos

set.seed(2)

#Se replica un valor de 1 720 veces y se almacena en un vector, representando que partes tienen los datos.
datosConocidos = rep(1, 720)
#Se crea un vector con un tamaño equivalente al 30% de los datos y se llena con valores que estan entre 1 y 720
#De este modo se tienen valores de las diferentes horas...
datosIncompletos = sample.int(720,720*0.3)
for (incompleto in datosIncompletos) {
  datosConocidos[incompleto] = 0
}


Xincompleto = c()
Yincompleto = c()

i = 1
j = 1

for (k in datosConocidos)
{
  if(k == 1)
  {
    Xincompleto[i] = x[j]
    Yincompleto[i] = y[j]
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
plot(x,y, type = "line", main = "Comparación spline", ylab = "Temperaturas", xlab = "Indices Ideales")
lines(interpolacionSpline, col = "red")





#Aqui se calcula el error con los valores que se retiraron
sort(datosIncompletos)
errorRelativoSpline = c()
maximoError=0
indiceMaximoError=0
valorOriginal=-1
valorSpline=-1


j=1
for(i in 1:length(datosIncompletos))
{
  errorRelativoSpline[i] = round(abs((y[datosIncompletos[i]] - interpolacionSpline2(datosIncompletos[i]))/y[datosIncompletos[i]]),2)
  if(errorRelativoSpline[i]>maximoError)
  {
    maximoError=errorRelativoSpline[i]
    indiceMaximoError=datosIncompletos[i]
    valorOriginal = y[datosIncompletos[i]]
    valorSpline = interpolacionSpline2(x[datosIncompletos[i]])
  }
  j = j + 1
}

print(errorRelativoSpline)
print(maximoError)
print(indiceMaximoError)
print(valorOriginal)
print(valorSpline)







