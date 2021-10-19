library(PolynomF)
x=c(1,2,5,6,7,  8,10,13,17,  17,20,23,24,  25,27,27.7,  27.7,28,29,30,  1,5.39,8.62,  7.9,8.1,  8.62,7.9,  9,11.5,13.76,  16.95,20.22,23.5,  26.83,28,30)
y=c(3,3.7,3.9,4.2,5.7,6.6,7.1,6.7,4.5,4.5,7,6.1,5.6,5.8,5.2,4.1,4.1,4.3,4.1,3,3,2.8,3.16,2.03,2.6,3.16,2.03,1.9,2.15,1.85,1.85,1.8,1.55,2,2.4,3)
n=9
plot(x,y, pch=20, main = paste("Interpolacion del perrito"),xlim=c(0,31),ylim=c(0,9),asp=1)

originalesX=c(2,3 ,4, 5, 9, 12, 16, 17, 18, 22, 23, 15,21,22,25 )
originalesY=c(3.2, 3.69, 3.7, 3.9, 7 ,7.19, 5.14,4.6, 5.88, 6.95,7, 1.5,1.08,1 ,1 )

errorSpline = c()
errorLagrange=c()

#x  -> 1 - 6
segmentoX1 = c(x[1:4])
segmentoY1 = c(y[1:4])
splines = splinefun(segmentoX1,segmentoY1, method = "fmm")
splines2 =spline(segmentoX1, segmentoY1)
curve(splines(x), add = TRUE, col = 2, from = segmentoX1[1], to = segmentoX1[length(segmentoX1)])
for(i in 1:3){
  errorSpline[i]= round((abs(originalesY[i]-splines(i)))/originalesY[i],2)
}


#x  -> 7 - 10
segmentoX2 = c(x[4:7])
segmentoY2 = c(y[4:7])
splines = splinefun(segmentoX2,segmentoY2, method = "fmm")
curve(splines(x), add = TRUE, col = 2, from = segmentoX2[1], to = segmentoX2[length(segmentoX2)])
errorSpline[5]= round((abs(originalesY[5]-splines(5)))/originalesY[5],2)



#x  -> 13 - 17
segmentoX3 = c(x[7:10])
segmentoY3 = c(y[7:10])
splines = splinefun(segmentoX3,segmentoY3, method = "fmm")
curve(splines(x), add = TRUE, col = 2, from = segmentoX3[1], to = segmentoX3[length(segmentoX3)])
for(i in 6:9){
  errorSpline[i]= round((abs(originalesY[i]-splines(i)))/originalesY[i],2)
}
for(i in 10:11){
  errorSpline[i]= round((abs(originalesY[i]-splines(i)))/originalesY[i],2)
}

#x  -> 20 - 24
segmentoX4 = c(x[10:13])
segmentoY4 = c(y[10:13])
splines = splinefun(segmentoX4,segmentoY4, method = "fmm")
curve(splines(x), add = TRUE, col = 2, from = segmentoX4[1], to = segmentoX4[length(segmentoX4)])



#x  -> 25 - 27.7
segmentoX5 = c(x[13:16])
segmentoY5 = c(y[13:16])
splines = splinefun(segmentoX5,segmentoY5, method = "fmm")
curve(splines(x), add = TRUE, col = 2, from = segmentoX5[1], to = segmentoX5[length(segmentoX5)])


#x  -> 27.7 - 29
segmentoX6 = c(x[16:19])
segmentoY6 = c(y[16:19])
splines = splinefun(segmentoX6,segmentoY6, method = "fmm")
curve(splines(x), add = TRUE, col = 2, from = segmentoX6[1], to = segmentoX6[length(segmentoX6)])

#x  -> 30
segmentoX7 = c(x[19:20])
segmentoY7 = c(y[19:20])
splines = splinefun(segmentoX7,segmentoY7, method = "fmm")
curve(splines(x), add = TRUE, col = 2, from = segmentoX7[1], to = segmentoX7[length(segmentoX7)])


#x  -> 1 - 8.62
segmentoX8 = c(x[21:23])
segmentoY8 = c(y[21:23])
splines = splinefun(segmentoX8,segmentoY8, method = "fmm")
curve(splines(x), add = TRUE, col = 2, from = segmentoX8[1], to = segmentoX8[length(segmentoX8)])

#x  -> 7.9 - 8.1
segmentoX9 = c(x[23:25])
segmentoY9 = c(y[23:25])
splines = splinefun(segmentoX9,segmentoY9, method = "fmm")
curve(splines(x), add = TRUE, col = 2, from = segmentoX9[1], to = segmentoX9[length(segmentoX9)])

#x  -> 8.62 - 7.9
segmentoX10 = c(x[25:27])
segmentoY10 = c(y[25:27])
splines = splinefun(segmentoX10,segmentoY10, method = "fmm")
curve(splines(x), add = TRUE, col = 2, from = segmentoX10[1], to = segmentoX10[length(segmentoX10)])

#x  -> 9 - 11.5
segmentoX11 = c(x[27:29])
segmentoY11 = c(y[27:29])
splines = splinefun(segmentoX11,segmentoY11, method = "fmm")
curve(splines(x), add = TRUE, col = 2, from = segmentoX11[1], to = segmentoX11[length(segmentoX11)])

