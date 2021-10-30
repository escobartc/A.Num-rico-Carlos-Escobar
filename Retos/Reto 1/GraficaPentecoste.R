#PENTECOSTE

library(pracma)
library(readxl)


#Se realiza la lectura del archivo xls con los datos originales, se indica en que hoja se leen los datos.
# Se guradan los datos en datosTemperatura
datosTemperatura = read_excel("C:/Kamigueen/Octavo semestre/Análisis numerico/Parcial3/Reto clima/datosClima.xls", 
                              sheet = "Pentecoste")

tamHoja = length(datosTemperatura$`Temp. Interna (ºC)`)
#Se almacena en el eje x los datos asociados al tiempo, ya que cada dato se toma cada hora.  
x = seq(1,length(datosTemperatura$`Temp. Interna (ºC)`),1)
# Como variable a graficar se toma la temperatura interna.
y = datosTemperatura$`Temp. Interna (ºC)`

plot(x,y, type = "line", main = "Datos iniciales", ylab = "Temperaturas internas", xlab = "Horas transcurridas")