#x  -> 13.76 - 16.95
segmentoX12 = c(x[29:31])
segmentoY12 = c(y[29:31])
splines = splinefun(segmentoX12,segmentoY12, method = "fmm")
curve(splines(x), add = TRUE, col = 2, from = segmentoX12[1], to = segmentoX12[length(segmentoX12)])
errorSpline[12]= round((abs(originalesY[12]-splines(12)))/originalesY[12],2)

#x  -> 20.22 - 26.83
segmentoX13 = c(x[31:34])
segmentoY13 = c(y[31:34])
splines = splinefun(segmentoX13,segmentoY13, method = "fmm")
curve(splines(x), add = TRUE, col = 2, from = segmentoX13[1], to = segmentoX13[length(segmentoX13)])
errorSpline[13]= round((abs(originalesY[13]-splines(13)))/originalesY[13],2)
for(i in 14:15){
  errorSpline[i]= round((abs(originalesY[i]-splines(i)))/originalesY[i],2)
}

segmentoX14 = c(x[34:35])
segmentoY14 = c(y[34:35])
splines = splinefun(segmentoX14,segmentoY14, method = "fmm")
curve(splines(x), add = TRUE, col = 2, from = segmentoX14[1], to = segmentoX14[length(segmentoX14)])


#x  -> 28 - 30
segmentoX15 = c(x[34:36])
segmentoY15 = c(y[34:36])
splines = splinefun(segmentoX15,segmentoY15, method = "fmm")
curve(splines(x), add = TRUE, col = 2, from = segmentoX15[1], to = segmentoX15[length(segmentoX15)])

print(originalesX)
print(errorSpline)




n=9
#x -> 1 -7

intervaloX1=x[1:5]
intervaloY1=y[1:5]
lagrange = poly_from_values(intervaloX1,intervaloY1)
curve(lagrange,from=1,to=7,add=T, lwd=1)
for(i in 1:4){
  errorLagrange[i]= round((abs(originalesY[i]-lagrange(i)))/originalesY[i],2)
}

#x -> 8 -17
intervaloX1=x[5:9]
intervaloY1=y[5:9]
lagrange = poly_from_values(intervaloX1,intervaloY1)
curve(lagrange,from=7,to=17,add=T, lwd=1)
for(i in 5:8){
  errorLagrange[i]= round((abs(originalesY[i]-lagrange(i)))/originalesY[i],2)
}
for(i in 9:11){
  errorLagrange[i]= round((abs(originalesY[i]-lagrange(i)))/originalesY[i],2)
}

#x -> 17 -24
intervaloX1=x[9:13]
intervaloY1=y[9:13]
lagrange = poly_from_values(intervaloX1,intervaloY1)
curve(lagrange,from=17,to=24,add=T, lwd=1)


#x -> 25 -27.7
intervaloX1=x[13:16]
intervaloY1=y[13:16]
lagrange = poly_from_values(intervaloX1,intervaloY1)
curve(lagrange,from=24,to=27.7,add=T, lwd=1)

#x -> 27.7 -30
intervaloX1=x[16:20]
intervaloY1=y[16:20]
lagrange = poly_from_values(intervaloX1,intervaloY1)
curve(lagrange,from=27.7,to=30,add=T, lwd=1)

#x -> 1 -8.62
intervaloX1=x[21:23]
intervaloY1=y[21:23]
lagrange = poly_from_values(intervaloX1,intervaloY1)
curve(lagrange,from=1,to=8.62,add=T, lwd=1)

#x -> 7.9 -8.1
intervaloX1=x[23:25]
intervaloY1=y[23:25]
lagrange = poly_from_values(intervaloX1,intervaloY1)
curve(lagrange,from=8.62,to=7.9,add=T, lwd=1)

#x -> 8.62 - 7.9 -7
intervaloX1=x[25:27]
intervaloY1=y[25:27]
lagrange = poly_from_values(intervaloX1,intervaloY1)
curve(lagrange,from=8.1,to=8.62,add=T, lwd=1)

#x -> 9 -13.76
intervaloX1=x[27:30]
intervaloY1=y[27:30]
lagrange = poly_from_values(intervaloX1,intervaloY1)
curve(lagrange,from=8.1,to=13.76,add=T, lwd=1)

#x -> 16.95 -23.5
intervaloX1=x[30:33]
intervaloY1=y[30:33]
lagrange = poly_from_values(intervaloX1,intervaloY1)
curve(lagrange,from=13.76,to=23.5,add=T, lwd=1)

for(i in 12:14){
  errorLagrange[i]= round((abs(originalesY[i]-lagrange(i)))/originalesY[i],2)
}
errorLagrange[15]= round((abs(originalesY[15]-lagrange(15)))/originalesY[15],2)

#x -> 26.83 -30
intervaloX1=x[33:36]
intervaloY1=y[33:36]
lagrange = poly_from_values(intervaloX1,intervaloY1)
curve(lagrange,from=23.5,to=30,add=T, lwd=1)


print(errorLagrange)
print(originalesX)

plot(originalesX,errorSpline, pch=20, main = paste("Error Spline"),xlim=c(0,31),ylim=c(0,9),asp=1 )
lines(originalesX[order(originalesX)], errorSpline[order(originalesX)], xlim=range(originalesX), ylim=range(errorSpline), pch=16)

plot(originalesX,errorLagrange, pch=20, main = paste("Error Lagrange"),xlim=c(0,31),ylim=c(0,9),asp=1 )
lines(originalesX[order(originalesX)], errorLagrange[order(originalesX)], xlim=range(originalesX), ylim=range(errorLagrange), pch=16, col = 2)